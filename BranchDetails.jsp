 <%@include file="TagLibraries.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script lang="javascript" src="resources/Javascript/DragDropFileUpload.js"></script>
<link type="text/css" rel="stylesheet" href="resources/Css/DragDropFileUpload.css" />

<script type="text/javascript">
var formId="setUpFormId";
$(document).ready(function(){
	var form_URL = $("#formURLHidden").val();
	$.fn.validfunction = function(formId, btnID)
	{
		$(this).validFields(formId,form_URL  , btnID);
	};
	
	var days=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
	var daysID=["SUN","MON","TUES","WED","THUR","FRI","SAT"];
	
	html='<option value="">'+"Select Day"+'</option>';
	
	for(var d=0;d<days.length;++d){
		html += '<option value="' + daysID[d] + '">' +days[d] + '</option>';
	}
	$('#daysFrom, #daysTo').append(html);
	if($('#daysvalFrom').val()){
		$('#daysFrom option[value="'+$('#daysvalFrom').val()+'"]').attr("selected", "selected");
	}
	if($('#daysvalTo').val()){
		$('#daysTo option[value="'+$('#daysvalTo').val()+'"]').attr("selected", "selected");
	}
});

</script>
</head>
<body>
<!-- [ Main Content ] start -->
	<div class="pcoded-main-container">
		<div class="pcoded-wrapper">
			<div class="pcoded-content">
				<div class="pcoded-inner-content">
					<div class="main-body">
						<div class="page-wrapper">
							<!-- [ Main Content ] start -->
							<div class="row">

								<div class="col-sm-12">
								<!-- 	<div class="card" style="">
										<div class="card-block"> -->
											<!-- <div class="card">
												<div class="card-body"> -->
													<input type="hidden" value="${url}" id="formURLHidden" />
													<form:form id="locationform" method="POST" value="${url}"
														modelAttribute="locationMO" enctype="multipart/form-data">
														
							
								<div class="row">
									<div class="col-sm-12">
										<div class="card">
											<div class="card-header"><h5>Branch Detail</h5></div>
											<div class="card-block">

														<div class="row">
														<div class="form-group col-md-2">
															<form:hidden path="branchDO.id"/>
															<label>Company<span style="color: red">*</span></label>
															<form:select path="branchDO.companyDO.id" class="form-control js-example-basic-single">
															<option value="">Select</option>
																<c:forEach items="${locationMO.getCompanyDOs()}" var="i">
																	<form:option value="${i.id}">${i.companyName}</form:option>
																</c:forEach> 
															</form:select>
														</div>
														<div class="form-group col-md-2">
																<label>Branch ID<span style="color: red">*</span></label>
																<form:input path="branchDO.branchId" type="text" id="roleId" class="form-control  input-sm" readonly="true" />
																<form:hidden path="" id="branchId"/>
															</div>

															<div class="form-group col-md-2">
																<label>Branch Name <span style="color: red">*</span></label>
																<form:input path="branchDO.branchName" type="text" id="roleName" class="form-control validateClass input-sm" />
															</div>

															<div class="form-group col-md-2">
																<label>Active</label>
																<form:select class="form-control js-example-basic-single" path="branchDO.active">
																	<c:forEach items="${locationMO.getComboActive()}" var="comboObj">
																		<form:option value="${comboObj.comboField}">${comboObj.text}</form:option>
																	</c:forEach>
																</form:select>
																
															</div>

															<div class="form-group col-md-2">
																<label>Parent Branch</label>
																<form:select path="branchDO.parentLocation" class="form-control js-example-basic-single">
																	<option value="">Select</option>
																	<c:forEach items="${locationMO.getBranchDOs()}" var="comboObj">
																		<form:option value="${comboObj.branchId}">${comboObj.branchName}</form:option>
																	</c:forEach>
																</form:select>
																<%-- <form:input path="branchDOparentLocation" class="form-control input-sm"/> --%>
															</div>
															<div class="form-group col-md-2">
																<label>Branch Type</label>
																<form:input path="branchDO.locationCatg" class="form-control input-sm" />
															</div>
														</div>
														
												<div class="row">
															
															<div class="form-group col-md-4">
																<label>Branch Manager's Name</label>
																<form:input path="branchDO.managerName" class="form-control input-sm" />
															</div>
															
															
															<div class=" form-group col-md-4">
																<label>Working Hours</label>
																<div class="input-group">
																<form:input path="branchDO.workHrFrom" type="text" class="form-control timepicker time input-sm" maxlength="10" id="fromTime"/> &nbsp;&nbsp;  
									                      		<form:input path="branchDO.workHrTo" type="text" class="form-control timepicker time input-sm" maxlength="10" id="toTime"/>
									                      	</div>
														</div>
															
															
													<div class="form-group  col-md-4">
														<label>Working Days</label>
															<div class="input-group">
																<form:hidden path="" value="${locationMO.getBranchDO().getWorkDayFrom()}" id="daysvalFrom"/>
									                            <form:select path="branchDO.workDayFrom" class="form-control  common WEEK custom-select" id="daysFrom"/>   &nbsp;&nbsp;
									                             <form:hidden path="" value="${locationMO.getBranchDO().getWorkDayTo()}" id="daysvalTo"/>
									                             <form:select path="branchDO.workDayTo" class="form-control  common WEEK custom-select" id="daysTo"/>
									                          </div>
													</div>
												</div > 
				                               </div> </div></div></div>
				                               
				                               <div class="row">
									<div class="col-sm-12">
										<div class="card">
											<div class="card-header"><h5>Communication Details</h5></div>
											<div class="card-block">

														<div class="row">
														
														<div class="form-group col-md-3">
																<label>Address 1<span style="color: red">*</span></label>
																<form:input path="branchDO.addr1" type="text"  class="form-control validateClass  input-sm" />
															</div>

															<div class="form-group col-md-3">
																<label>Address 2 <span style="color: red">*</span></label>
																<form:input path="branchDO.addr2" type="text"  class="form-control validateClass input-sm" />
															</div>
															<div class="form-group col-md-3">
																<label>Postal</label>
																<form:input path="branchDO.postal" class="form-control number input-sm postal"/>
															</div>
															<div class="form-group col-md-3">
																<label>Email</label>
																<form:input path="branchDO.email" class="form-control input-sm email validateField"/>
															</div>
														</div>
														
												<div class="row">
															  <div class="form-group col-md-3">
																<label>Mobile</label>
																<form:input path="branchDO.mobile" class="form-control input-sm number" maxlength="10"/>
															</div>
															<div class="form-group col-md-9">
																<label>Comments</label>
																<form:textarea path="branchDO.comments" class="form-control max-textarea input-sm" maxlength="255" rows="1"></form:textarea>
															</div>
												</div > 
				                                
				                               </div> </div></div></div>
				                               
				                               
				                               
												

												
												
													<div class="row" style="float: right;">
																<a onclick="javascript:cancleFunction('./LocationSearch.html?action=cancel')"  class="btn btn-sm btn-danger" role="button">Cancel</a>
																	<button class="btn btn-sm btn-success" type="button"	onclick="$(this).validfunction('locationform','btnId')"	id="btnId">
																			<span class="spinner-grow spinner-grow-sm"	id="loadindGif" style="display: none;"></span>
																			<b id="btnTextId">Submit</b>	</button>
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

</body>
</html>