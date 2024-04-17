<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="./resources/Javascript/Purchase.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var form_URL = $("#formURLHidden").val();
		$.fn.validfunction = function(formId, btnID) {
			$(this).validFields(formId, form_URL, btnID);
			/* $('.changes').change(); */
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
									<img src="./resources/images/Three dots.gif" id="loading"
										style="display: none;">
									<div class="card" id="mainCard">
										<div class="card-header">
											<h5>Cashew Purchase</h5>
										</div>
										<div class="card-block">
											<input type="hidden" value="${url}" id="formURLHidden" />
											<form:form modelAttribute="purchaseMO" id="cashewFormId"
												method="POST">
												<div class="brachMain" id="mainBlkId">
													<div class="row">
														<div class="col-sm-4">
															<label>Branch<span style="color: red">*</span></label>
															<form:hidden path="purchaseDO.Id" />
															<form:hidden path="purchaseDO.purchaseId" />
															<form:hidden path="purchaseDO.companyDO.id"
																value="${compId}" />
															<input type="hidden" id="approver" value="${approver}" />
															<input type="hidden" id="type" value="${type}" /> <input
																type="hidden" id="commLed" value="${commLed}" /> <input
																type="hidden" id="typeLed" value="${typeLed}" /> <input
																type="hidden" id="voucher" value="${voucher}" /> <input
																type="hidden" id="role" value="${role}" />

															<form:hidden path="purchaseDO.branchDO.id" id="branchId" />
															<form:select path="purchaseDO.branch" id="branchAuId"
																onchange="$(this).branchChange()"
																class="form-control validateClass removeCss">
																<option value="">Select</option>
																<c:forEach items="${purchaseMO.getBranchDOs()}" var="k">
																	<form:option data-id="${k.id}" value="${k.branchId}">${k.branchName}</form:option>
																</c:forEach>
															</form:select>
														</div>

														<div class="col-sm-4">
															<label>Warehouse Location</label>
															<%-- <form:select path="purchaseDO.warehouseDO.id" id="wareHouseId" onchange="" class="form-control input-sm">
														<option value="">Select</option>
														<c:forEach items="${purchaseMO.getWarehouse()}" var="k">
															<form:option  value="${k.id}">${k.wareHouseName}</form:option>
														</c:forEach>
													</form:select> --%>

															<form:select path="warehouseInc" id="wareHouseId"
																onchange="" class="form-control input-sm">
																<option value="">Select</option>
																<c:forEach items="${purchaseMO.getWarehouse()}" var="k">
																	<form:option value="${k.id}">${k.wareHouseName}</form:option>
																</c:forEach>
															</form:select>


														</div>
													</div>
													<br>
													<c:forEach begin="0"
														end="${purchaseMO.purchaseDO.purchaseDetails.size() == 0 ? 0 : purchaseMO.purchaseDO.purchaseDetails.size() -1}"
														var="i">
														<!-- <div class="row float-right">
															<a href="#" class="btn btn-sm btn-primary"
																onclick="$(this).addPurchaseDtls();">Add</a>
														</div> -->
														<div class="subBlock border" id="subBlkId${i}">
															<div class="row">
																<div class="col-sm-1">
																	<label>Sr No.</label>
																	<form:hidden path="currDetail" id="ware"
																		class="warehouseNam" value="${dtlsId}" />
																	<form:hidden path="purchaseDO.purchaseDetails[${i}].Id"
																		class="purchaseId" />
																	<form:hidden
																		path="purchaseDO.purchaseDetails[${i}].transId" />
																	<form:hidden
																		path="purchaseDO.purchaseDetails[${i}].status"
																		class="statusdetails" />
																	<form:hidden class="purcseId noIncr"
																		path="purchaseDO.purchaseDetails[${i}].purchaseDO.purchaseId" />
																	<form:hidden path="" class="count noIncr" value="0" />
																	<form:input type="hidden"
																		path="purchaseDO.purchaseDetails[${i}].autoIncr"
																		class="sr" />
																	<span class="span_DIV" class="sr">${i + 1}</span>
																</div>
																<div class="col-sm-2">
																	<label>Date<span style="color: red">*</span></label>
																	<form:input
																		path="purchaseDO.purchaseDetails[${i}].date"
																		class="form-control input-sm date changes validateClass dynamicAddDate" id="newdate" onchange="$(this).dateChange();" />
																</div>
																<div class="col-sm-2 Batch_DIV">
																	<label>B.No</label>
																	<form:input
																		path="purchaseDO.purchaseDetails[${i}].batchNo"
																		class="form-control number changes input-sm btchNo"
																		onchange="" />
																	<!--  $(this).checkStatus(); -->
																</div>
																<div class="col-sm-2 Select_DIV">
																	<label>Vendor<span style="color: red">*</span></label>
																	<form:select
																		path="purchaseDO.purchaseDetails[${i}].intrmDO.id"
																		class="form-control slect changes validateClass removeCss"
																		id="myref${i}" onchange="$(this).vendorChamge();">
																		<option value="">Select</option>
																		<c:forEach items="${purchaseMO.getIntrmDOs()}" var="j">
																			<form:option data-extfld="${j.extFldOne}"
																				value="${j.id }">${j.name}</form:option>
																		</c:forEach>
																	</form:select>
																	<form:input type="hidden"
																		path="purchaseDO.purchaseDetails[${i}].intrmDO.extFldOne" />
																</div>
																<div class="col-sm-2">
																	<label>Bags</label>
																	<form:input
																		path="purchaseDO.purchaseDetails[${i}].bags"
																		class="form-control changes input-sm number totalBags"
																		onblur="$(this).totalbags();" />
																</div>
																<div class="col-sm-2">
																	<label>Net Wt(Kg's)</label>
																	<form:input path="purchaseDO.purchaseDetails[${i}].kgs"
																		class="form-control input-sm totalKgs changes decimal validateField text-right"
																		onblur="$(this).totalKgs();"
																		onchange="$(this).calcTotal()" />
																</div>
															</div>
															<div class="row">
																<div class="col-sm-1">
																	<label>Price/Kg</label>
																	<form:input
																		path="purchaseDO.purchaseDetails[${i}].pricePerKg"
																		class="form-control input-sm decimal changes pricePerKg validateField text-right"
																		onchange="$(this).calcTotal()" />
																</div>
																<div class="col-sm-2">
																	<label>Total</label>
																	<form:input
																		path="purchaseDO.purchaseDetails[${i}].totalPrice"
																		class="form-control input-sm totalPrice decimal validateField readonly text-right "
																		onblur="$(this).totalPrice();" readonly="true" />
																</div>
																<div class="col-sm-2">
																	<label>Commission</label>
																	<form:input
																		path="purchaseDO.purchaseDetails[${i}].commission"
																		class="form-control input-sm totalCommission decimal changes validateField text-right"
																		onblur="$(this).totalComm();" />
																</div>
																<div class="col-sm-2">
																	<label>Grand Total</label>
																	<form:input
																		path="purchaseDO.purchaseDetails[${i}].totalComm"
																		class="form-control input-sm totals decimal validateField readonly text-right"
																		onblur="$(this).totals();" readonly="true" />
																</div>
																<div class="col-sm-1">
																	<label>Nut Count</label>
																	<form:input
																		path="purchaseDO.purchaseDetails[${i}].nutCount"
																		class="form-control input-sm decimal changes validateField text-right" />
																</div>
																<div class="col-sm-1">
																	<label>Outturn</label>
																	<form:input
																		path="purchaseDO.purchaseDetails[${i}].outTurn"
																		class="form-control input-sm decimal changes validateField text-right" />
																</div>
																<div class="col-sm-1">
																	<label>Moisture</label>
																	<form:input
																		path="purchaseDO.purchaseDetails[${i}].moisture"
																		class="form-control input-sm decimal changes validateField text-right" />
																</div>
																<div class="col-sm-1">
																	<c:if test="${approver==true}">
																		<div class="checkbox d-inline float-right">
																			<label>Approve</label> <input type="hidden"
																				value="${purchaseMO.purchaseDO.purchaseDetails[i].approve}"
																				class="checkVal doNothingInp"> <input
																				name="purchaseDO.purchaseDetails[${i}].approve"
																				type="checkbox" class="checkbox dynamicInputId"
																				onclick="$(this).checkVal();" id="chkBx${i}"
																				value="N" /> <label for="chkBx${i}" class="cr"></label>
																		</div>
																	</c:if>
																</div>
																<div class="col-sm-1">
																	<a href="javascript:;" id=""
																		class="btn dynamicChildDelete"><i
																		class="feather icon-minus-circle float-right"></i></a>
																</div>
															</div>
															<div class="row">
																<div class="col-sm-10 comment" style="display: none">

																	<label>Comment</label>
																	<form:textarea
																		path="purchaseDO.purchaseDetails[${i}].comment"
																		class="form-control changes input-sm " cols="255"
																		rows="2" />
																</div>


															</div>
															
															

															<br>
														</div>
													</c:forEach>
													<div class="row float-right">
															<a href="#" class="btn btn-sm btn-primary"
																onclick="$(this).addPurchaseDtls();">Add</a>
														</div>
												</div>
												<div class="row">
													<!-- <div class="col-sm-1">
													<label>Totals</label>
												</div> -->
													<div class="col-sm-2">
														<label>Total Bags</label>
														<form:input path="purchaseDO.totalBags"
															class="form-control input-sm bagTotal" readonly="true" />
													</div>
													<div class="col-sm-2">
														<label>Total Kg's </label>
														<form:input path="purchaseDO.totalKgs"
															class="form-control input-sm kgTotal decimal validateField text-right"
															readonly="true" />
													</div>
													<div class="col-sm-2">
														<label>Total Price</label>
														<form:input path="purchaseDO.totalPrice"
															class="form-control input-sm priceTotal decimal validateField text-right"
															readonly="true" />
													</div>
													<div class="col-sm-2">
														<label>Total Commission</label>
														<form:input path="purchaseDO.totalComm"
															class="form-control input-sm commTotal decimal validateField text-right"
															readonly="true" />
													</div>
													<div class="col-sm-2">
														<label>Net Total</label>
														<form:input path="purchaseDO.total"
															class="form-control input-sm fiTotal decimal validateField text-right"
															readonly="true" />
													</div>
												</div>
												<br>
												<div class="row" style="float: right;">
													<a href="./PurchaseSearch.html?page=cashew"
														class="btn btn-danger btn-sm" role="button">Cancel</a>
													<button class="btn btn-success btn-sm" type="button"
														onclick="$(this).validfunction('cashewFormId','btnId');"
														id="btnId">
														<span class="spinner-grow spinner-grow-sm" id="loadindGif"
															style="display: none;"></span> <b id="btnTextId">Submit</b>
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