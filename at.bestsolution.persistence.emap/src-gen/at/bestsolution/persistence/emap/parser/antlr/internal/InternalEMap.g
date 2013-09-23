/*
* generated by Xtext
*/
grammar InternalEMap;

options {
	superClass=AbstractInternalAntlrParser;
	
}

@lexer::header {
package at.bestsolution.persistence.emap.parser.antlr.internal;

// Hack: Use our own Lexer superclass by means of import. 
// Currently there is no other way to specify the superclass for the lexer.
import org.eclipse.xtext.parser.antlr.Lexer;
}

@parser::header {
package at.bestsolution.persistence.emap.parser.antlr.internal; 

import org.eclipse.xtext.*;
import org.eclipse.xtext.parser.*;
import org.eclipse.xtext.parser.impl.*;
import org.eclipse.emf.ecore.util.EcoreUtil;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.parser.antlr.AbstractInternalAntlrParser;
import org.eclipse.xtext.parser.antlr.XtextTokenStream;
import org.eclipse.xtext.parser.antlr.XtextTokenStream.HiddenTokens;
import org.eclipse.xtext.parser.antlr.AntlrDatatypeRuleToken;
import at.bestsolution.persistence.emap.services.EMapGrammarAccess;

}

@parser::members {

 	private EMapGrammarAccess grammarAccess;
 	
    public InternalEMapParser(TokenStream input, EMapGrammarAccess grammarAccess) {
        this(input);
        this.grammarAccess = grammarAccess;
        registerRules(grammarAccess.getGrammar());
    }
    
    @Override
    protected String getFirstRuleName() {
    	return "EMapping";	
   	}
   	
   	@Override
   	protected EMapGrammarAccess getGrammarAccess() {
   		return grammarAccess;
   	}
}

@rulecatch { 
    catch (RecognitionException re) { 
        recover(input,re); 
        appendSkippedTokens();
    } 
}




// Entry rule entryRuleEMapping
entryRuleEMapping returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getEMappingRule()); }
	 iv_ruleEMapping=ruleEMapping 
	 { $current=$iv_ruleEMapping.current; } 
	 EOF 
;

// Rule EMapping
ruleEMapping returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
(
(
		{ 
	        newCompositeNode(grammarAccess.getEMappingAccess().getRootEMappingBundleParserRuleCall_0_0()); 
	    }
		lv_root_0_1=ruleEMappingBundle		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingRule());
	        }
       		set(
       			$current, 
       			"root",
        		lv_root_0_1, 
        		"EMappingBundle");
	        afterParserOrEnumRuleCall();
	    }

    |		{ 
	        newCompositeNode(grammarAccess.getEMappingAccess().getRootEMappingEntityDefParserRuleCall_0_1()); 
	    }
		lv_root_0_2=ruleEMappingEntityDef		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingRule());
	        }
       		set(
       			$current, 
       			"root",
        		lv_root_0_2, 
        		"EMappingEntityDef");
	        afterParserOrEnumRuleCall();
	    }

)

)
)
;





// Entry rule entryRuleEMappingBundle
entryRuleEMappingBundle returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getEMappingBundleRule()); }
	 iv_ruleEMappingBundle=ruleEMappingBundle 
	 { $current=$iv_ruleEMappingBundle.current; } 
	 EOF 
;

// Rule EMappingBundle
ruleEMappingBundle returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		{ 
	        newCompositeNode(grammarAccess.getEMappingBundleAccess().getImportsImportParserRuleCall_0_0()); 
	    }
		lv_imports_0_0=ruleImport		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingBundleRule());
	        }
       		add(
       			$current, 
       			"imports",
        		lv_imports_0_0, 
        		"Import");
	        afterParserOrEnumRuleCall();
	    }

)
)*	otherlv_1='bundle' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getEMappingBundleAccess().getBundleKeyword_1());
    }
(
(
		lv_name_2_0=RULE_ID
		{
			newLeafNode(lv_name_2_0, grammarAccess.getEMappingBundleAccess().getNameIDTerminalRuleCall_2_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingBundleRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"name",
        		lv_name_2_0, 
        		"ID");
	    }

)
)	otherlv_3='{' 
    {
    	newLeafNode(otherlv_3, grammarAccess.getEMappingBundleAccess().getLeftCurlyBracketKeyword_3());
    }
