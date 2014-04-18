/*******************************************************************************
 * Copyright (c) 2014 BestSolution.at and others.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *     Tom Schindl <tom.schindl@bestsolution.at> - initial API and implementation
 *******************************************************************************/
package at.bestsolution.persistence.emap.generator

import at.bestsolution.persistence.emap.eMap.EAttribute
import at.bestsolution.persistence.emap.eMap.EMapping
import at.bestsolution.persistence.emap.eMap.EMappingEntity
import at.bestsolution.persistence.emap.eMap.EMappingEntityDef
import org.eclipse.emf.ecore.EClass
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.IFileSystemAccess
import org.eclipse.xtext.generator.IGenerator
import at.bestsolution.persistence.emap.eMap.ReturnType
import at.bestsolution.persistence.emap.eMap.EObjectSection
import java.util.List
import at.bestsolution.persistence.emap.eMap.EParameter
import at.bestsolution.persistence.emap.eMap.EMappingAttribute
import at.bestsolution.persistence.emap.eMap.EMappingBundle
import org.eclipse.emf.ecore.EReference
import com.google.inject.Inject

/**
 * Generates code from your model files on save.
 *
 * see http://www.eclipse.org/Xtext/documentation.html#TutorialCodeGeneration
 */
class EMapGenerator implements IGenerator {

	@Inject extension
	var UtilCollection util;

	@Inject
	var DDLGenerator ddlGenerator;

	@Inject
	var JavaObjectMapperGenerator javaObjectMapperGenerator;

	override void doGenerate(Resource resource, IFileSystemAccess fsa) {
		val root = resource.contents.head as EMapping
		if( root.root instanceof EMappingEntityDef ) {
			val edef = root.root as EMappingEntityDef
			if( edef.entity.abstract ) {
				return;
			}
			fsa.generateFile(edef.package.name.replace('.','/')+"/"+edef.entity.name + "Mapper.java", generateJavaMapper(edef, edef.entity.etype.lookupEClass))
			fsa.generateFile(edef.package.name.replace('.','/')+"/java/"+edef.entity.name + "MapperFactory.java", javaObjectMapperGenerator.generateJava(edef, edef.lookupEClass));


			for( namedQuery : edef.entity.namedQueries ) {
				for( query : namedQuery.queries ) {
					fsa.generateFile(edef.package.name.replace('.','/')+"/java/"+edef.entity.name + "_" + namedQuery.name + "_" + query.dbType +".sql", javaObjectMapperGenerator.generateSQL(namedQuery,query));
					if( namedQuery.parameters.empty ) {
						fsa.generateFile(edef.package.name.replace('.','/')+"/java/"+edef.entity.name + "_" + namedQuery.name + "_criteria_" + query.dbType +".sql", javaObjectMapperGenerator.generateCriteriaSQL(namedQuery,query));
					}
				}
			}

//			println("Generating " + edef.entity.name+"Mapper.xml");
//			fsa.generateFile("mappers/"+edef.entity.name+"Mapper.xml", generateMappingXML(edef, javaHelper.getEClass(edef.entity.etype)))
		} else {
			val bundleDef = root.root as EMappingBundle
//			fsa.generateFile("mappings/"+bundleDef.name+"MappingUnitProvider.java", generateBundleContribution(bundleDef));
//			fsa.generateFile("mappings/"+bundleDef.name+"SqlMetaDataProvider.java", generateSqlMetaDataProvider(bundleDef));
			fsa.generateFile("mappings/"+bundleDef.name+"ObjectMapperFactoriesProvider.java",javaObjectMapperGenerator.generateMapperRegistry(bundleDef))
			for( d : bundleDef.databases ) {
				fsa.generateFile("ddls/create_"+d+".sql",ddlGenerator.generatedDDL(bundleDef,getDatabaseSupport(d)));
			}
		}
	}

