package com.chegus.geni.common;


/**
 * This class will have common utilities used by all controllers.
 * @author Harish
 *
 */
public class ControllerUtils
{

	/**
	 * This a generic method used to map Model object (Form backing/UI object) to Domain Object using the {@link ModelMapper} implementation for the corresponding controller.
	 * Example [ControllerName]Util.java.
	 * @param c - Model object
	 * @param d - Domain object
	 * @param mapper - {@link ModelMapper} implementation for the corresponding Controller.
	 * @return d - Domain object
	 */
	public static <M, D> D mapModelToDomain(M m, D d, ModelMapper<M, D> mapper)
	{
		return mapper.mapModelToDomain(m, d);
	}

	/**
	 * This a generic method used to map Domain object to Model Object (Form backing/UI object) using the {@link ModelMapper} implementation for the corresponding controller.
	 * Example [ControllerName]Util.java.@param Model object C
	 * @param c - Model object
	 * @param d - Domain object <D>
	 * @param mapper - {@link ModelMapper} implementation for the corresponding Controller.
	 * @return c - Model object
	 */
	public static <M, D> M mapDomainToModel(M m, D d, ModelMapper<M, D> mapper)
	{
		return mapper.mapDomainToModel(m, d);
	}
	
	/**
	 * This a generic method used to map Domain object to Model Object (Form backing/UI object) for populating <b>view screens</b> using the {@link ModelMapper} implementation for the corresponding controller.
	 * Example [ControllerName]Util.java.@param Model object C.
	 * 
	 * @param c - Model object
	 * @param d - Domain object <D>
	 * @param mapper - {@link ModelMapper} implementation for the corresponding Controller.
	 * @return c - Model object <C>
	 */
	public static <M, D> M mapDomainToModelForView(M m, D d, ModelMapper<M, D> mapper)
	{
		return mapper.mapDomainToModelForView(m, d);
	}

}