(
(
		{
			if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingBundleRule());
	        }
        }
	otherlv_4=RULE_ID
	{
		newLeafNode(otherlv_4, grammarAccess.getEMappingBundleAccess().getEntitiesEMappingEntityCrossReference_4_0()); 
	}

)
)(	otherlv_5=',' 
    {
    	newLeafNode(otherlv_5, grammarAccess.getEMappingBundleAccess().getCommaKeyword_5_0());
    }
(
(
		{
			if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingBundleRule());
	        }
        }
	otherlv_6=RULE_ID
	{
		newLeafNode(otherlv_6, grammarAccess.getEMappingBundleAccess().getEntitiesEMappingEntityCrossReference_5_1_0()); 
	}

)
))*	otherlv_7='}' 
    {
    	newLeafNode(otherlv_7, grammarAccess.getEMappingBundleAccess().getRightCurlyBracketKeyword_6());
    }
)
;





// Entry rule entryRuleEMappingEntityDef
entryRuleEMappingEntityDef returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getEMappingEntityDefRule()); }
	 iv_ruleEMappingEntityDef=ruleEMappingEntityDef 
	 { $current=$iv_ruleEMappingEntityDef.current; } 
	 EOF 
;

// Rule EMappingEntityDef
ruleEMappingEntityDef returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		{ 
	        newCompositeNode(grammarAccess.getEMappingEntityDefAccess().getPackagePackageDeclarationParserRuleCall_0_0()); 
	    }
		lv_package_0_0=rulePackageDeclaration		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingEntityDefRule());
	        }
       		set(
       			$current, 
       			"package",
        		lv_package_0_0, 
        		"PackageDeclaration");
	        afterParserOrEnumRuleCall();
	    }

)
)(
(
		{ 
	        newCompositeNode(grammarAccess.getEMappingEntityDefAccess().getImportsImportParserRuleCall_1_0()); 
	    }
		lv_imports_1_0=ruleImport		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingEntityDefRule());
	        }
       		add(
       			$current, 
       			"imports",
        		lv_imports_1_0, 
        		"Import");
	        afterParserOrEnumRuleCall();
	    }

)
)*(
(
		{ 
	        newCompositeNode(grammarAccess.getEMappingEntityDefAccess().getEntityEMappingEntityParserRuleCall_2_0()); 
	    }
		lv_entity_2_0=ruleEMappingEntity		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingEntityDefRule());
	        }
       		set(
       			$current, 
       			"entity",
        		lv_entity_2_0, 
        		"EMappingEntity");
	        afterParserOrEnumRuleCall();
	    }

)
))
;





// Entry rule entryRuleImport
entryRuleImport returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getImportRule()); }
	 iv_ruleImport=ruleImport 
	 { $current=$iv_ruleImport.current; } 
	 EOF 
;

// Rule Import
ruleImport returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(	otherlv_0='import' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getImportAccess().getImportKeyword_0());
    }
(
(
(
		{ 
	        newCompositeNode(grammarAccess.getImportAccess().getImportedNamespaceQualifiedNameWithWildcardParserRuleCall_1_0_0()); 
	    }
		lv_importedNamespace_1_1=ruleQualifiedNameWithWildcard		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getImportRule());
	        }
       		set(
       			$current, 
       			"importedNamespace",
        		lv_importedNamespace_1_1, 
        		"QualifiedNameWithWildcard");
	        afterParserOrEnumRuleCall();
	    }

    |		{ 
	        newCompositeNode(grammarAccess.getImportAccess().getImportedNamespaceQualifiedNameParserRuleCall_1_0_1()); 
	    }
		lv_importedNamespace_1_2=ruleQualifiedName		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getImportRule());
	        }
       		set(
       			$current, 
       			"importedNamespace",
        		lv_importedNamespace_1_2, 
        		"QualifiedName");
	        afterParserOrEnumRuleCall();
	    }

)

)
))
;





// Entry rule entryRulePackageDeclaration
entryRulePackageDeclaration returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getPackageDeclarationRule()); }
	 iv_rulePackageDeclaration=rulePackageDeclaration 
	 { $current=$iv_rulePackageDeclaration.current; } 
	 EOF 
;

