/*******************************************************************************
 * Copyright (c) 2014 BestSolution.at and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Christoph Caks <ccaks@bestsolution.at> - initial API and implementation
 *******************************************************************************/
package at.bestsolution.persistence.java.query;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EReference;

import at.bestsolution.persistence.expr.Expression;
import at.bestsolution.persistence.expr.ExpressionType;
import at.bestsolution.persistence.expr.QueryFunction;
import at.bestsolution.persistence.expr.GroupExpression;
import at.bestsolution.persistence.expr.PropertyExpression;
import at.bestsolution.persistence.expr.RangeExpression.Range;
import at.bestsolution.persistence.java.JavaObjectMapper;
import at.bestsolution.persistence.order.OrderColumn;

public class MappedBaseQuery<O> {
	public static class Join {
		public final String joinTable;
		public final String joinAlias;
		public final String joinColumn;
		
		public final String otherAlias;
		public final String otherColumn;
		
		public Join(String joinTable, String joinAlias, String joinColumn, String otherAlias, String otherColumn) {
			this.joinTable = joinTable;
			this.joinAlias = joinAlias;
			this.joinColumn = joinColumn;
			
			this.otherAlias = otherAlias;
			this.otherColumn = otherColumn;
		}
	}

	protected void appendValue(List<TypedValue> rv, JavaObjectMapper<?> mapper, Expression<O> expression) {
		switch (expression.type) {
		case AND:
		case OR:
			for (Expression<O> e : ((GroupExpression<O>) expression).expressions) {
				appendValue(rv, mapper, e);
			}
			break;
		case IN:
		case NOT_IN:
		{
			PropertyExpression<O> e = (PropertyExpression<O>)expression;
			JDBCType jdbcType = mapper.getJDBCType(e.property);
			if( ! jdbcType.numeric ) {
				for( Object data : e.data ) {
					rv.add( new TypedValue( data instanceof EObject ? ((EObject)data).eGet(mapper.getReferenceId(e.property)) : data, jdbcType));
				}
			}
			break;
		}
		case IS_NOT_NULL:
		case IS_NULL:
			// skip it
			break;
		case LIKE:
		case ILIKE:
		case NOT_ILIKE:
		case NOT_LIKE:
		{
			PropertyExpression<O> e = (PropertyExpression<O>)expression;
			for( Object data : e.data ) {
				rv.add( new TypedValue( data instanceof EObject ? ((EObject)data).eGet(mapper.getReferenceId(e.property)) : data, JDBCType.STRING));
			}
			break;
		}
		default:
		{
			PropertyExpression<O> e = (PropertyExpression<O>)expression;
			boolean hasFunctions = e.hasFunctions();
			JDBCType jdbcType = mapper.getJDBCType(e.property);
			if( hasFunctions ) {
				for( QueryFunction<?, ?, ?> f : e.getFunctions() ) {
					jdbcType = fromJavaType(f.getValueType());
				}
			}
			for( Object data : e.data ) {
				Object value = data instanceof EObject ? ((EObject)data).eGet(mapper.getReferenceId(e.property)) : data;
				if( hasFunctions ) {
					for( QueryFunction<O, ?, ?> f : e.getFunctions() ) {
						QueryFunction<O, Object, Object> ff = (QueryFunction<O, Object, Object>) f;
						value = ff.convert(value);
					}
				}
				rv.add( new TypedValue( value, jdbcType));
			}
			break;
		}
		}
	}

	private JDBCType fromJavaType(Class<?> type) {
		if( type == String.class ) {
			return JDBCType.STRING;
		} else if( type == int.class || type == Integer.class ) {
			return JDBCType.INT;
		} else if( type == long.class || type == Long.class ) {
			return JDBCType.LONG;
		} else if( type == double.class || type == Double.class ) {
			return JDBCType.DOUBLE;
		} else if( type == boolean.class || type == Boolean.class ) {
			return JDBCType.BOOLEAN;
		} else if( type == float.class || type == Float.class ) {
			return JDBCType.FLOAT;
		}
		return JDBCType.UNKNOWN;
	}

	protected void appendOrderColumn(StringBuilder b, OrderColumn<O> column) {
		if( b.length() != 0 ) {
			b.append(",");
		}
		b.append(column.column + (column.asc ? "ASC" : "DESC"));
	}

	protected String applyCriteriaFunction(String columnExpression, QueryFunction<O, ?, ?> function) {
			switch (function.getType()) {
			case LPAD:
				return "lpad("+columnExpression+", "+function.getData()[0]+")";
			default:
				break;
			}
			return columnExpression;
	}
	
	protected void appendJoinCriteria(LinkedHashSet<Join> joins, final JavaObjectMapper<?> mapper, final String colPrefix, final Expression<O> expression) {
		switch (expression.type) {
			case AND:
			case OR:
			{
				for (Expression<O> e : ((GroupExpression<O>) expression).expressions) {
					appendJoinCriteria(joins, mapper, colPrefix, e);
				}
				break;
			}
			default:
			{
				PropertyExpression<O> p = (PropertyExpression<O>) expression;
				if( p.property.contains(".") ) {
					
					String[] segments = p.property.split("\\.");
					
					String currentTableAlias = colPrefix;
					JavaObjectMapper<?> currentMapper = mapper;
					for( int i = 0; i < segments.length-1; i++ ) {
						JavaObjectMapper<?> oppositeMapper = currentMapper.createMapperForReference(segments[i]);
						
						String joinTable = oppositeMapper.getTableName();
						String joinAlias = "_e_" +segments[i];
						String joinColumn;
						
						//TODO Need to handle N:M
						
						String oldColumn;
						if( currentMapper.getColumnName(segments[i]) != null ) {
							// this means we are table with the FK
							joinColumn = oppositeMapper.getColumnName(currentMapper.getReferenceId(segments[i]).getName());
							oldColumn = currentMapper.getColumnName(segments[i]);
						} else {
							EReference r = (EReference) currentMapper.getEClass().getEStructuralFeature(segments[i]);
							joinColumn = oppositeMapper.getColumnName(r.getEOpposite().getName());
							oldColumn = currentMapper.getColumnName(oppositeMapper.getReferenceId(r.getEOpposite().getName()).getName());
						}
						
						joins.add(new Join(joinTable, joinAlias,joinColumn,currentTableAlias.isEmpty() ? null : currentTableAlias,oldColumn));
						
						currentMapper = oppositeMapper;
						currentTableAlias = joinAlias;
					}
				}
				break;
			}
		}
	}