	def generateSqlMetaDataProvider(EMappingBundle bundleDef) '''
	package mappings;

	import at.bestsolution.persistence.mybatis.SqlMetaDataProvider;

	import java.util.Collections;
	import java.util.HashSet;
	import java.util.HashMap;
	import java.util.Map;
	import java.util.Set;

	@SuppressWarnings("restriction")
	public class «bundleDef.name»SqlMetaDataProvider implements SqlMetaDataProvider {
		private Set<Table> tableSet = new HashSet<Table>();
		public «bundleDef.name»SqlMetaDataProvider() {
			«FOR e : bundleDef.entities»
			{
				Set<Column> colSet = new HashSet<Column>();
				«val pk = e.collectDerivedAttributes.values.findFirst[pk]»
				«FOR a : e.collectDerivedAttributes.values»
					«IF a.columnName != null»
						colSet.add(new Column(«a.pk»,"«a.columnName»"));
					«ELSEIF a.parameters.size == 1 && a.parameters.head != pk.columnName»
						colSet.add(new Column(false,"«a.parameters.head»"));
					«ENDIF»
				«ENDFOR»
				tableSet.add(new Table("«e.calcTableName»",colSet));
			}
			«ENDFOR»
		}

		public Set<Table> getTables() {
			return Collections.unmodifiableSet(tableSet);
		}
	}
	'''

	def generateBundleContribution(EMappingBundle bundleDef) '''
		package mappings;

		import at.bestsolution.persistence.mybatis.MappingProvider;
		import at.bestsolution.persistence.mybatis.mapper.URLMappingUnit;

		import java.util.List;
		import java.util.ArrayList;
		import java.util.Collections;

		@SuppressWarnings("restriction")
		public class «bundleDef.name»MappingUnitProvider implements MappingProvider {
			private List<MappingUnit> units;

			public «bundleDef.name»MappingUnitProvider() {
				units = new ArrayList<MappingUnit>();
				«FOR e : bundleDef.entities»
					«var eClass = e.lookupEClass»
					units.add(new URLMappingUnit("mappers/«e.name»Mapper.xml",
						«eClass.instanceClassName».class,
						«eClass.instanceClassName»Mapper.class,
						«eClass.packageName».«eClass.EPackage.name.toFirstUpper»Package.eINSTANCE.get«eClass.name»(),getClass().getClassLoader().getResource("mappers/«e.name»Mapper.xml")));
				«ENDFOR»
			}

			public List<MappingUnit> getMappingUnits() {
				return Collections.unmodifiableList(units);
			}
		}
	'''