// Rule PackageDeclaration
rulePackageDeclaration returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(	otherlv_0='package' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getPackageDeclarationAccess().getPackageKeyword_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getPackageDeclarationAccess().getNameQualifiedNameParserRuleCall_1_0()); 
	    }
		lv_name_1_0=ruleQualifiedName		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getPackageDeclarationRule());
	        }
       		set(
       			$current, 
       			"name",
        		lv_name_1_0, 
        		"QualifiedName");
	        afterParserOrEnumRuleCall();
	    }

)
)	otherlv_2=';' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getPackageDeclarationAccess().getSemicolonKeyword_2());
    }
)
;





// Entry rule entryRuleEMappingEntity
entryRuleEMappingEntity returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getEMappingEntityRule()); }
	 iv_ruleEMappingEntity=ruleEMappingEntity 
	 { $current=$iv_ruleEMappingEntity.current; } 
	 EOF 
;

// Rule EMappingEntity
ruleEMappingEntity returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_abstract_0_0=	'abstract' 
    {
        newLeafNode(lv_abstract_0_0, grammarAccess.getEMappingEntityAccess().getAbstractAbstractKeyword_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingEntityRule());
	        }
       		setWithLastConsumed($current, "abstract", true, "abstract");
	    }

)
)?	otherlv_1='entity' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getEMappingEntityAccess().getEntityKeyword_1());
    }
(
(
		lv_name_2_0=RULE_ID
		{
			newLeafNode(lv_name_2_0, grammarAccess.getEMappingEntityAccess().getNameIDTerminalRuleCall_2_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingEntityRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"name",
        		lv_name_2_0, 
        		"ID");
	    }

)
)((
(
(
		lv_extensionType_3_1=	'extends' 
    {
        newLeafNode(lv_extensionType_3_1, grammarAccess.getEMappingEntityAccess().getExtensionTypeExtendsKeyword_3_0_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingEntityRule());
	        }
       		setWithLastConsumed($current, "extensionType", lv_extensionType_3_1, null);
	    }

    |		lv_extensionType_3_2=	'derived' 
    {
        newLeafNode(lv_extensionType_3_2, grammarAccess.getEMappingEntityAccess().getExtensionTypeDerivedKeyword_3_0_0_1());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingEntityRule());
	        }
       		setWithLastConsumed($current, "extensionType", lv_extensionType_3_2, null);
	    }

)

)
)(
(
		{
			if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingEntityRule());
	        }
        }
		{ 
	        newCompositeNode(grammarAccess.getEMappingEntityAccess().getParentEMappingEntityCrossReference_3_1_0()); 
	    }
		ruleQualifiedName		{ 
	        afterParserOrEnumRuleCall();
	    }

)
))?	otherlv_5='{' 
    {
    	newLeafNode(otherlv_5, grammarAccess.getEMappingEntityAccess().getLeftCurlyBracketKeyword_4());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEMappingEntityAccess().getEtypeETypeParserRuleCall_5_0()); 
	    }
		lv_etype_6_0=ruleEType		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingEntityRule());
	        }
       		set(
       			$current, 
       			"etype",
        		lv_etype_6_0, 
        		"EType");
	        afterParserOrEnumRuleCall();
	    }

)
)	otherlv_7='attributes' 
    {
    	newLeafNode(otherlv_7, grammarAccess.getEMappingEntityAccess().getAttributesKeyword_6());
    }
	otherlv_8='{' 
    {
    	newLeafNode(otherlv_8, grammarAccess.getEMappingEntityAccess().getLeftCurlyBracketKeyword_7());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEMappingEntityAccess().getAttributesEAttributeParserRuleCall_8_0()); 
	    }
		lv_attributes_9_0=ruleEAttribute		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingEntityRule());
	        }
       		add(
       			$current, 
       			"attributes",
        		lv_attributes_9_0, 
        		"EAttribute");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_10=',' 
    {
    	newLeafNode(otherlv_10, grammarAccess.getEMappingEntityAccess().getCommaKeyword_9_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEMappingEntityAccess().getAttributesEAttributeParserRuleCall_9_1_0()); 
	    }
		lv_attributes_11_0=ruleEAttribute		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingEntityRule());
	        }
       		add(
       			$current, 
       			"attributes",
        		lv_attributes_11_0, 
        		"EAttribute");
	        afterParserOrEnumRuleCall();
	    }

)
))*	otherlv_12='}' 
    {
    	newLeafNode(otherlv_12, grammarAccess.getEMappingEntityAccess().getRightCurlyBracketKeyword_10());
    }