	protected void appendCriteria(StringBuilder b, JavaObjectMapper<?> mapper, String colPrefix, Expression<O> expression) {
		String columnExpression = null;
		if (expression instanceof PropertyExpression) {
			PropertyExpression<O> propertyExpression = (PropertyExpression<O>) expression;
			if (propertyExpression.property.contains(".")) {
				String[] parts = propertyExpression.property.split("\\.");
				String lastType = "_e_" + parts[parts.length-2];
				columnExpression = quoteColumnName(lastType) + "." + quoteColumnName(mapper.getColumnName(propertyExpression.property));
			} else {
				columnExpression = colPrefix + quoteColumnName(mapper.getColumnName(propertyExpression.property));
			}
			
			for( QueryFunction<O, ?, ?> data : propertyExpression.getFunctions() ) {
				columnExpression = applyCriteriaFunction(columnExpression, data);
			}
		}

		switch (expression.type) {
		case AND: {
			b.append("(");
			boolean flag = false;
			for (Expression<O> e : ((GroupExpression<O>) expression).expressions) {
				if (flag) {
					b.append(" AND ");
				}
				appendCriteria(b, mapper, colPrefix, e);
				flag = true;
			}
			b.append(")");
			break;
		}
		case OR:
		{
			b.append("(");
			boolean flag = false;
			for (Expression<O> e : ((GroupExpression<O>) expression).expressions) {
				if (flag) {
					b.append(" OR ");
				}
				appendCriteria(b, mapper, colPrefix, e);
				flag = true;
			}
			b.append(")");
			break;
		}
		case EQUALS:
			b.append( columnExpression );
			b.append(" = ?");
			break;
		case IEQUALS:
			b.append( "lower( " + columnExpression + " )");
			b.append(" = lower( ? )");
			break;
		case NOT_EQUALS:
			b.append( columnExpression );
			b.append(" <> ?");
			break;
		case INOT_EQUALS:
			b.append( "lower( " + columnExpression + " )");
			b.append(" <> lower( ? )");
			break;
		case GT:
			b.append( columnExpression );
			b.append(" > ?");
			break;
		case GTE:
			b.append( columnExpression );
			b.append(" >= ?");
			break;
		case LT:
			b.append( columnExpression );
			b.append(" < ?");
			break;
		case LTE:
			b.append( columnExpression );
			b.append(" <= ?");
			break;
		case IS_NOT_NULL:
			b.append( columnExpression );
			b.append(" IS NOT NULL");
			break;
		case IS_NULL:
			b.append( columnExpression );
			b.append(" IS NULL");
			break;
		case ILIKE:
			b.append( columnExpression );
			b.append(" ILIKE ?");
			break;
		case LIKE:
			b.append( columnExpression );
			b.append(" LIKE ?");
			break;
		case NOT_ILIKE:
			b.append( columnExpression );
			b.append(" NOT ILIKE ?");
			break;
		case NOT_LIKE:
			b.append( columnExpression );
			b.append(" NOT LIKE ?");
			break;
		case IN:
		case NOT_IN:
		{
			String in = expression.type == ExpressionType.IN ? " IN " : " NOT IN ";
			//FIXME This can lead to SQL-Injection needs to be fixed!!!
			//TODO We could replace with a BETWEEN or >= & <= QUERY
			PropertyExpression<O> propExpression = (PropertyExpression<O>)expression;
			b.append( columnExpression );
			JDBCType jdbcType = mapper.getJDBCType(propExpression.property);
			if( jdbcType.numeric ) {
				b.append(" "+in+" ( "+ StringUtils.join(((PropertyExpression<O>)expression).data,',') +" )");
			} else {
				b.append(" "+in+" ( ");
				boolean flag = false;
				for( int i = 0; i < propExpression.data.size(); i++ ) {
					if( flag ) {
						b.append(",");
					}
					flag = true;
					b.append("?");
				}
				b.append(" )");
			}
			break;
		}
		case RANGE:
		{
			PropertyExpression<O> propExpression = (PropertyExpression<O>)expression;
			List<Object> invalues = new ArrayList<Object>();
			List<String> betweenSegements = new ArrayList<String>();
			for( Object data : propExpression.data ) {
				Range r = (Range) data;
				if( r.min.endsWith(r.max) ) {
					invalues.add(r.min);
				} else {
					betweenSegements.add( columnExpression + " >= ? AND " + columnExpression + " <= ?" );
				}
			}

			JDBCType jdbcType = mapper.getJDBCType(propExpression.property);
			if( ! invalues.isEmpty() ) {

			}
		}
		default:
			break;
		}
	}

	protected String quoteColumnName(String columnName) {
		return '"' + columnName + '"';
	}
}
