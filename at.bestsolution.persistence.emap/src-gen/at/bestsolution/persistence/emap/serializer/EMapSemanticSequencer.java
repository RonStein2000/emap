/*
 * generated by Xtext
 */
package at.bestsolution.persistence.emap.serializer;

import at.bestsolution.persistence.emap.eMap.EAttribute;
import at.bestsolution.persistence.emap.eMap.EBundleEntity;
import at.bestsolution.persistence.emap.eMap.ECustomQuery;
import at.bestsolution.persistence.emap.eMap.EFkConstraint;
import at.bestsolution.persistence.emap.eMap.EIndex;
import at.bestsolution.persistence.emap.eMap.EMapPackage;
import at.bestsolution.persistence.emap.eMap.EMapping;
import at.bestsolution.persistence.emap.eMap.EMappingAttribute;
import at.bestsolution.persistence.emap.eMap.EMappingBundle;
import at.bestsolution.persistence.emap.eMap.EMappingEntity;
import at.bestsolution.persistence.emap.eMap.EMappingEntityDef;
import at.bestsolution.persistence.emap.eMap.EModelTypeAttribute;
import at.bestsolution.persistence.emap.eMap.EModelTypeDef;
import at.bestsolution.persistence.emap.eMap.ENamedCustomQuery;
import at.bestsolution.persistence.emap.eMap.ENamedQuery;
import at.bestsolution.persistence.emap.eMap.ENamedServiceQuery;
import at.bestsolution.persistence.emap.eMap.EObjectSection;
import at.bestsolution.persistence.emap.eMap.EParameter;
import at.bestsolution.persistence.emap.eMap.EPathParam;
import at.bestsolution.persistence.emap.eMap.EPredefinedType;
import at.bestsolution.persistence.emap.eMap.EQuery;
import at.bestsolution.persistence.emap.eMap.EQueryParam;
import at.bestsolution.persistence.emap.eMap.ERestServiceMapping;
import at.bestsolution.persistence.emap.eMap.ESQLAttTypeDef;
import at.bestsolution.persistence.emap.eMap.ESQLDbType;
import at.bestsolution.persistence.emap.eMap.ESQLTypeDef;
import at.bestsolution.persistence.emap.eMap.EType;
import at.bestsolution.persistence.emap.eMap.ETypeDef;
import at.bestsolution.persistence.emap.eMap.EUniqueConstraint;
import at.bestsolution.persistence.emap.eMap.EValueGenerator;
import at.bestsolution.persistence.emap.eMap.EValueTypeAttribute;
import at.bestsolution.persistence.emap.eMap.Import;
import at.bestsolution.persistence.emap.eMap.PackageDeclaration;
import at.bestsolution.persistence.emap.services.EMapGrammarAccess;
import com.google.inject.Inject;
import com.google.inject.Provider;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.serializer.acceptor.ISemanticSequenceAcceptor;
import org.eclipse.xtext.serializer.acceptor.SequenceFeeder;
import org.eclipse.xtext.serializer.diagnostic.ISemanticSequencerDiagnosticProvider;
import org.eclipse.xtext.serializer.diagnostic.ISerializationDiagnostic.Acceptor;
import org.eclipse.xtext.serializer.sequencer.AbstractDelegatingSemanticSequencer;
import org.eclipse.xtext.serializer.sequencer.GenericSequencer;
import org.eclipse.xtext.serializer.sequencer.ISemanticNodeProvider.INodesForEObjectProvider;
import org.eclipse.xtext.serializer.sequencer.ISemanticSequencer;
import org.eclipse.xtext.serializer.sequencer.ITransientValueService;
import org.eclipse.xtext.serializer.sequencer.ITransientValueService.ValueTransient;

@SuppressWarnings("all")
public class EMapSemanticSequencer extends AbstractDelegatingSemanticSequencer {

	@Inject
	private EMapGrammarAccess grammarAccess;
	