(	otherlv_13='queries' 
    {
    	newLeafNode(otherlv_13, grammarAccess.getEMappingEntityAccess().getQueriesKeyword_11_0());
    }
	otherlv_14='{' 
    {
    	newLeafNode(otherlv_14, grammarAccess.getEMappingEntityAccess().getLeftCurlyBracketKeyword_11_1());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEMappingEntityAccess().getNamedQueriesENamedQueryParserRuleCall_11_2_0()); 
	    }
		lv_namedQueries_15_0=ruleENamedQuery		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingEntityRule());
	        }
       		add(
       			$current, 
       			"namedQueries",
        		lv_namedQueries_15_0, 
        		"ENamedQuery");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_16=',' 
    {
    	newLeafNode(otherlv_16, grammarAccess.getEMappingEntityAccess().getCommaKeyword_11_3_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEMappingEntityAccess().getNamedQueriesENamedQueryParserRuleCall_11_3_1_0()); 
	    }
		lv_namedQueries_17_0=ruleENamedQuery		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingEntityRule());
	        }
       		add(
       			$current, 
       			"namedQueries",
        		lv_namedQueries_17_0, 
        		"ENamedQuery");
	        afterParserOrEnumRuleCall();
	    }

)
))*	otherlv_18='}' 
    {
    	newLeafNode(otherlv_18, grammarAccess.getEMappingEntityAccess().getRightCurlyBracketKeyword_11_4());
    }
)?	otherlv_19='}' 
    {
    	newLeafNode(otherlv_19, grammarAccess.getEMappingEntityAccess().getRightCurlyBracketKeyword_12());
    }
(	otherlv_20='as' 
    {
    	newLeafNode(otherlv_20, grammarAccess.getEMappingEntityAccess().getAsKeyword_13_0());
    }
(
(
		lv_tableName_21_0=RULE_ID
		{
			newLeafNode(lv_tableName_21_0, grammarAccess.getEMappingEntityAccess().getTableNameIDTerminalRuleCall_13_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingEntityRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"tableName",
        		lv_tableName_21_0, 
        		"ID");
	    }

)
))?)
;





// Entry rule entryRuleEAttribute
entryRuleEAttribute returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getEAttributeRule()); }
	 iv_ruleEAttribute=ruleEAttribute 
	 { $current=$iv_ruleEAttribute.current; } 
	 EOF 
;

// Rule EAttribute
ruleEAttribute returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_pk_0_0=	'primarykey' 
    {
        newLeafNode(lv_pk_0_0, grammarAccess.getEAttributeAccess().getPkPrimarykeyKeyword_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEAttributeRule());
	        }
       		setWithLastConsumed($current, "pk", true, "primarykey");
	    }

)
)?(
(
		lv_property_1_0=RULE_ID
		{
			newLeafNode(lv_property_1_0, grammarAccess.getEAttributeAccess().getPropertyIDTerminalRuleCall_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEAttributeRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"property",
        		lv_property_1_0, 
        		"ID");
	    }

)
)	otherlv_2='=>' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getEAttributeAccess().getEqualsSignGreaterThanSignKeyword_2());
    }
((
(
		lv_columnName_3_0=RULE_ID
		{
			newLeafNode(lv_columnName_3_0, grammarAccess.getEAttributeAccess().getColumnNameIDTerminalRuleCall_3_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEAttributeRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"columnName",
        		lv_columnName_3_0, 
        		"ID");
	    }

)
)
    |((
(
		lv_resolved_4_0=	'resolve' 
    {
        newLeafNode(lv_resolved_4_0, grammarAccess.getEAttributeAccess().getResolvedResolveKeyword_3_1_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEAttributeRule());
	        }
       		setWithLastConsumed($current, "resolved", true, "resolve");
	    }

)
)(
(
		{
			if ($current==null) {
	            $current = createModelElement(grammarAccess.getEAttributeRule());
	        }
        }
		{ 
	        newCompositeNode(grammarAccess.getEAttributeAccess().getQueryENamedQueryCrossReference_3_1_1_0()); 
	    }
		ruleQualifiedName		{ 
	        afterParserOrEnumRuleCall();
	    }

)
)	otherlv_6='(' 
    {
    	newLeafNode(otherlv_6, grammarAccess.getEAttributeAccess().getLeftParenthesisKeyword_3_1_2());
    }
(
(
		lv_parameters_7_0=RULE_ID
		{
			newLeafNode(lv_parameters_7_0, grammarAccess.getEAttributeAccess().getParametersIDTerminalRuleCall_3_1_3_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEAttributeRule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"parameters",
        		lv_parameters_7_0, 
        		"ID");
	    }

)
)	otherlv_8=')' 
    {
    	newLeafNode(otherlv_8, grammarAccess.getEAttributeAccess().getRightParenthesisKeyword_3_1_4());
    }
)))
;





