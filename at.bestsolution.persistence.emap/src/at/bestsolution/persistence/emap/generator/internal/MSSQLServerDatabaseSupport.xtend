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
package at.bestsolution.persistence.emap.generator.internal

import at.bestsolution.persistence.emap.generator.DatabaseSupport
import at.bestsolution.persistence.emap.eMap.EAttribute
import org.eclipse.emf.ecore.EDataType
import org.eclipse.emf.ecore.EEnum
import at.bestsolution.persistence.emap.eMap.EBundleEntity
import at.bestsolution.persistence.emap.generator.UtilCollection

class MSSQLServerDatabaseSupport extends DatabaseSupport {

	override getDatabaseId() {
		return "mssql";
	}

	override getSequenceStatementNextVal(EAttribute primaryKey) {
		return ""
	}

//	override getSequenceStatementCurVal(EAttribute primaryKey) {
//		return null;
//	}

//	override processInsert(EAttribute primaryKey, String insert) {
//		return insert;
//	}

	override isKeyGenerationTypeSupported(KeyGenerationType type) {
		return type == KeyGenerationType.AUTOKEY || type == KeyGenerationType.SEQNEXT || type == KeyGenerationType.QUERY
	}

	override supportsGeneratedKeys() {
		return true;
	}

	override getDatabaseType(EAttribute attribute, boolean fkResolve, EDataType dataType) {
		if( dataType instanceof EEnum ) {
			return "nvarchar(255)";
		} else if( "EInt" == dataType.name || "EIntegerObject" == dataType.name ) {
			return "int";
		} else if( "ELong" == dataType.name || "ELongObject" == dataType.name ) {
			return "bigint";
		} else if( "EDouble" == dataType.name || "EDoubleObject" == dataType.name || "EBigDecimal" == dataType.name ) {
			return "real";
		} else if( "EString" == dataType.name ) {
			return "nvarchar(255)"
		} else if( "java.sql.Clob" == dataType.instanceClassName ) {
			return "ntext"
		} else if( "java.sql.Blob" == dataType.instanceClassName ) {
			return "varbinary";
		} else if( "EBoolean" == dataType.name || "EBooleanObject" == dataType.name ) {
			return "bit"
		} else if( "EDate" == dataType.name ) {
			return "datetime";
		}
		return "***UNKOWN "+dataType.name+"***";
	}

	override getAutokeyDefinition(EAttribute primaryKey) {
		return "IDENTITY(1,1)";
	}

	override isPrimaryKeyPartOfColDef(EAttribute primaryKey) {
		return true;
	}
	
	override getPrimaryKeyCreateInlineContribution(UtilCollection util, EAttribute primaryKey) {
		'''PRIMARY KEY'''
	}
	
	override getPrimaryKeyCreateConstraintContribution(UtilCollection util, EBundleEntity bundleEntity, EAttribute primaryKey) {
		null
	}
	
	override getPrimaryKeyAlterContribution(UtilCollection util, EAttribute primaryKey) {
		null
	}

//	override supportsGeneratedKeyAsResultSet() {
//		return false;
//	}

}