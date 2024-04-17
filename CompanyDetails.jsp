 <%@include file="TagLibraries.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
$(document).ready(function(){
	
	var form_URL = $("#formURLHidden").val();
	$.fn.validfunction = function(formId, btnID)
	{
		//$(this).validfields(formid, errorid, errormessages);
		$(this).validFields(formId,form_URL  , btnID);
	};
	
});
</script>
<script lang="javascript" src="resources/Javascript/DragDropFileUpload.js"></script>
<link type="text/css" rel="stylesheet" href="resources/Css/DragDropFileUpload.css" />
<script lang="javascript"	src='<c:url value="resources/Javascript/Company.js"></c:url>'></script>
<script type="text/javascript">


</script>
<style>
legend.scheduler-border {
    width:inherit; /* Or auto */
    padding:0 10px; /* To give a bit of padding on the left and right */
    border-bottom:none;
}
</style>
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
									<input type="hidden" value="${url}" id="formURLHidden" />
									<form:form id="companyform" method="POST" value="${url}"
										modelAttribute="companyMO" enctype="multipart/form-data">
														
							
								<div class="row">
									<div class="col-sm-12">
										<div class="card">
											<div class="card-header"><h5>Company Details</h5></div>
											<div class="card-block">

														<div class="row">
														
														<div class="form-group col-md-4">
														<form:hidden path="companyDO.Id" />
																<label>Company ID<span style="color: red">*</span></label>
																<form:input path="companyDO.companyId" type="text"
																	id="roleId" class="form-control validateClass"
																	onkeyup="$(this).upperCase()" />
																	<form:hidden path="" id="companyId"/>
															</div>

															<div class="form-group col-md-4">
																<label>Company Name <span style="color: red">*</span></label>
																<form:input path="companyDO.companyName" type="text"
																	id="roleName" class="form-control validateClass" />
															</div>

															

															<div class="form-group col-md-4">
																<label>Mailing Name</label>
																<form:input path="companyDO.mailingName"
																	class="form-control " maxlength="255"
																	></form:input>
															</div>
														</div>
														
												<div class="row">
														<div class="form-group col-md-4">
																<label>Statutory Compliance For</label>
																<form:select class="form-control" id="countryId"
																	path="companyDO.countryDO.id" onchange="$(this).getDetailsOfCountry('change');">
																	<c:forEach items="${companyMO.getCurrencyList()}" var="Obj">
																		<form:option value="${Obj.id}">${Obj.currencyName}</form:option>
																	</c:forEach>
																</form:select>
															</div>
															
															<div class="form-group col-md-4">
																<label>Telephone Number</label>
																<form:input path="companyDO.phoneNum"
																	class="form-control phNum " id="phNum" maxlength="12"/>
															</div>
															
															
															<div class="form-group col-md-4">
																<label>Mobile Number</label>
																<form:input path="companyDO.mobile"
																	class="form-control " id="mbNum" maxlength="10"/>
															</div>
															
													</div>
													
													<div class="row">
													<div class="form-group col-md-5">
																<label>Address</label>
																<form:input path="companyDO.address"
																	class="form-control " 
																	></form:input>
															</div>
															
															<div class="form-group col-md-5">
																<label>Email</label>
																<form:input path="companyDO.emailId"
																	class="form-control email validateField emailId" id="emailId" />
															</div>
															
														</div>
													
													<fieldset class="border p-2 baseCurrBlk" style="display:none;">
                                                           <legend>Base Currency Details:</legend>
													<div class="row">
													
													
													  <div class="form-group col-md-4">
																<label>Base Currency Symbol</label>
																<form:input 
																	class="form-control " readonly="true" path="" id="baseCurrSym"
																	></form:input>
															</div>
															
															<div class="form-group col-md-4">
																<label>Formal Name</label>
																<form:input 
																	class="form-control " readonly="true" path="" id="formalName"
																	></form:input>
															</div>
															
															
															<div class="form-group col-md-4">
																<label>Number Of Decimal Places</label>
																<form:input 
																	class="form-control "  readonly="true" path="" id="noOfDecPlace"
																	></form:input>
															</div>
															
													</div>
													
													<div class="row">
													<div class="form-group col-md-4">
																<label>Is Symbol Suffixed To Amount</label>
																<form:input 
																	class="form-control " readonly="true" path="" id="suffixAmt"
																	></form:input>
															</div>
															
															<div class="form-group col-md-4">
																<label>Symbol For Decimal Position</label>
																<form:input 
																	class="form-control " readonly="true" path="" id="decPos"
																	></form:input>
															</div>
															
															
															<div class="form-group col-md-4">
																<label>Show Amount In</label>
																<form:input 
																	class="form-control " readonly="true" path="" id="amtIn"
																	></form:input>
															</div>
															
													</div>
													
													<div class="row">
													<div class="form-group col-md-4">
																<label>Amount And Symbol Separated By</label>
																<form:input 
																	class="form-control " readonly="true" path="" id="amtSeparatedBy"
																	></form:input>
															</div>
															
															<div class="form-group col-md-4">
																<label>Decimal Separated By</label>
																<form:input 
																	class="form-control " readonly="true" path="" id="decSeparatedBy"
																	></form:input>
															</div>
															
															
															<div class="form-group col-md-4">
																<label>Decimal Place For Printing Amounts In Words</label>
																<form:input 
																	class="form-control " readonly="true" path="" id="printAmtInWrds"
																	></form:input>
															</div>
															
													</div>
													</fieldset>
												
													
													<div class="row">
													<div class="form-group col-md-4">
													<label>Auto Backup</label>
													          <form:select class="form-control"
																	path="companyDO.autoBackUp">
																	<c:forEach items="${companyMO.getComboActiveList()}" var="Obj">
																		<form:option value="${Obj.comboField}">${Obj.text}</form:option>
																	</c:forEach>
																</form:select>
																
															</div>
															
															<div class="form-group col-md-4">
																<label>Path</label>
																<form:input path="companyDO.path"
																	class="form-control " 
																	></form:input>
															</div>
															
															
															<div class="form-group col-md-4">
																<label>Currency Symbol</label>
																<form:input path="companyDO.currSys"
																	class="form-control " 
																></form:input>
															</div>
															
													</div>
													
													
													<div class="row">
													<div class="form-group col-md-5">
																<label>Books Beginning From</label>
																<form:input path=""
																	class="form-control " 
																	></form:input>
															</div>
															
															<div class="form-group col-md-5">
																<label>Active</label>
																 <form:select class="form-control"
																	path="companyDO.active">
																	<c:forEach items="${companyMO.getComboActiveList()}" var="Obj">
																		<form:option value="${Obj.comboField}">${Obj.text}</form:option>
																	</c:forEach>
																</form:select>
															</div>
															
															
															

															
													</div>
													
													
													<div class="row">
													
													<div class="form-group col-md-6">
													         <label>Upload Logo </label>
                                                                 <div class="file-upload-wrapper">
                                                                       <form:input type="file" path="companylogimg" id="input-file-now" class="file-upload" />
                                                                   </div>
															</div>		
													</div>
													
													<div class="row">
													<div class="form-group col-md-5">
																<label>Depreciation Frequency</label>
																<form:select class="form-control"
																	path="companyDO.depFrequency">
																	<c:forEach items="${companyMO.getDepFreqList()}" var="Obj">
																		<form:option value="${Obj.comboField}">${Obj.text}</form:option>
																	</c:forEach>
																</form:select>
															</div>
															
															<div class="form-group col-md-5">
																<label>Currency</label>
																<form:select class="form-control"
																	path="companyDO.currencyId.id">
																	<c:forEach items="${companyMO.getCurrencyList()}" var="Obj">
																		<form:option value="${Obj.id}">${Obj.currencyName}</form:option>
																	</c:forEach>
																</form:select>
															</div>
															
															
													</div>
											</div>
												</div > 
												 
				                               </div> </div>
				                               
				                               <div class="row">
									<div class="col-sm-12">
										<div class="card">
											<div class="card-header"><h5>Document Name</h5></div>
											<div class="card-block">

														<div class="row">
														
														<div class="form-group col-md-4">
																<label>Pan Card <span style="color: red">*</span></label>
                                                                 <div class="file-upload-wrapper">
                                                                      <form:input type="file" path="files" id="input-file-pan" class="file-upload validateClass" />
                                                                 </div>
															</div>
														</div>
													</div>
													
													  
  
												</div > 
												 
				                               </div> </div>
			
													<div class="row" style="float: right;">
																<a onclick="javascript:cancleFunction('./CompanySearch.html?action=cancel')"  class="btn btn-danger btn-sm" role="button">Cancel</a>
																	<button class="btn btn-success btn-sm" type="button"	onclick="$(this).validfunction('companyform','btnId')"	id="btnId">
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