// Entry rule entryRuleENamedQuery
entryRuleENamedQuery returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getENamedQueryRule()); }
	 iv_ruleENamedQuery=ruleENamedQuery 
	 { $current=$iv_ruleENamedQuery.current; } 
	 EOF 
;

// Rule ENamedQuery
ruleENamedQuery returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_name_0_0=RULE_ID
		{
			newLeafNode(lv_name_0_0, grammarAccess.getENamedQueryAccess().getNameIDTerminalRuleCall_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getENamedQueryRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"name",
        		lv_name_0_0, 
        		"ID");
	    }

)
)(	otherlv_1='(' 
    {
    	newLeafNode(otherlv_1, grammarAccess.getENamedQueryAccess().getLeftParenthesisKeyword_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getENamedQueryAccess().getParametersEParameterParserRuleCall_1_1_0()); 
	    }
		lv_parameters_2_0=ruleEParameter		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getENamedQueryRule());
	        }
       		add(
       			$current, 
       			"parameters",
        		lv_parameters_2_0, 
        		"EParameter");
	        afterParserOrEnumRuleCall();
	    }

)
)*	otherlv_3=')' 
    {
    	newLeafNode(otherlv_3, grammarAccess.getENamedQueryAccess().getRightParenthesisKeyword_1_2());
    }
)?	otherlv_4='{' 
    {
    	newLeafNode(otherlv_4, grammarAccess.getENamedQueryAccess().getLeftCurlyBracketKeyword_2());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getENamedQueryAccess().getQueriesEQueryParserRuleCall_3_0()); 
	    }
		lv_queries_5_0=ruleEQuery		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getENamedQueryRule());
	        }
       		add(
       			$current, 
       			"queries",
        		lv_queries_5_0, 
        		"EQuery");
	        afterParserOrEnumRuleCall();
	    }

)
)	otherlv_6='}' 
    {
    	newLeafNode(otherlv_6, grammarAccess.getENamedQueryAccess().getRightCurlyBracketKeyword_4());
    }
)
;





// Entry rule entryRuleEParameter
entryRuleEParameter returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getEParameterRule()); }
	 iv_ruleEParameter=ruleEParameter 
	 { $current=$iv_ruleEParameter.current; } 
	 EOF 
;

// Rule EParameter
ruleEParameter returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_type_0_0=RULE_ID
		{
			newLeafNode(lv_type_0_0, grammarAccess.getEParameterAccess().getTypeIDTerminalRuleCall_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEParameterRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"type",
        		lv_type_0_0, 
        		"ID");
	    }

)
)(
(
		lv_name_1_0=RULE_ID
		{
			newLeafNode(lv_name_1_0, grammarAccess.getEParameterAccess().getNameIDTerminalRuleCall_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEParameterRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"name",
        		lv_name_1_0, 
        		"ID");
	    }

)
))
;





// Entry rule entryRuleEQuery
entryRuleEQuery returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getEQueryRule()); }
	 iv_ruleEQuery=ruleEQuery 
	 { $current=$iv_ruleEQuery.current; } 
	 EOF 
;

// Rule EQuery
ruleEQuery returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
(
		lv_dbType_0_1=	'default' 
    {
        newLeafNode(lv_dbType_0_1, grammarAccess.getEQueryAccess().getDbTypeDefaultKeyword_0_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEQueryRule());
	        }
       		setWithLastConsumed($current, "dbType", lv_dbType_0_1, null);
	    }

    |		lv_dbType_0_2=RULE_STRING
		{
			newLeafNode(lv_dbType_0_2, grammarAccess.getEQueryAccess().getDbTypeSTRINGTerminalRuleCall_0_0_1()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEQueryRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"dbType",
        		lv_dbType_0_2, 
        		"STRING");
	    }

)

)
)(
(
		{ 
	        newCompositeNode(grammarAccess.getEQueryAccess().getMappingEObjectSectionParserRuleCall_1_0()); 
	    }
		lv_mapping_1_0=ruleEObjectSection		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEQueryRule());
	        }
       		set(
       			$current, 
       			"mapping",
        		lv_mapping_1_0, 
        		"EObjectSection");
	        afterParserOrEnumRuleCall();
	    }

)
)((	otherlv_2='FROM' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getEQueryAccess().getFROMKeyword_2_0_0());
    }
