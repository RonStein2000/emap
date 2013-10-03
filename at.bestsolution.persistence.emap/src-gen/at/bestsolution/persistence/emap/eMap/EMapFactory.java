/**
 */
package at.bestsolution.persistence.emap.eMap;

import org.eclipse.emf.ecore.EFactory;

/**
 * <!-- begin-user-doc -->
 * The <b>Factory</b> for the model.
 * It provides a create method for each non-abstract class of the model.
 * <!-- end-user-doc -->
 * @see at.bestsolution.persistence.emap.eMap.EMapPackage
 * @generated
 */
public interface EMapFactory extends EFactory
{
  /**
   * The singleton instance of the factory.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @generated
   */
  EMapFactory eINSTANCE = at.bestsolution.persistence.emap.eMap.impl.EMapFactoryImpl.init();

  /**
   * Returns a new object of class '<em>EMapping</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>EMapping</em>'.
   * @generated
   */
  EMapping createEMapping();

  /**
   * Returns a new object of class '<em>EMapping Bundle</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>EMapping Bundle</em>'.
   * @generated
   */
  EMappingBundle createEMappingBundle();

  /**
   * Returns a new object of class '<em>EMapping Entity Def</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>EMapping Entity Def</em>'.
   * @generated
   */
  EMappingEntityDef createEMappingEntityDef();

  /**
   * Returns a new object of class '<em>Import</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>Import</em>'.
   * @generated
   */
  Import createImport();

  /**
   * Returns a new object of class '<em>Package Declaration</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>Package Declaration</em>'.
   * @generated
   */
  PackageDeclaration createPackageDeclaration();

  /**
   * Returns a new object of class '<em>EMapping Entity</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>EMapping Entity</em>'.
   * @generated
   */
  EMappingEntity createEMappingEntity();

  /**
   * Returns a new object of class '<em>EAttribute</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>EAttribute</em>'.
   * @generated
   */
  EAttribute createEAttribute();

  /**
   * Returns a new object of class '<em>EValue Generator</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>EValue Generator</em>'.
   * @generated
   */
  EValueGenerator createEValueGenerator();

  /**
   * Returns a new object of class '<em>ENamed Query</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>ENamed Query</em>'.
   * @generated
   */
  ENamedQuery createENamedQuery();

  /**
   * Returns a new object of class '<em>EParameter</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>EParameter</em>'.
   * @generated
   */
  EParameter createEParameter();

  /**
   * Returns a new object of class '<em>EQuery</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>EQuery</em>'.
   * @generated
   */
  EQuery createEQuery();

  /**
   * Returns a new object of class '<em>EObject Section</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>EObject Section</em>'.
   * @generated
   */
  EObjectSection createEObjectSection();

  /**
   * Returns a new object of class '<em>EMapping Attribute</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>EMapping Attribute</em>'.
   * @generated
   */
  EMappingAttribute createEMappingAttribute();

  /**
   * Returns a new object of class '<em>EType</em>'.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return a new object of class '<em>EType</em>'.
   * @generated
   */
  EType createEType();

  /**
   * Returns the package supported by this factory.
   * <!-- begin-user-doc -->
   * <!-- end-user-doc -->
   * @return the package supported by this factory.
   * @generated
   */
  EMapPackage getEMapPackage();

} //EMapFactory