	def generateJavaMapper(EMappingEntityDef entityDef, EClass eClass) '''
	package «entityDef.package.name»;

	import «eClass.instanceClassName»;

	public interface «entityDef.entity.name»Mapper extends «IF entityDef.entity.namedQueries.findFirst[name == "selectAll" && parameters.empty] != null»at.bestsolution.persistence.ConcreteObjectMapper<«eClass.instanceClassName»,«entityDef.entity.name»Mapper.«eClass.name»MappedQuery>«ELSE»at.bestsolution.persistence.ObjectMapper<«eClass.instanceClassName»>«ENDIF» {
		«FOR query : entityDef.entity.namedQueries»
		public «IF query.returnType == ReturnType::LIST»java.util.List<«ENDIF»«eClass.instanceClassName»«IF query.returnType == ReturnType::LIST»>«ENDIF» «query.name»(«query.parameters.join(",",[p|p.type + " " + p.name])»);
		«ENDFOR»

«««		«IF entityDef.entity.namedQueries.findFirst[parameters.empty] != null»
			public abstract class «eClass.name»MappedQuery implements at.bestsolution.persistence.MappedQuery<«eClass.name»> {
				public abstract «eClass.name»MappedQuery where(at.bestsolution.persistence.expr.Expression<«eClass.name»> expression);
			}

			public static final class Expression {
				«FOR a : entityDef.entity.collectAllAttributes.filterDups[t1,t2|return t1.getEAttribute(eClass).equals(t2.getEAttribute(eClass))].filter[isSingle(eClass)]»
					«IF a.resolved»
						public static final «((a.eResource.contents.head as EMapping).root as EMappingEntityDef).fqn».Join<«eClass.name»> «a.name»() { return new «((a.eResource.contents.head as EMapping).root as EMappingEntityDef).fqn».Join<«eClass.name»>("«a.name»");};
					«ELSE»
						«val eAttribute = a.getEAttribute(eClass)»
						«IF eAttribute.boolean»
							«IF eAttribute.primitive»
								public static final at.bestsolution.persistence.expr.PropertyExpressionFactory.BooleanExpressionFactory<«eClass.name»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.BooleanExpressionFactory<«eClass.name»>("«a.name»");};
							«ELSE»
								public static final at.bestsolution.persistence.expr.PropertyExpressionFactory.BooleanObjectExpressionFactory<«eClass.name»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.BooleanObjectExpressionFactory<«eClass.name»>("«a.name»");};
							«ENDIF»
						«ELSEIF eAttribute.integer»
							«IF eAttribute.primitive»
								public static final at.bestsolution.persistence.expr.PropertyExpressionFactory.IntegerExpressionFactory<«eClass.name»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.IntegerExpressionFactory<«eClass.name»>("«a.name»");};
							«ELSE»
								public static final at.bestsolution.persistence.expr.PropertyExpressionFactory.IntegerObjectExpressionFactory<«eClass.name»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.IntegerObjectExpressionFactory<«eClass.name»>("«a.name»");};
							«ENDIF»
						«ELSEIF eAttribute.long»
							«IF eAttribute.primitive»
								public static final at.bestsolution.persistence.expr.PropertyExpressionFactory.LongExpressionFactory<«eClass.name»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.LongExpressionFactory<«eClass.name»>("«a.name»");};
							«ELSE»
								public static final at.bestsolution.persistence.expr.PropertyExpressionFactory.LongObjectExpressionFactory<«eClass.name»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.LongObjectExpressionFactory<«eClass.name»>("«a.name»");};
							«ENDIF»
						«ELSEIF eAttribute.double»
							«IF eAttribute.primitive»
								public static final at.bestsolution.persistence.expr.PropertyExpressionFactory.DoubleExpressionFactory<«eClass.name»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.DoubleExpressionFactory<«eClass.name»>("«a.name»");};
							«ELSE»
								public static final at.bestsolution.persistence.expr.PropertyExpressionFactory.DoubleObjectExpressionFactory<«eClass.name»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.DoubleObjectExpressionFactory<«eClass.name»>("«a.name»");};
							«ENDIF»
						«ELSEIF eAttribute.float»
							«IF eAttribute.primitive»
								public static final at.bestsolution.persistence.expr.PropertyExpressionFactory.FloatExpressionFactory<«eClass.name»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.FloatExpressionFactory<«eClass.name»>("«a.name»");};
							«ELSE»
								public static final at.bestsolution.persistence.expr.PropertyExpressionFactory.FloatObjectExpressionFactory<«eClass.name»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.FloatObjectExpressionFactory<«eClass.name»>("«a.name»");};
							«ENDIF»
						«ELSEIF eAttribute.string»
							public static final at.bestsolution.persistence.expr.PropertyExpressionFactory.StringExpressionFactory<«eClass.name»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.StringExpressionFactory<«eClass.name»>("«a.name»");};
						«ELSE»
							public static final at.bestsolution.persistence.expr.PropertyExpressionFactory.GenericExpressionFactory<«eClass.name»,«eAttribute.EType.instanceClassName»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.GenericExpressionFactory<«eClass.name»,«eAttribute.EType.instanceClassName»>("«a.name»");};
						«ENDIF»
					«ENDIF»
				«ENDFOR»
			}

			public static final class Order {
				«FOR a : entityDef.entity.collectAllAttributes.filterDups[t1,t2|return t1.getEAttribute(eClass).equals(t2.getEAttribute(eClass))].filter[isSingle(eClass)]»
					«IF ! a.resolved»
					public static final at.bestsolution.persistence.order.OrderColumnFactory<«eClass.name»> «a.name»() { return new at.bestsolution.persistence.order.OrderColumnFactory<«eClass.name»>("«a.name»");};
					«ENDIF»
				«ENDFOR»
			}

			public static final class Join<O> {
				private final String path;
				public Join(String path) {
					this.path = path;
				}

				«FOR a : entityDef.entity.collectAllAttributes.filterDups[t1,t2|return t1.getEAttribute(eClass).equals(t2.getEAttribute(eClass))].filter[isSingle(eClass)]»
					«IF a.resolved»
«««						public final «((a.eResource.contents.head as EMapping).root as EMappingEntityDef).fqn».Join<O> «a.name»() {return new «((a.eResource.contents.head as EMapping).root as EMappingEntityDef).fqn».Join<O>(path+".«a.name»");};
					«ELSE»
						«val eAttribute = a.getEAttribute(eClass)»
						«IF eAttribute.boolean»
							«IF eAttribute.primitive»
								public final at.bestsolution.persistence.expr.PropertyExpressionFactory.BooleanExpressionFactory<O> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.BooleanExpressionFactory<O>(path+".«a.name»");};
							«ELSE»
								public final at.bestsolution.persistence.expr.PropertyExpressionFactory.BooleanObjectExpressionFactory<O> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.BooleanObjectExpressionFactory<O>(path+".«a.name»");};
							«ENDIF»
						«ELSEIF eAttribute.integer»
							«IF eAttribute.primitive»
								public final at.bestsolution.persistence.expr.PropertyExpressionFactory.IntegerExpressionFactory<O> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.IntegerExpressionFactory<O>(path+".«a.name»");};
							«ELSE»
								public final at.bestsolution.persistence.expr.PropertyExpressionFactory.IntegerObjectExpressionFactory<O> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.IntegerObjectExpressionFactory<O>(path+".«a.name»");};
							«ENDIF»
						«ELSEIF eAttribute.long»
							«IF eAttribute.primitive»
								public final at.bestsolution.persistence.expr.PropertyExpressionFactory.LongExpressionFactory<O> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.LongExpressionFactory<O>(path+".«a.name»");};
							«ELSE»
								public final at.bestsolution.persistence.expr.PropertyExpressionFactory.LongObjectExpressionFactory<O> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.LongObjectExpressionFactory<O>(path+".«a.name»");};
							«ENDIF»
						«ELSEIF eAttribute.double»
							«IF eAttribute.primitive»
								public final at.bestsolution.persistence.expr.PropertyExpressionFactory.DoubleExpressionFactory<O> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.DoubleExpressionFactory<O>(path+".«a.name»");};
							«ELSE»
								public final at.bestsolution.persistence.expr.PropertyExpressionFactory.DoubleObjectExpressionFactory<O> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.DoubleObjectExpressionFactory<O>(path+".«a.name»");};
							«ENDIF»
						«ELSEIF eAttribute.float»
							«IF eAttribute.primitive»
								public final at.bestsolution.persistence.expr.PropertyExpressionFactory.FloatExpressionFactory<O> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.FloatExpressionFactory<O>(path+".«a.name»");};
							«ELSE»
								public final at.bestsolution.persistence.expr.PropertyExpressionFactory.FloatObjectExpressionFactory<O> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.FloatObjectExpressionFactory<O>(path+".«a.name»");};
							«ENDIF»
						«ELSEIF eAttribute.string»
							public final at.bestsolution.persistence.expr.PropertyExpressionFactory.StringExpressionFactory<O> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.StringExpressionFactory<O>(path+".«a.name»");};
						«ELSE»
							public final at.bestsolution.persistence.expr.PropertyExpressionFactory.GenericExpressionFactory<O,«eAttribute.EType.instanceClassName»> «a.name»() { return new at.bestsolution.persistence.expr.PropertyExpressionFactory.GenericExpressionFactory<O,«eAttribute.EType.instanceClassName»>(path+".«a.name»");};
						«ENDIF»
					«ENDIF»
				«ENDFOR»
			}
			«FOR query : entityDef.entity.namedQueries.filter[parameters.empty]»
				public «eClass.name»MappedQuery «query.name»MappedQuery();
			«ENDFOR»
«««		«ENDIF»
	}
	'''