(
(
		lv_from_3_0=RULE_STRING
		{
			newLeafNode(lv_from_3_0, grammarAccess.getEQueryAccess().getFromSTRINGTerminalRuleCall_2_0_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEQueryRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"from",
        		lv_from_3_0, 
        		"STRING");
	    }

)
)(	otherlv_4='WHERE' 
    {
    	newLeafNode(otherlv_4, grammarAccess.getEQueryAccess().getWHEREKeyword_2_0_2_0());
    }
(
(
		lv_where_5_0=RULE_STRING
		{
			newLeafNode(lv_where_5_0, grammarAccess.getEQueryAccess().getWhereSTRINGTerminalRuleCall_2_0_2_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEQueryRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"where",
        		lv_where_5_0, 
        		"STRING");
	    }

)
))?(	otherlv_6='GROUP BY' 
    {
    	newLeafNode(otherlv_6, grammarAccess.getEQueryAccess().getGROUPBYKeyword_2_0_3_0());
    }
(
(
		lv_groupBy_7_0=RULE_STRING
		{
			newLeafNode(lv_groupBy_7_0, grammarAccess.getEQueryAccess().getGroupBySTRINGTerminalRuleCall_2_0_3_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEQueryRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"groupBy",
        		lv_groupBy_7_0, 
        		"STRING");
	    }

)
))?(	otherlv_8='ORDER BY' 
    {
    	newLeafNode(otherlv_8, grammarAccess.getEQueryAccess().getORDERBYKeyword_2_0_4_0());
    }
(
(
		lv_orderby_9_0=RULE_STRING
		{
			newLeafNode(lv_orderby_9_0, grammarAccess.getEQueryAccess().getOrderbySTRINGTerminalRuleCall_2_0_4_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEQueryRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"orderby",
        		lv_orderby_9_0, 
        		"STRING");
	    }

)
))?)
    |(
(
		lv_all_10_0=RULE_STRING
		{
			newLeafNode(lv_all_10_0, grammarAccess.getEQueryAccess().getAllSTRINGTerminalRuleCall_2_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEQueryRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"all",
        		lv_all_10_0, 
        		"STRING");
	    }

)
)))
;





// Entry rule entryRuleEObjectSection
entryRuleEObjectSection returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getEObjectSectionRule()); }
	 iv_ruleEObjectSection=ruleEObjectSection 
	 { $current=$iv_ruleEObjectSection.current; } 
	 EOF 
;

// Rule EObjectSection
ruleEObjectSection returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		{
			if ($current==null) {
	            $current = createModelElement(grammarAccess.getEObjectSectionRule());
	        }
        }
	otherlv_0=RULE_ID
	{
		newLeafNode(otherlv_0, grammarAccess.getEObjectSectionAccess().getEntityEMappingEntityCrossReference_0_0()); 
	}

)
)((
(
		lv_prefix_1_0=RULE_ID
		{
			newLeafNode(lv_prefix_1_0, grammarAccess.getEObjectSectionAccess().getPrefixIDTerminalRuleCall_1_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEObjectSectionRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"prefix",
        		lv_prefix_1_0, 
        		"ID");
	    }

)
)(	otherlv_2='{' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getEObjectSectionAccess().getLeftCurlyBracketKeyword_1_1_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEObjectSectionAccess().getAttributesEMappingAttributeParserRuleCall_1_1_1_0()); 
	    }
		lv_attributes_3_0=ruleEMappingAttribute		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEObjectSectionRule());
	        }
       		add(
       			$current, 
       			"attributes",
        		lv_attributes_3_0, 
        		"EMappingAttribute");
	        afterParserOrEnumRuleCall();
	    }

)
)(	otherlv_4=',' 
    {
    	newLeafNode(otherlv_4, grammarAccess.getEObjectSectionAccess().getCommaKeyword_1_1_2_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEObjectSectionAccess().getAttributesEMappingAttributeParserRuleCall_1_1_2_1_0()); 
	    }
		lv_attributes_5_0=ruleEMappingAttribute		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEObjectSectionRule());
	        }
       		add(
       			$current, 
       			"attributes",
        		lv_attributes_5_0, 
        		"EMappingAttribute");
	        afterParserOrEnumRuleCall();
	    }

)
))*	otherlv_6='}' 
    {
    	newLeafNode(otherlv_6, grammarAccess.getEObjectSectionAccess().getRightCurlyBracketKeyword_1_1_3());
    }
)?)?)
;





