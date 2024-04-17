<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="./resources/Javascript/BankMaster.js"></script>
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
									<div class="card-header" ><h5>Bank Master</h5></div>
									<div class="card-block">
										<input type="hidden" value="${url}" id="formURLHidden" />
										<form:form modelAttribute="bankMO" id="bankMasterFormId" method="POST">
											<div class="row">
												<div class="col-sm-4">
													<label>Bank ID</label>
													<form:hidden path="bankDO.Id"/>
													<form:input path="bankDO.bankId" class="form-control input-sm" readonly="true" placeholder="Auto Generated"/>
												</div>
												<div class="col-sm-4">
													<label>Bank Name<span style="color: red">*</span></label>
													<form:input path="bankDO.bankName" class="form-control input-sm validateClass"/>
												</div>
											</div><br>	
											<div class="row">
												<div class="col-md-12">
													<div class="card">
														<div class="card-header"><h5>Branch & Accounting Details</h5>
															<div class="card-header-right">
																<a href="javascript:void();" class="btn btn-sm btn-primary" id="branchAdd" onclick="$(this).addBranch();">
																	<i class="feather icon-plus-circle"></i>Add Branch
																</a>
															</div>
														</div>
														<div class="card-body">
															<div class="branchAccTbl" id="brAcc">
															<c:forEach begin="0" end="${bankMO.bankDO.branchDOs.size() == 0 ? 0 : bankMO.bankDO.branchDOs.size() -1}" var="i">
																<div class="brachMain" id="branchMainId${i}">
																	<div class="row">
																		<div class="col-md-3 border">
																			<div class="row">
																				<div class="col-sm-6">
																					<label>Branch ID</label>
																				</div>
																				<div class="col-sm-6"><label>Branch Name<span style="color: red">*</span></label></div>
																			</div>
																			<div class="row">
																				<div class="col-sm-6">
																					<form:hidden path="bankDO.branchDOs[${i}].Id"/>
																					<form:input path="bankDO.branchDOs[${i}].branchId" class="form-control input-sm branchId" readonly="true" placeholder="Auto Generated"/>
																				</div>
																				<div class="col-sm-6"><form:input path="bankDO.branchDOs[${i}].branchName" class="form-control input-sm validateClass" onclick="$(this).removeCss()"/></div>
																			</div>
																		</div>
																		<div class="col-md-8 border">
																			<div class="row">
																				<div class="col-sm-3"><label>Account No<span style="color:red">*</span></label></div>
																				<div class="col-sm-4"><label>IFSC Code</label></div>
																				<div class="col-sm-4"><label>Swift</label></div>
																				<div class="col-sm-1">
																					<a href="javascript:void();" class="btn btn-sm btn-primary accAdd" id="accAdd${i}" onclick="$(this).addAccount(this.id);">
																						Add
																					</a>
																				</div>
																			</div>
																			<c:forEach begin="0" end="${bankMO.bankDO.branchDOs[i].accountDOs.size() == 0 ? 0 : bankMO.bankDO.branchDOs[i].accountDOs.size() -1}" var="j">
																				<div class="accTbl" id="acc${i}${j}">
																					<div class="row">
																						<div class="col-sm-3 accNum_DIV">
																						<form:hidden path="bankDO.branchDOs[${i}].accountDOs[${j}].Id" class="childInp"/>
																						<form:hidden path="bankDO.branchDOs[${i}].accountDOs[${j}].extFldone" class="childInp"/>
																						<form:input path="bankDO.branchDOs[${i}].accountDOs[${j}].accNo" class="form-control input-sm childInp accNum validateClass number" data-maxnumlimit="30"  onclick="$(this).removeCss()"/></div>
																						<div class="col-sm-4"><form:input path="bankDO.branchDOs[${i}].accountDOs[${j}].ifsc" class="form-control input-sm childInp" onchange="$(this).splCharVald()"/></div>
																						<div class="col-sm-4"><form:input path="bankDO.branchDOs[${i}].accountDOs[${j}].swift" class="form-control input-sm childInp" onchange="$(this).splCharVald()"/></div>
																						<div class="col-sm-1">
																							<a href="javascript:void();" id="" class="btn dynamicChildDelete"><i class="feather icon-minus-circle float-right"></i></a>	
																						</div>
																					</div>
																				</div>
																			</c:forEach> 
																		</div>
																		<div class="col-md-1 float-right"><a href="javascript:void();" id="" class="btn dynamicSubDelete"><i class="feather icon-minus-circle float-right"></i></a></div>
																	</div>
																</div>
															</c:forEach> 
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="row" style="float: right;">
												<a href="./BankMasterSearch.html" class="btn btn-danger btn-sm" role="button">Cancel</a>
												<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('bankMasterFormId','btnId');" id="btnId">
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