	@Override
	public void createSequence(EObject context, EObject semanticObject) {
		if(semanticObject.eClass().getEPackage() == EMapPackage.eINSTANCE) switch(semanticObject.eClass().getClassifierID()) {
			case EMapPackage.EATTRIBUTE:
				sequence_EAttribute(context, (EAttribute) semanticObject); 
				return; 
			case EMapPackage.EBUNDLE_ENTITY:
				sequence_EBundleEntity(context, (EBundleEntity) semanticObject); 
				return; 
			case EMapPackage.ECUSTOM_QUERY:
				sequence_ECustomQuery(context, (ECustomQuery) semanticObject); 
				return; 
			case EMapPackage.EFK_CONSTRAINT:
				sequence_EFkConstraint(context, (EFkConstraint) semanticObject); 
				return; 
			case EMapPackage.EINDEX:
				sequence_EIndex(context, (EIndex) semanticObject); 
				return; 
			case EMapPackage.EMAPPING:
				sequence_EMapping(context, (EMapping) semanticObject); 
				return; 
			case EMapPackage.EMAPPING_ATTRIBUTE:
				sequence_EMappingAttribute(context, (EMappingAttribute) semanticObject); 
				return; 
			case EMapPackage.EMAPPING_BUNDLE:
				sequence_EMappingBundle(context, (EMappingBundle) semanticObject); 
				return; 
			case EMapPackage.EMAPPING_ENTITY:
				sequence_EMappingEntity(context, (EMappingEntity) semanticObject); 
				return; 
			case EMapPackage.EMAPPING_ENTITY_DEF:
				sequence_EMappingEntityDef(context, (EMappingEntityDef) semanticObject); 
				return; 
			case EMapPackage.EMODEL_TYPE_ATTRIBUTE:
				sequence_EModelTypeAttribute(context, (EModelTypeAttribute) semanticObject); 
				return; 
			case EMapPackage.EMODEL_TYPE_DEF:
				sequence_EModelTypeDef(context, (EModelTypeDef) semanticObject); 
				return; 
			case EMapPackage.ENAMED_CUSTOM_QUERY:
				sequence_ENamedCustomQuery(context, (ENamedCustomQuery) semanticObject); 
				return; 
			case EMapPackage.ENAMED_QUERY:
				sequence_ENamedQuery(context, (ENamedQuery) semanticObject); 
				return; 
			case EMapPackage.ENAMED_SERVICE_QUERY:
				sequence_ENamedServiceQuery(context, (ENamedServiceQuery) semanticObject); 
				return; 
			case EMapPackage.EOBJECT_SECTION:
				sequence_EObjectSection(context, (EObjectSection) semanticObject); 
				return; 
			case EMapPackage.EPARAMETER:
				sequence_EParameter(context, (EParameter) semanticObject); 
				return; 
			case EMapPackage.EPATH_PARAM:
				sequence_EPathParam(context, (EPathParam) semanticObject); 
				return; 
			case EMapPackage.EPREDEFINED_TYPE:
				sequence_EPredefinedType(context, (EPredefinedType) semanticObject); 
				return; 
			case EMapPackage.EQUERY:
				sequence_EQuery(context, (EQuery) semanticObject); 
				return; 
			case EMapPackage.EQUERY_PARAM:
				sequence_EQueryParam(context, (EQueryParam) semanticObject); 
				return; 
			case EMapPackage.EREST_SERVICE_MAPPING:
				sequence_ERestServiceMapping(context, (ERestServiceMapping) semanticObject); 
				return; 
			case EMapPackage.ESQL_ATT_TYPE_DEF:
				sequence_ESQLAttTypeDef(context, (ESQLAttTypeDef) semanticObject); 
				return; 
			case EMapPackage.ESQL_DB_TYPE:
				sequence_ESQLDbType(context, (ESQLDbType) semanticObject); 
				return; 
			case EMapPackage.ESQL_TYPE_DEF:
				sequence_ESQLTypeDef(context, (ESQLTypeDef) semanticObject); 
				return; 
			case EMapPackage.ETYPE:
				sequence_EType(context, (EType) semanticObject); 
				return; 
			case EMapPackage.ETYPE_DEF:
				sequence_ETypeDef(context, (ETypeDef) semanticObject); 
				return; 
			case EMapPackage.EUNIQUE_CONSTRAINT:
				sequence_EUniqueConstraint(context, (EUniqueConstraint) semanticObject); 
				return; 
			case EMapPackage.EVALUE_GENERATOR:
				sequence_EValueGenerator(context, (EValueGenerator) semanticObject); 
				return; 
			case EMapPackage.EVALUE_TYPE_ATTRIBUTE:
				sequence_EValueTypeAttribute(context, (EValueTypeAttribute) semanticObject); 
				return; 
			case EMapPackage.IMPORT:
				sequence_Import(context, (Import) semanticObject); 
				return; 
			case EMapPackage.PACKAGE_DECLARATION:
				sequence_PackageDeclaration(context, (PackageDeclaration) semanticObject); 
				return; 
			}
		if (errorAcceptor != null) errorAcceptor.accept(diagnosticProvider.createInvalidContextOrTypeDiagnostic(semanticObject, context));
	}
	
