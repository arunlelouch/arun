
<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="./resources/Javascript/countrymaster.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var form_URL = $("#formURLHidden").val();
	$.fn.validfunction = function(formId, btnID)
	{
		$(this).validFields(formId,form_URL  , btnID);
	};
});
</script>
</head>
<body>
<div class="pcoded-main-container">
	<div class="pcoded-wrapper">
		<div class="pcoded-content">
			<div class="pcoded-inner-content">
				<div class="main-body">
					<div class="page-wrapper">
						<div class="row">
							<div class="col-sm-12">
								<div class="card">
									<div class="card-header" ><h5>Country Master</h5></div>
									<div class="card-block">
										<input type="hidden" value="${url}" id="formURLHidden" />
										<form:form modelAttribute="countryMO" id="countryMasterFormId" method="POST">
											
											<div class="row">
												<div class="col-md-12">
													<div class="card">
														<div class="card-header"><h5>Country</h5>
															<div class="card-header-right">
																<a href="#" class="btn btn-sm btn-primary" id="branchAdd" onclick="$(this).addBranch();">
																	<i class="feather icon-plus-circle"></i>Add Country
																</a>
															</div>
														</div>
														<div class="card-body">
															<div class="branchAccTbl" id="brAcc">
															<c:forEach begin="0" end="${countryMO.countryDOS.size() == 0 ? 0 : countryMO.countryDOS.size() -1}" var="i">
																<div class="brachMain" id="branchMainId${i}">
																	<div class="row">
																		<div class="col-md-12 border" style="height:95px;">
																			<div class="row">
																				<div class="col-sm-2"><label>Country ID</label></div>
																				<div class="col-sm-2"><label>Country Name<span style="color: red">*</span></label></div>
																				<div class="col-sm-2"><label>Country Code</label></div>
																				<div class="col-sm-2"><label>Continent<span style="color: red">*</span></label></div>
																				<div class="col-sm-2"><label>Currency<span style="color: red">*</span></label></div>
																			</div>
																			<div class="row">
																				<div class="col-sm-2">
																					<form:hidden path="countryDOS[${i}].Id"/>
																					<form:input path="countryDOS[${i}].countryId" class="form-control countryId input-sm" readonly="true" placeholder="Auto Generated"/>
																				</div>
																				<div class="col-sm-2"><form:input path="countryDOS[${i}].countryName" class="form-control input-sm validateClass" onclick="$(this).removeCss()"/></div>
																				<div class="col-sm-2"><form:input path="countryDOS[${i}].countryCode" class="form-control input-sm" onclick="$(this).removeCss()"/></div>
																				<div class="col-sm-2">
																				 <form:select id="" path="countryDOS[${i}].continentDO.id" class="form-control">
																				            <form:option value=""><f:message code="label.select"/></form:option>
																			                <c:forEach items="${countryMO.getContinentDOsList()}" var="var01" >
																		                <form:option value="${var01.id}">${var01.continentName}</form:option>
																			                </c:forEach>
																				</form:select>  
																				</div>
																				<div class="col-sm-2">
																				 <form:select id="" path="countryDOS[${i}].currencyDO.Id" class="form-control" style="width:270px;">
																				            <form:option value=""><f:message code="label.select"/></form:option>
																			                <c:forEach items="${countryMO.getCurrencyDOsList()}" var="var01" >
																		                <form:option value="${var01.id}">${var01.currencyName}</form:option>
																	                    </c:forEach> 
																				</form:select> 
																				
																				</div>
																				<div class="col-md-2 float-right" ><a href="#" id="" class="btn dynamicSubDelete" style="float:right;"><i class="feather icon-minus-circle float-right"></i></a></div>
																			</div>
																		</div>
																	
																	</div>
																	<br>
																</div>
															</c:forEach> 
															
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row" style="float: right;">
												<a href="./CountrySearch.html" class="btn btn-danger btn-sm" role="button">Cancel</a>
												<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('countryMasterFormId','btnId');" id="btnId">
													<span class="spinner-grow spinner-grow-sm" id="loadindGif" style="display: none;"></span>
													<b id="btnTextId">Submit</b>
												</button>
											</div>
										</form:form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>