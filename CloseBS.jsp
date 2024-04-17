<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script language="javascript" src="./resources/Javascript/CloseBS.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var form_URL = $('#formURLHidden').val();
	$.fn.validfunction = function(formId, btnID) {
		$(this).validFields(formId, form_URL, btnID);
	}
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
								<div class="card" style="">
									<div class="card-header" >
										<h5>Accounting Details</h5>
									</div>
									<div class="card-block">
										<!-- <div class="card">
											<div class="card-header">Accounting Details</div>
											<div class="card-body"> -->
												<input type="hidden" value="${url}" id="formURLHidden" />
												<form:form method="POST" modelAttribute="CloseBSMO" id="bsCloseForm">
													<div class="row iteratorCls">
														<div class="col-sm-3"><label>Tax1</label><input class="form-control input-sm"/></div>
														<div class="col-sm-3"><label>Tax2</label><input class="form-control input-sm"/></div>
														<div class="col-sm-3"><label>Tax3</label><input class="form-control input-sm"/></div>
														<div class="col-sm-3"><label>Tax4</label><input class="form-control input-sm"/></div>
													</div>
													<br>
													<div class="row">
														<div class="col-md-12">
															<div class="card">
																<div class="card-header"><h5>Balance Sheet Details</h5></div>
																<div class="card-body">
																	<div class="row">
																		<div class="col-sm-2"><label>Start Date</label></div>
																		<div class="col-sm-2"><label>End Date</label></div>
																		<div class="col-sm-2"><label>Balance Sheet Year</label></div>
																		<div class="col-sm-2"><label>Close Balance Sheet Year</label></div>
																		<div class="col-sm-2"><label>PL Amount</label></div>
																		<div class="col-sm-2"><label>Verified</label></div>
																		<a href="#" class="btn" id="dynamicAddition" onclick="$(this).commonDatepickerAddition();" style="display: none;"></a>
																	</div>
																	<c:forEach begin="0" end="${CloseBSMO.setupBSDOs.size() == 0 ? 0 : CloseBSMO.setupBSDOs.size() - 1}" var="i">
																	<div class="row dynamicAdd" id="AccSetup${i}">
																		<div class="col-sm-2">
																		<form:hidden path="setupBSDOs[${i}].Id" />
																		<form:input  path="setupBSDOs[${i}].fyStrtDT" id="fyStrDT${i}" title="${financialStrtDate}[${i}]" class="form-control input-sm date dynamicAddDate fyStrDT" maxlength="10"/>
																		</div>
																		<div class="col-sm-2">
																		<form:input  path="setupBSDOs[${i}].fyEnDT" id="fyEnDT${i}" class="form-control input-sm date dynamicAddDate fyEnDT" title="${financialEndDate}[${i}]" maxlength="10" />
																		</div>
																		<div class="col-sm-2">
																		<input name="abc[${i}]" type="hidden" value="${CloseBSMO.setupBSDOs[i].balYear}" id="hiddenCurrYear" class="hiddenClass"/>
																		<form:input path="setupBSDOs[${i}].balYear" id="curYear" readonly="${editBoolean}" class="form-control input-sm year" onblur="$(this).checkbalyearexists();"/>
																		</div>
																		<div class="col-sm-2">
																		<input type="hidden" name="abc[${i}]" value="${CloseBSMO.setupBSDOs[i].closebs}" class="closeBs"/>
		    	  														<form:checkbox path="setupBSDOs[${i}].closebs" value="N" id="lastyear" onchange="$(this).checkclsdornot();"/>
																		</div>
																		<div class="col-sm-2">
																		<form:input path="setupBSDOs[${i}].plAmount" class="form-control input-sm" id="plAmt" readonly="true" value="0.00"/>
																		</div>
																		<div class="col-sm-2">
																			<c:choose>
																    	   		<c:when test="${sessionScope.accHead eq 'true'}">
																    	   			<input type="hidden" name="abc[${i}]" value="${CloseBSMO.setupBSDOs[i].auditVer}" class="auditVer" />
																	    	  		<form:checkbox path="setupBSDOs[${i}].auditVer" value="N" id="verified"  onchange="$(this).setValues();" class="verified"/>
																    	   		</c:when>
																				<c:otherwise>
																					<input type="hidden" name="abc[${i}]" value="${CloseBSMO.setupBSDOs[i].auditVer}" class="auditVer"/>
																	    	  		<form:checkbox path="setupBSDOs[${i}].auditVer" value="N" id="verified" disabled="true" class="verified"/>
																				</c:otherwise>		    	   		
																    	   	</c:choose>
																		</div>
																	</div>
																	</c:forEach>
																</div>
															</div>
														</div>
													</div>
													<div class="row" style="float: right;">
														<button class="btn btn-success btn-sm" type="button"
															onclick="$(this).validfunction('bsCloseForm','btnId');"
															id="btnId">
															<span class="spinner-grow spinner-grow-sm"
																id="loadindGif" style="display: none;"></span>
															<b id="btnTextId">Submit</b>
														</button>
													</div>
												</form:form>
											<!-- </div>
										</div> -->
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