	/**
	 * Constraint:
	 *     (
	 *         (pk?='primarykey'? | forcedFk?='forced-fk') 
	 *         name=ID 
	 *         (
	 *             (columnName=ID (valueGenerators+=EValueGenerator valueGenerators+=EValueGenerator*)?) | 
	 *             (resolved?='resolve' query=[ENamedQuery|QualifiedName] parameters+=ID (opposite=[EAttribute|QualifiedName] relationTable=ID relationColumn=ID?)?)
	 *         ) 
	 *         size=STRING?
	 *     )
	 */
	protected void sequence_EAttribute(EObject context, EAttribute semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (
	 *         entity=[EMappingEntity|ID] 
	 *         (
	 *             pkConstraintName=STRING? 
	 *             (fkConstraints+=EFkConstraint fkConstraints+=EFkConstraint*)? 
	 *             (uniqueContraints+=EUniqueConstraint uniqueContraints+=EUniqueConstraint*)? 
	 *             (indices+=EIndex indices+=EIndex*)? 
	 *             (typeDefs+=ESQLAttTypeDef typeDefs+=ESQLAttTypeDef*)? 
	 *             rest=ERestServiceMapping?
	 *         )?
	 *     )
	 */
	protected void sequence_EBundleEntity(EObject context, EBundleEntity semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     ((dbType='default' | dbType=STRING) columns=STRING ((from=STRING where=STRING? groupBy=STRING? orderby=STRING?) | all=STRING))
	 */
	protected void sequence_ECustomQuery(EObject context, ECustomQuery semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (attribute=[EAttribute|QualifiedName] name=STRING)
	 */
	protected void sequence_EFkConstraint(EObject context, EFkConstraint semanticObject) {
		if(errorAcceptor != null) {
			if(transientValues.isValueTransient(semanticObject, EMapPackage.Literals.EFK_CONSTRAINT__ATTRIBUTE) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, EMapPackage.Literals.EFK_CONSTRAINT__ATTRIBUTE));
			if(transientValues.isValueTransient(semanticObject, EMapPackage.Literals.EFK_CONSTRAINT__NAME) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, EMapPackage.Literals.EFK_CONSTRAINT__NAME));
		}
		INodesForEObjectProvider nodes = createNodeProvider(semanticObject);
		SequenceFeeder feeder = createSequencerFeeder(semanticObject, nodes);
		feeder.accept(grammarAccess.getEFkConstraintAccess().getAttributeEAttributeQualifiedNameParserRuleCall_1_0_1(), semanticObject.getAttribute());
		feeder.accept(grammarAccess.getEFkConstraintAccess().getNameSTRINGTerminalRuleCall_2_0(), semanticObject.getName());
		feeder.finish();
	}
	
	
	/**
	 * Constraint:
	 *     (name=STRING attributes+=[EAttribute|QualifiedName] attributes+=[EAttribute|QualifiedName]*)
	 */
	protected void sequence_EIndex(EObject context, EIndex semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (
	 *         pk?='primarykey'? 
	 *         property=QualifiedName 
	 *         (columnName=ID | (resolved?='resolve' query=[ENamedQuery|QualifiedName] parameters+=ID) | (mapped?='map' map=EObjectSection))
	 *     )
	 */
	protected void sequence_EMappingAttribute(EObject context, EMappingAttribute semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (
	 *         imports+=Import* 
	 *         name=ID 
	 *         parentBundle=[EMappingBundle|QualifiedName]? 
	 *         entities+=EBundleEntity 
	 *         entities+=EBundleEntity* 
	 *         typeDefs+=ESQLTypeDef* 
	 *         (databases+=STRING databases+=STRING*)? 
	 *         colSort=ColSort?
	 *     )
	 */
	protected void sequence_EMappingBundle(EObject context, EMappingBundle semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (package=PackageDeclaration imports+=Import* entity=EMappingEntity)
	 */
	protected void sequence_EMappingEntityDef(EObject context, EMappingEntityDef semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (
	 *         abstract?='abstract'? 
	 *         name=ID 
	 *         ((extensionType='extends' | extensionType='derived') parent=[EMappingEntity|QualifiedName])? 
	 *         etype=EType 
	 *         (attributes+=EAttribute attributes+=EAttribute*)? 
	 *         ((namedQueries+=ENamedQuery | namedCustomQueries+=ENamedCustomQuery) (namedQueries+=ENamedQuery | namedCustomQueries+=ENamedCustomQuery)*)? 
	 *         tableName=ID? 
	 *         descriminationColumn=ID?
	 *     )
	 */
	protected void sequence_EMappingEntity(EObject context, EMappingEntity semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (root=EMappingBundle | root=EMappingEntityDef)
	 */
	protected void sequence_EMapping(EObject context, EMapping semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (name=ID (query=[ENamedCustomQuery|QualifiedName] (parameters+=ID parameters+=ID*)? (cached?='cached' cacheName=ID?)?)?)
	 */
	protected void sequence_EModelTypeAttribute(EObject context, EModelTypeAttribute semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (eclassDef=EType attributes+=EModelTypeAttribute attributes+=EModelTypeAttribute*)
	 */
	protected void sequence_EModelTypeDef(EObject context, EModelTypeDef semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (
	 *         (returnType=EReturnType | (list?='[' returnType=EReturnType)) 
	 *         name=ID 
	 *         (parameters+=EParameter parameters+=EParameter*)? 
	 *         queries+=ECustomQuery 
	 *         queries+=ECustomQuery*
	 *     )
	 */
	protected void sequence_ENamedCustomQuery(EObject context, ENamedCustomQuery semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (returnType=ReturnType? name=ID (parameters+=EParameter parameters+=EParameter*)? queries+=EQuery queries+=EQuery*)
	 */
	protected void sequence_ENamedQuery(EObject context, ENamedQuery semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (query=[ENamedQuery|QualifiedName] path=STRING parameters+=EServiceParam*)
	 */
	protected void sequence_ENamedServiceQuery(EObject context, ENamedServiceQuery semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (
	 *         entity=[EMappingEntity|ID] 
	 *         (descriminatedTypes+=[EMappingEntity|ID] descriminatedTypes+=[EMappingEntity|ID]+)? 
	 *         (prefix=ID (attributes+=EMappingAttribute attributes+=EMappingAttribute*)?)?
	 *     )
	 */
	protected void sequence_EObjectSection(EObject context, EObjectSection semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (id?='primarykey'? (type=EPrimtiveType | (list?='[' type=EPrimtiveType)) name=ID)
	 */
	protected void sequence_EParameter(EObject context, EParameter semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (param=[EParameter|QualifiedName] name=ID?)
	 */
	protected void sequence_EPathParam(EObject context, EPathParam semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (ref=EMapType | ref=EPrimtiveType)
	 */
	protected void sequence_EPredefinedType(EObject context, EPredefinedType semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (param=[EParameter|QualifiedName] name=ID?)
	 */
	protected void sequence_EQueryParam(EObject context, EQueryParam semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     ((dbType='default' | dbType=STRING) mapping=EObjectSection ((from=STRING where=STRING? groupBy=STRING? orderby=STRING?) | all=STRING))
	 */
	protected void sequence_EQuery(EObject context, EQuery semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (serviceMethods+=ENamedServiceQuery* rest?='rest')
	 */
	protected void sequence_ERestServiceMapping(EObject context, ERestServiceMapping semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (attribute=[EAttribute|QualifiedName] dbTypes+=ESQLDbType dbTypes+=ESQLDbType*)
	 */
	protected void sequence_ESQLAttTypeDef(EObject context, ESQLAttTypeDef semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     ((dbType='default' | dbType=STRING) sqlTypeDef=STRING size=STRING?)
	 */
	protected void sequence_ESQLDbType(EObject context, ESQLDbType semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (etype=EType dbTypes+=ESQLDbType dbTypes+=ESQLDbType*)
	 */
	protected void sequence_ESQLTypeDef(EObject context, ESQLTypeDef semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (name=FQN types+=EValueTypeAttribute types+=EValueTypeAttribute*)
	 */
	protected void sequence_ETypeDef(EObject context, ETypeDef semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (url=STRING name=ID)
	 */
	protected void sequence_EType(EObject context, EType semanticObject) {
		if(errorAcceptor != null) {
			if(transientValues.isValueTransient(semanticObject, EMapPackage.Literals.ETYPE__URL) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, EMapPackage.Literals.ETYPE__URL));
			if(transientValues.isValueTransient(semanticObject, EMapPackage.Literals.ETYPE__NAME) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, EMapPackage.Literals.ETYPE__NAME));
		}
		INodesForEObjectProvider nodes = createNodeProvider(semanticObject);
		SequenceFeeder feeder = createSequencerFeeder(semanticObject, nodes);
		feeder.accept(grammarAccess.getETypeAccess().getUrlSTRINGTerminalRuleCall_1_0(), semanticObject.getUrl());
		feeder.accept(grammarAccess.getETypeAccess().getNameIDTerminalRuleCall_3_0(), semanticObject.getName());
		feeder.finish();
	}
	
	
	/**
	 * Constraint:
	 *     (name=STRING attributes+=[EAttribute|QualifiedName] attributes+=[EAttribute|QualifiedName]*)
	 */
	protected void sequence_EUniqueConstraint(EObject context, EUniqueConstraint semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (dbType=STRING (autokey?='autokey' | query=STRING | sequence=STRING))
	 */
	protected void sequence_EValueGenerator(EObject context, EValueGenerator semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     (type=EPrimtiveType name=ID)
	 */
	protected void sequence_EValueTypeAttribute(EObject context, EValueTypeAttribute semanticObject) {
		if(errorAcceptor != null) {
			if(transientValues.isValueTransient(semanticObject, EMapPackage.Literals.EVALUE_TYPE_ATTRIBUTE__TYPE) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, EMapPackage.Literals.EVALUE_TYPE_ATTRIBUTE__TYPE));
			if(transientValues.isValueTransient(semanticObject, EMapPackage.Literals.EVALUE_TYPE_ATTRIBUTE__NAME) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, EMapPackage.Literals.EVALUE_TYPE_ATTRIBUTE__NAME));
		}
		INodesForEObjectProvider nodes = createNodeProvider(semanticObject);
		SequenceFeeder feeder = createSequencerFeeder(semanticObject, nodes);
		feeder.accept(grammarAccess.getEValueTypeAttributeAccess().getTypeEPrimtiveTypeParserRuleCall_0_0(), semanticObject.getType());
		feeder.accept(grammarAccess.getEValueTypeAttributeAccess().getNameIDTerminalRuleCall_1_0(), semanticObject.getName());
		feeder.finish();
	}
	
	
	/**
	 * Constraint:
	 *     (importedNamespace=QualifiedNameWithWildcard | importedNamespace=QualifiedName)
	 */
	protected void sequence_Import(EObject context, Import semanticObject) {
		genericSequencer.createSequence(context, semanticObject);
	}
	
	
	/**
	 * Constraint:
	 *     name=QualifiedName
	 */
	protected void sequence_PackageDeclaration(EObject context, PackageDeclaration semanticObject) {
		if(errorAcceptor != null) {
			if(transientValues.isValueTransient(semanticObject, EMapPackage.Literals.PACKAGE_DECLARATION__NAME) == ValueTransient.YES)
				errorAcceptor.accept(diagnosticProvider.createFeatureValueMissing(semanticObject, EMapPackage.Literals.PACKAGE_DECLARATION__NAME));
		}
		INodesForEObjectProvider nodes = createNodeProvider(semanticObject);
		SequenceFeeder feeder = createSequencerFeeder(semanticObject, nodes);
		feeder.accept(grammarAccess.getPackageDeclarationAccess().getNameQualifiedNameParserRuleCall_1_0(), semanticObject.getName());
		feeder.finish();
	}
}
