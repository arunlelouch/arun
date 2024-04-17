<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="./resources/Javascript/Continent.js"></script>
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
									<div class="card-block">
										<input type="hidden" value="${url}" id="formURLHidden" />
										<form:form modelAttribute="continentMO" id="continentFormId" method="POST">
										
											<div class="row">
												<div class="col-md-12">
													<div class="card">
														<div class="card-header"><h5>Country Details</h5>
															<!-- <div class="card-header-right">
																<a href="#" class="btn btn-sm btn-primary" id="branchAdd" onclick="$(this).continent();">
																	<i class="feather icon-plus-circle"></i>Add Continent
																</a>
															</div> -->
														</div>
														<div class="card-body">
															 <div class="branchAccTbl" id="brAcc">
															 <c:forEach begin="0" end="${continentMO.continentDOs.size() == 0 ? 0 : continentMO.continentDOs.size()-1}" var="i"> 
																<div class="brachMain" id="brachMainId${i}">
																	<div class="row">
																		<div class="col-md-12 border" style="height:95px;">
																			<div class="row">
																				<div class="col-sm-3"><label>Continent Id</label></div>
																				<div class="col-sm-3"><label>Continent Name<span style="color: red">*</span></label></div>
																				<div class="col-sm-3"><label>Active</label></div>
																			</div>
																			<div class="row">
																				<div class="col-sm-3">
																					<form:hidden path="continentDOs[${i}].Id"/>
																					<form:input path="continentDOs[${i}].continentId" class="form-control countryId input-sm" readonly="true" placeholder="Auto Generated"/>
																				</div>
																				<div class="col-sm-3"><form:input path="continentDOs[${i}].continentName" class="form-control input-sm validateClass" onclick="$(this).removeCss()"/></div>
																				
																				<div class="col-sm-3">
																				<form:select id="" path="continentDOs[${i}].active" class="form-control ">
																				            <form:option value=""><f:message code="label.select"/></form:option>
																			                <c:forEach items="${continentMO.getComboActive()}" var="var01" >
																		                <form:option value="${var01.comboField}">${var01.text}</form:option>
																	                    </c:forEach> 
																				</form:select>
																				</div>
																				<div></div>
																				<div></div>
																		<div class="col-md-3 float-right" ><a href="#" id="" class="btn dynamicSubDelete" style="float:right;"><i class="feather icon-minus-circle float-right"></i></a></div>
																			</div>
																		</div>
																		
																		<div></div>
																		
																	</div>
																	 
																	<br>
																</div>
															 </c:forEach>  
															
															</div> 
														</div>
														
														<div class="" style="float: right;">
																        <a href="#" class="btn btn-sm btn-primary" style="float:right;" id="branchAdd" onclick="$(this).continent();">
																	             <i class="feather icon-plus-circle"></i>Add Continent
																          </a>
														</div>
													</div>
												</div>
											</div>
											<div class="row" style="float: right;">
												<a href="./ContinentSearch.html" class="btn btn-danger btn-sm" role="button">Cancel</a>
												<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('continentFormId','btnId');" id="btnId">
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