	def generateMappingXML(EMappingEntityDef entityDef, EClass eClass) '''
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
  PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="«eClass.instanceClassName»Mapper">
	«FOR query : entityDef.entity.namedQueries»
		<select id="«query.name»"
			«IF ! query.parameters.empty»parameterType="«IF query.parameters.size > 1»HashMap«ELSE»«query.parameters.head.type»«ENDIF»"«ENDIF»
			«IF query.queries.head.mapping.attributes.empty && entityDef.entity.descriminationColumn == null»resultMap="Default_«eClass.name»Map"«ELSE»resultMap="«query.name»_«eClass.name»Map"«ENDIF»>
			SELECT
				«IF query.queries.head.mapping.attributes.empty»
					*
				«ELSE»
					«query.queries.head.mapping.mapColumns»
				«ENDIF»
			FROM
				«query.queries.head.from.replaceParameters(query.parameters)»
			«IF query.queries.head.where != null»WHERE
				«query.queries.head.where.replaceParameters(query.parameters)»«ENDIF»
			«IF query.queries.head.groupBy != null»GROUP BY
				«query.queries.head.groupBy.replaceParameters(query.parameters)»«ENDIF»
			«IF query.queries.head.orderby != null»ORDER BY
				«query.queries.head.orderby.replaceParameters(query.parameters)»«ENDIF»
		</select>
		«IF !query.queries.head.mapping.attributes.empty»
		<resultMap id="«query.name»_«eClass.name»Map" type="«eClass.instanceClassName»">
			«query.queries.head.mapping.objectSectionMap»
		</resultMap>
		«ELSEIF entityDef.entity.descriminationColumn != null»
		<resultMap id="«query.name»_«eClass.name»Map" type="«eClass.instanceClassName»">
			«attrib_resultMapContent(entityDef.entity.allAttributes, eClass, "")»
			<discriminator javaType="java.lang.String" column="«entityDef.entity.descriminationColumn»">
				«FOR d : query.queries.head.mapping.descriminatedTypes»
				<case value="«d.name»" resultMap="«d.fqn».Default_«d.name»Map" />
				«ENDFOR»
			</discriminator>
		</resultMap>
		«ENDIF»
	«ENDFOR»
	<resultMap id="Default_«eClass.name»Map" type="«eClass.instanceClassName»">
		«attrib_resultMapContent(entityDef.entity.allAttributes, eClass, "")»
	</resultMap>
	«val pkAttribute = entityDef.entity.collectDerivedAttributes.values.findFirst[pk]»
	«IF pkAttribute == null || entityDef.entity.extensionType == "extends"»
		«generateInsert(entityDef,eClass,null,null)»
	«ELSE»
		«val dbSupport = pkAttribute.findDatabaseSupport»
		«IF dbSupport != null»
			«FOR d : dbSupport»
				«generateInsert(entityDef,eClass,pkAttribute,d)»
			«ENDFOR»
		«ENDIF»
	«ENDIF»

	<update id="update">
		UPDATE
			«entityDef.tableName»
		<set>
			«FOR a : entityDef.entity.collectDerivedAttributes.values.filter[
					if( pk ) {
						return false;
					} if(eClass.getEStructuralFeature(name) instanceof EReference) {
						val r = eClass.getEStructuralFeature(name) as EReference;
						if( r.containment ) {
							return false;
						}
						return true;
					} else {
						return true;
					}
				].sort([a,b|return sortAttributes(eClass,a,b)])»
				«IF a.columnName != null»
					«a.columnName» = #{«a.name»},
				«ELSEIF a.isSingle(eClass)»
					<if test="_isResolved_«a.name»">«a.parameters.head» = #{«a.name».«(a.query.eContainer as EMappingEntity).allAttributes.findFirst[pk].name»},</if>
				«ENDIF»
			«ENDFOR»
		</set>
		WHERE
			«entityDef.entity.allAttributes.findFirst[pk].columnName» = #{«entityDef.entity.allAttributes.findFirst[pk].name»}
	</update>
</mapper>
	'''