// Entry rule entryRuleEMappingAttribute
entryRuleEMappingAttribute returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getEMappingAttributeRule()); }
	 iv_ruleEMappingAttribute=ruleEMappingAttribute 
	 { $current=$iv_ruleEMappingAttribute.current; } 
	 EOF 
;

// Rule EMappingAttribute
ruleEMappingAttribute returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
((
(
		lv_pk_0_0=	'primarykey' 
    {
        newLeafNode(lv_pk_0_0, grammarAccess.getEMappingAttributeAccess().getPkPrimarykeyKeyword_0_0());
    }
 
	    {
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingAttributeRule());
	        }
       		setWithLastConsumed($current, "pk", true, "primarykey");
	    }

)
)?(
(
		{ 
	        newCompositeNode(grammarAccess.getEMappingAttributeAccess().getPropertyQualifiedNameParserRuleCall_1_0()); 
	    }
		lv_property_1_0=ruleQualifiedName		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingAttributeRule());
	        }
       		set(
       			$current, 
       			"property",
        		lv_property_1_0, 
        		"QualifiedName");
	        afterParserOrEnumRuleCall();
	    }

)
)	otherlv_2='=>' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getEMappingAttributeAccess().getEqualsSignGreaterThanSignKeyword_2());
    }
((
(
		lv_columnName_3_0=RULE_ID
		{
			newLeafNode(lv_columnName_3_0, grammarAccess.getEMappingAttributeAccess().getColumnNameIDTerminalRuleCall_3_0_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingAttributeRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"columnName",
        		lv_columnName_3_0, 
        		"ID");
	    }

)
)
    |(	otherlv_4='resolve' 
    {
    	newLeafNode(otherlv_4, grammarAccess.getEMappingAttributeAccess().getResolveKeyword_3_1_0());
    }
(
(
		{
			if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingAttributeRule());
	        }
        }
		{ 
	        newCompositeNode(grammarAccess.getEMappingAttributeAccess().getEntityENamedQueryCrossReference_3_1_1_0()); 
	    }
		ruleQualifiedName		{ 
	        afterParserOrEnumRuleCall();
	    }

)
)	otherlv_6='(' 
    {
    	newLeafNode(otherlv_6, grammarAccess.getEMappingAttributeAccess().getLeftParenthesisKeyword_3_1_2());
    }
(
(
		lv_parameters_7_0=RULE_ID
		{
			newLeafNode(lv_parameters_7_0, grammarAccess.getEMappingAttributeAccess().getParametersIDTerminalRuleCall_3_1_3_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getEMappingAttributeRule());
	        }
       		addWithLastConsumed(
       			$current, 
       			"parameters",
        		lv_parameters_7_0, 
        		"ID");
	    }

)
)	otherlv_8=')' 
    {
    	newLeafNode(otherlv_8, grammarAccess.getEMappingAttributeAccess().getRightParenthesisKeyword_3_1_4());
    }
)
    |(	otherlv_9='map' 
    {
    	newLeafNode(otherlv_9, grammarAccess.getEMappingAttributeAccess().getMapKeyword_3_2_0());
    }
(
(
		{ 
	        newCompositeNode(grammarAccess.getEMappingAttributeAccess().getMapEObjectSectionParserRuleCall_3_2_1_0()); 
	    }
		lv_map_10_0=ruleEObjectSection		{
	        if ($current==null) {
	            $current = createModelElementForParent(grammarAccess.getEMappingAttributeRule());
	        }
       		set(
       			$current, 
       			"map",
        		lv_map_10_0, 
        		"EObjectSection");
	        afterParserOrEnumRuleCall();
	    }

)
))))
;





// Entry rule entryRuleEType
entryRuleEType returns [EObject current=null] 
	:
	{ newCompositeNode(grammarAccess.getETypeRule()); }
	 iv_ruleEType=ruleEType 
	 { $current=$iv_ruleEType.current; } 
	 EOF 
;

