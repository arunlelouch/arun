<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="./resources/Javascript/Sales.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var form_URL = $("#formURLHidden").val();
	$.fn.validfunction = function(formId, btnID)
	{
		$(this).validFields(formId,form_URL , btnID);
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
									<div class="card-header" ><h5>Cashew Sales</h5></div>
									<div class="card-block">
										<input type="hidden" value="${url}" id="formURLHidden" />
										<form:form modelAttribute="salesMO" id="salescashewFormId" method="POST">
										<div class="brachMain" id="mainBlkId">
											<div class="row">
												<div class="col-sm-4">
													<label>Branch<span style="color:red">*</span></label>
													<form:hidden path="salesDO.Id"/>
													<form:hidden path="salesDO.salesId"/>
													<form:hidden path="salesDO.companyDO.id" value="${compId}"/>
													<input type="hidden" id="approver" value="${approver}"/>
													<input type="hidden" id="type" value="${type}"/>
													<input type="hidden" id="voucher" value="${voucher}"/>
													<input type="hidden" id="ledger" value="${ledger}"/>
													<input type="hidden" id="role" value="${role}"/>
													<form:hidden path="salesDO.branchDO.id" id="branchId"/>
													<form:select path="salesDO.branch" class="form-control validateClass removeCss" id="branchAuId" onchange="$(this).branchSaleChange()">
														<form:option value="">Select</form:option>
														<c:forEach items="${salesMO.getBranchDOList()}" var="Obj">
															<form:option data-id="${Obj.id}" value="${Obj.branchId}">${Obj.branchName}</form:option>
														</c:forEach>
													</form:select> 
												</div>
												
												<div class="col-sm-4">
												<label>Warehouse Location</label>
												<%-- <form:select path="salesDO.warehouseDO.id" id="wareHouseId" onchange="" class="form-control input-sm">
														<option value="">Select</option>
														<c:forEach items="${salesMO.getWarehouse()}" var="k">
															<form:option  value="${k.id}">${k.wareHouseName}</form:option>
														</c:forEach>
													</form:select> --%>
													
													<form:select path="warehouseInc" id="wareHouseId"
																onchange="" class="form-control input-sm">
																<option value="">Select</option>
																<c:forEach items="${salesMO.getWarehouse()}" var="k">
																	<form:option value="${k.id}">${k.wareHouseName}</form:option>
																</c:forEach>
															</form:select>
													
												</div>
												
											</div><br>
											
											<c:forEach begin="0" end="${salesMO.salesDO.salesDetails.size() == 0 ? 0 : salesMO.salesDO.salesDetails.size() -1}" var="i">
												<div class="card-body border subBlock" id="subBlkId${i}">
													<div class="row">
														<div class="col-sm-1">
															<label>Sr No.</label>
															<form:hidden path="currDetail" id="ware" class="warehouseNam" value="${dtlsId}" />
															<form:hidden path="salesDO.salesDetails[${i}].Id"/>
															<form:hidden path="salesDO.salesDetails[${i}].transId"/>
															<form:hidden path="salesDO.salesDetails[${i}].status" class="statusdetails" />
															<form:hidden class="purcseId noIncr" path="salesDO.salesDetails[${i}].salesDO.salesId" />
															<form:input type="hidden" path="salesDO.salesDetails[${i}].autoIncr" class="sr"/>
															<span class="span_DIV" class="sr">${i + 1}</span>
														</div>
														<div class="col-sm-2">
															<label>Date<span style="color:red">*</span></label>
															<form:input path="salesDO.salesDetails[${i}].date" class="form-control input-sm changes date validateClass dynamicAddDate" id="newdate" onchange="$(this).dateChange();"/>
														</div>
														<div class="col-sm-2 Batch_DIV">
															<label>B.No</label>
															<form:input path="salesDO.salesDetails[${i}].batchNo" class="form-control number changes input-sm btchNo" />
														</div>
														<div class="col-sm-2 Select_DIV">
															<label>Client/Buyer<span style="color:red">*</span></label>
															<form:select path="salesDO.salesDetails[${i}].intrmDO.id" class="form-control  changes slect validateClass removeCss" id="vendor${i}" onchange="$(this).vendorChamge();">
																<option value="">Select</option>
																<c:forEach items="${salesMO.getIntrmDOList()}" var="Obj">
																	<form:option data-extfld="${Obj.extFldOne}" value="${Obj.id}">${Obj.name}</form:option>
																</c:forEach>
															</form:select>
															<form:input type="hidden" path="salesDO.salesDetails[${i}].intrmDO.extFldOne"/>
														</div>
														<div class="col-sm-2">
															<label>Bags</label>
															<form:input path="salesDO.salesDetails[${i}].bags" class="form-control number changes  input-sm totalBags" onblur="$(this).totalbags();"/>
														</div>
														<div class="col-sm-2">
															<label>Kg's</label>
															<form:input path="salesDO.salesDetails[${i}].kgs" class="form-control changes input-sm totalKgs decimal validateField text-right" onblur="$(this).totalKgs();"/>
														</div>
														<!-- <div class="col-sm-1">
															<a href="#" class="btn btn-sm btn-primary" onclick="$(this).addPurchaseDtls();">Add</a>
														</div> -->
													</div>
													<div class="row">
														<div class="col-sm-2">
															<label>Price/Kg</label>
															<form:input path="salesDO.salesDetails[${i}].pricePerKg" class="form-control changes input-sm decimal validateField text-right pricePerKg" onchange="$(this).calcTotal()"/>
														</div>
															<div class="col-sm-2">
															<label>Grand Total</label>
															<form:input path="salesDO.salesDetails[${i}].totalPrice" class="form-control input-sm totalPrice decimal validateField text-right readonly" onblur="$(this).totalPrice();" readonly="true"/>
														</div>
														<div class="col-sm-2">
															<label>Nut Count</label>
															<form:input path="salesDO.salesDetails[${i}].nutCount" class="form-control changes input-sm decimal validateField text-right" />
														</div>
														<div class="col-sm-2">
															<label>Out turn</label>
															<form:input path="salesDO.salesDetails[${i}].outturn" class="form-control changes input-sm decimal validateField text-right"/>
														</div>
														<div class="col-sm-2">
															<label>Moisture</label>
															<form:input path="salesDO.salesDetails[${i}].moisture" class="form-control changes input-sm decimal validateField text-right"/>
														</div>
														<div class="col-sm-1">
															<c:if test="${approver==true}">
		                                                        <div class="checkbox d-inline float-right">
		                                                        	<label>Approve</label>
		                                                       		<input type="hidden" value="${salesMO.salesDO.salesDetails[i].approve}" class="checkVal doNothingInp">
		                                                            <input name="salesDO.salesDetails[${i}].approve" type="checkbox" class="checkbox dynamicInputId" onclick="$(this).checkVal('Sale');" id="chkBx${i}" value="N"/>
		                                                        	<label for="chkBx${i}" class="cr"></label>
		                                                        </div>
		                                                     </c:if>
														</div>
														<div class="col-sm-1">
															<a href="javascript:;" id="" class="btn dynamicChildDelete"><i class="feather icon-minus-circle float-right"></i></a>
														</div>
													</div>
													<div class="row">
													<div class="col-sm-10 comment" style="display:none">
													
															<label>Comment</label>
															<form:textarea path="salesDO.salesDetails[${i}].comment"
															class="form-control changes input-sm " cols="255" rows="2" />
														</div>
													
													
													</div>
													<!-- <div class="row float-right">
															<a href="#" class="btn btn-sm btn-primary"
																onclick="$(this).addPurchaseDtls();">Add</a>
														</div> -->
												</div>
												</c:forEach>
												<div class="row float-right">
															<a href="#" class="btn btn-sm btn-primary"
																onclick="$(this).addPurchaseDtls();">Add</a>
														</div>
														<br>
											</div>
											<div class="row">
												<div class="col-sm-6"></div>
												<div class="col-sm-2">
													<label>Total Bags</label>
													<form:input path="salesDO.totalBags" class="form-control input-sm bagTotal" readonly="true"/>
												</div>
												<div class="col-sm-2">
												<label>Total Kg's </label>
													<form:input path="salesDO.totalKgs" class="form-control input-sm kgTotal decimal validateField text-right" readonly="true"/>
												</div>
												<div class="col-sm-2">
													<label>Net Total</label>
													<form:input path="salesDO.totalPrice" class="form-control input-sm priceTotal decimal validateField text-right" readonly="true"/>
												</div>
											</div><br>
											<div class="row" style="float: right;">
												<a href="./SalesSearch.html?page=cashew" class="btn btn-danger btn-sm" role="button">Cancel</a>
												<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('salescashewFormId','btnId');" id="btnId">
													<span class="spinner-grow spinner-grow-sm" id="loadindGif" style="display: none;"></span>
													<b id="btnTextId">Submit</b>
												</button>
											</div>
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