	def generateInsert(EMappingEntityDef entityDef, EClass eClass, EAttribute pkAttribute, DatabaseSupport dbSupport) '''
	<insert id="insert" parameterType="«eClass.instanceClassName»"
		«IF dbSupport != null»databaseId="«dbSupport.databaseId»" «IF dbSupport.supportsGeneratedKeys»useGeneratedKeys="true" keyProperty="«pkAttribute.name»"«ENDIF»«ENDIF»>
		«IF dbSupport != null»
			«dbSupport.processInsert(pkAttribute,insertSQL(entityDef,eClass,pkAttribute,dbSupport).toString)»
		«ELSE»
			«insertSQL(entityDef,eClass,pkAttribute,dbSupport)»
		«ENDIF»
	</insert>
	'''

	def insertSQL(EMappingEntityDef entityDef, EClass eClass, EAttribute pkAttribute, DatabaseSupport dbSupport) '''
	«val gen = if(pkAttribute == null) null else pkAttribute.valueGenerators.findFirst[dbType==dbSupport.databaseId]»
	INSERT INTO «entityDef.tableName»
	(
		<trim suffixOverrides=','>
			«IF pkAttribute != null && gen.sequence != null»
				«pkAttribute.columnName»,
			«ENDIF»
			«FOR a : entityDef.entity.collectDerivedAttributes.values.filter[
					if( pk && entityDef.entity.extensionType != "extends" ) {
						return false;
					} if(eClass.getEStructuralFeature(name) instanceof EReference) {
						val r = eClass.getEStructuralFeature(name) as EReference;
						if( r.containment ) {
							return false;
						}
						return true;
					} else {
						return true;
					}
			].sort([a,b|return sortAttributes(eClass,a,b)])»
				«IF a.columnName != null»
				«a.columnName»,
				«ELSEIF a.isSingle(eClass)»
				«a.parameters.head»,
				«ENDIF»
			«ENDFOR»
			«IF entityDef.entity.descriminationColumn != null»
				«entityDef.entity.descriminationColumn»
			«ENDIF»
		</trim>
	)
	VALUES
	(
		<trim suffixOverrides=','>
			«IF pkAttribute != null»
				«IF gen.sequence != null»
					«dbSupport.getSequenceStatement(pkAttribute)»,
				«ENDIF»
			«ELSEIF entityDef.entity.extensionType == "extends"»
				#{«entityDef.entity.attributes.findFirst[pk].name»},
			«ENDIF»
			«FOR a : entityDef.entity.collectDerivedAttributes.values.filter[if( pk ) {
						return false;
					} if(eClass.getEStructuralFeature(name) instanceof EReference) {
						val r = eClass.getEStructuralFeature(name) as EReference;
						if( r.containment ) {
							return false;
						}
						return true;
					} else {
						return true;
					}
				].sort([a,b|return sortAttributes(eClass,a,b)])»
				«IF a.columnName != null»
					#{«a.name»},
				«ELSEIF a.isSingle(eClass)»
					#{«a.name».«(a.query.eContainer as EMappingEntity).allAttributes.findFirst[pk].name»},
				«ENDIF»
			«ENDFOR»
			«IF entityDef.entity.descriminationColumn != null»
				#{_classname}
			«ENDIF»
		</trim>
	)
	'''