// Rule EType
ruleEType returns [EObject current=null] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(	otherlv_0='etype' 
    {
    	newLeafNode(otherlv_0, grammarAccess.getETypeAccess().getEtypeKeyword_0());
    }
(
(
		lv_url_1_0=RULE_STRING
		{
			newLeafNode(lv_url_1_0, grammarAccess.getETypeAccess().getUrlSTRINGTerminalRuleCall_1_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getETypeRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"url",
        		lv_url_1_0, 
        		"STRING");
	    }

)
)	otherlv_2='#' 
    {
    	newLeafNode(otherlv_2, grammarAccess.getETypeAccess().getNumberSignKeyword_2());
    }
(
(
		lv_name_3_0=RULE_ID
		{
			newLeafNode(lv_name_3_0, grammarAccess.getETypeAccess().getNameIDTerminalRuleCall_3_0()); 
		}
		{
	        if ($current==null) {
	            $current = createModelElement(grammarAccess.getETypeRule());
	        }
       		setWithLastConsumed(
       			$current, 
       			"name",
        		lv_name_3_0, 
        		"ID");
	    }

)
))
;





// Entry rule entryRuleQualifiedName
entryRuleQualifiedName returns [String current=null] 
	:
	{ newCompositeNode(grammarAccess.getQualifiedNameRule()); } 
	 iv_ruleQualifiedName=ruleQualifiedName 
	 { $current=$iv_ruleQualifiedName.current.getText(); }  
	 EOF 
;

// Rule QualifiedName
ruleQualifiedName returns [AntlrDatatypeRuleToken current=new AntlrDatatypeRuleToken()] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(    this_ID_0=RULE_ID    {
		$current.merge(this_ID_0);
    }

    { 
    newLeafNode(this_ID_0, grammarAccess.getQualifiedNameAccess().getIDTerminalRuleCall_0()); 
    }
(((
	'.' 
)=>
	kw='.' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getQualifiedNameAccess().getFullStopKeyword_1_0()); 
    }
)    this_ID_2=RULE_ID    {
		$current.merge(this_ID_2);
    }

    { 
    newLeafNode(this_ID_2, grammarAccess.getQualifiedNameAccess().getIDTerminalRuleCall_1_1()); 
    }
)*)
    ;





// Entry rule entryRuleQualifiedNameWithWildcard
entryRuleQualifiedNameWithWildcard returns [String current=null] 
	:
	{ newCompositeNode(grammarAccess.getQualifiedNameWithWildcardRule()); } 
	 iv_ruleQualifiedNameWithWildcard=ruleQualifiedNameWithWildcard 
	 { $current=$iv_ruleQualifiedNameWithWildcard.current.getText(); }  
	 EOF 
;

// Rule QualifiedNameWithWildcard
ruleQualifiedNameWithWildcard returns [AntlrDatatypeRuleToken current=new AntlrDatatypeRuleToken()] 
    @init { enterRule(); 
    }
    @after { leaveRule(); }:
(
    { 
        newCompositeNode(grammarAccess.getQualifiedNameWithWildcardAccess().getQualifiedNameParserRuleCall_0()); 
    }
    this_QualifiedName_0=ruleQualifiedName    {
		$current.merge(this_QualifiedName_0);
    }

    { 
        afterParserOrEnumRuleCall();
    }

	kw='.' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getQualifiedNameWithWildcardAccess().getFullStopKeyword_1()); 
    }

	kw='*' 
    {
        $current.merge(kw);
        newLeafNode(kw, grammarAccess.getQualifiedNameWithWildcardAccess().getAsteriskKeyword_2()); 
    }
)
    ;





RULE_ID : '^'? ('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'_'|'0'..'9')*;

RULE_INT : ('0'..'9')+;

RULE_STRING : ('"' ('\\' ('b'|'t'|'n'|'f'|'r'|'u'|'"'|'\''|'\\')|~(('\\'|'"')))* '"'|'\'' ('\\' ('b'|'t'|'n'|'f'|'r'|'u'|'"'|'\''|'\\')|~(('\\'|'\'')))* '\'');

RULE_ML_COMMENT : '/*' ( options {greedy=false;} : . )*'*/';

RULE_SL_COMMENT : '//' ~(('\n'|'\r'))* ('\r'? '\n')?;

RULE_WS : (' '|'\t'|'\r'|'\n')+;

RULE_ANY_OTHER : .;


