/*
 * generated by Xtext
 */
package at.bestsolution.persistence.emap;

import org.eclipse.xtext.junit4.IInjectorProvider;

import com.google.inject.Injector;

public class EMapUiInjectorProvider implements IInjectorProvider {
	
	@Override
	public Injector getInjector() {
		return at.bestsolution.persistence.emap.ui.internal.EMapActivator.getInstance().getInjector("at.bestsolution.persistence.emap.EMap");
	}
	
}
