/**
 * 
 */
package com.chegus.geni.common;

/**
 * @author Harish
 *
 */
public interface ModelMapper<M, D>
{
	public D mapModelToDomain(M model, D domain);
	public M mapDomainToModel(M model, D domain);
	public M mapDomainToModelForView(M model, D domain);
}
