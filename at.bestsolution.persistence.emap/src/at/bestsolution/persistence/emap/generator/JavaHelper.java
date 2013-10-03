package at.bestsolution.persistence.emap.generator;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EPackage;

import at.bestsolution.persistence.emap.eMap.EType;

public class JavaHelper {

	public static EClass getEClass(EType type) {
		EPackage ePackage = EPackage.Registry.INSTANCE.getEPackage(type.getUrl());
//		System.err.println(type + " => " + ePackage);
		return (EClass) ePackage.getEClassifier(type.getName());
	}
}