	def attrib_resultMapContent(Iterable<EAttribute> attributes, EClass eClass, String columnPrefix) '''
	<!-- Default mapping -->
	«FOR a : attributes.sort([a,b|
		val iA = a.sortValue(eClass)
		val iB = b.sortValue(eClass)
		if(iA < iB) {
			return -1
		}
		else if(iA == iB) {
			return 0
		} else {
			return 1;
		}
	])»
		«IF a.pk»
			<id property="«a.name»" column="«columnPrefix»«a.columnName»" />
		«ELSE»
			«IF a.resolved»
				«IF a.isSingle(eClass)»
					<association property="«a.name»" column="«columnPrefix»«a.parameters.head»" select="«a.query.fqn»"/>
				«ELSE»
					<collection property="«a.name»" column="«columnPrefix»«attributes.head.columnName»" select="«a.query.fqn»" />
				«ENDIF»
			«ELSE»
				<result property="«a.name»" column="«columnPrefix»«a.columnName»" />
			«ENDIF»
		«ENDIF»
	«ENDFOR»
	'''

	def mappedattrib_resultMapContent(Iterable<EMappingAttribute> attributes, EClass eClass, String columnPrefix) '''
	<!-- MAPPED -->
	«FOR a : attributes»
		«IF a.pk»
			<id property="«a.property»" column="«a.columnName»" />
		«ELSE»
			«IF a.resolved»
				«IF a.isSingle(eClass)»
					<association property="«a.property»" column="«a.parameters.head»" select="«a.query.fqn»"/>
				«ELSE»
					<collection property="«a.property»" select="«a.query.fqn»" />
				«ENDIF»
			«ELSEIF a.mapped»
				«IF a.isSingle(eClass)»
					<association property="«a.property»" javaType="«a.map.entity.lookupEClass.instanceClassName»">
						«a.map.objectSectionMap»
					</association>
				«ELSE»
					<collection property="«a.property»" ofType="«a.map.entity.lookupEClass.instanceClassName»">
						«a.map.objectSectionMap»
					</collection>
				«ENDIF»
			«ELSE»
				<result property="«a.property»" column="«a.columnName»" />
			«ENDIF»
		«ENDIF»
	«ENDFOR»
	'''

	def CharSequence objectSectionMap(EObjectSection section) '''
	«attrib_resultMapContent(section.entity.allAttributes.filter[a|section.attributes.findFirst[ma|ma.property == a.name] == null], section.entity.lookupEClass, section.prefix+"_")»
	«mappedattrib_resultMapContent(section.attributes, section.entity.lookupEClass,section.prefix+"_")»
	'''
//	{
//		val attrs = section.entity.collectAttributes
//		for( attr : section.attributes ) {
//			attrs.remove(attrs.findFirst[a|a.property == attr.property])
//		}
//
//
//
//		return "";
//	}

	def replaceParameters(String v, List<EParameter> parameters) {
		if( parameters.empty ){
			return v;
		} else if( parameters.size == 1 ) {
			if( parameters.head.type.isPrimitive ) {
				return v.replace("${"+parameters.head.name+"}","#{id}");
			}
			return v.replace("${"+parameters.head.name+".","#{");
		} else {
			return v.replace("${","#{");
		}
	}



}
