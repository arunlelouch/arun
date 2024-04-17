<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="./resources/Javascript/Purchase.js"></script>
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
									<div class="card-header" ><h5>Coffee Sales</h5>
										<div class="card-header-right">
											<a href="./SalesSearch.html?page=coffee" class="btn btn-primary btn-sm" role="button">Search</a>
										</div>
									</div>
									<div class="card-block">
										<input type="hidden" value="${url}" id="formURLHidden" />
										<form:form modelAttribute="salesMO" id="salescoffeeFormId" method="POST">
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
													<form:hidden path="salesDO.branchDO.id" id="branchId"/>
													<form:select path="salesDO.branch" class="form-control validateClass removeCss" id="branchAuId" onchange="$(this).branchSaleChange()">
														<form:option value="">Select</form:option>
														<c:forEach items="${salesMO.getBranchDOList()}" var="Obj">
															<form:option data-id="${Obj.id}" value="${Obj.branchId}">${Obj.branchName}</form:option>
														</c:forEach>
													</form:select> 
												</div>
											</div><br>
											<div class="card">
												<div class="card-body">
												<div class="row float-right">
													<a href="#" class="btn btn-sm btn-primary " onclick="$(this).addPurchaseDtls();">Add</a>
												</div><br>
												<c:forEach begin="0" end="${salesMO.salesDO.salesDetails.size() == 0 ? 0 : salesMO.salesDO.salesDetails.size() -1}" var="i">
												<div class="subBlock" id="subBlkId${i}">
												<div class="row">
													<div class="col-sm-1">
															<label>Sr No.</label>
															<form:hidden path="salesDO.salesDetails[${i}].Id"/>
															<form:hidden path="salesDO.salesDetails[${i}].transId"/>
															<form:input type="hidden" path="salesDO.salesDetails[${i}].autoIncr" class="sr"/>
															<span class="span_DIV" class="sr">${i + 1}</span>
														</div>
													<div class="col-sm-2">
														<label>Date</label>
														<form:input path="salesDO.salesDetails[${i}].date" class="form-control input-sm date dynamicAddDate" id="newdate" onchange="$(this).dateChange();"/>
													</div>
													<div class="col-sm-2 Batch_DIV">
														<label>B.No</label>
														<form:input path="salesDO.salesDetails[${i}].batchNo" class="form-control number input-sm btchNo"/>
													</div>
													<div class="col-sm-2 Select_DIV">
														<label>Vendor<span style="color:red">*</span></label>
														<form:select path="salesDO.salesDetails[${i}].intrmDO.id" class="form-control slect validateClass removeCss" id="vendor${i}" onchange="$(this).vendorChamge();">
															<option value="">Select</option>
															<c:forEach items="${salesMO.getIntrmDOList()}" var="Obj">
																<form:option data-extfld="${Obj.extFldOne}" value="${Obj.id}">${Obj.name}</form:option>
															</c:forEach>
														</form:select>
														<form:input type="hidden" path="salesDO.salesDetails[${i}].intrmDO.extFldOne"/>
													</div>
													<div class="col-sm-2">
														<label>Bags</label>
														<form:input path="salesDO.salesDetails[${i}].bags" class="form-control number input-sm totalBags" onblur="$(this).totalbags();"/>
													</div>
													<div class="col-sm-2">
														<label>KGS</label>
														<form:input path="salesDO.salesDetails[${i}].kgs" class="form-control input-sm totalKgs decimal validateField text-right" onblur="$(this).totalKgs();"/>
													</div>
												</div>	
												<div class="row">
													<div class="col-sm-2">
														<label>Price/Kg</label>
														<form:input path="salesDO.salesDetails[${i}].pricePerKg" class="form-control input-sm decimal validateField text-right pricePerKg" onchange="$(this).calcTotal()"/>
													</div>
													<div class="col-sm-2">
														<label>Grand Total</label>
														<form:input path="salesDO.salesDetails[${i}].totalPrice" class="form-control input-sm totalPrice decimal validateField text-right readonly" onblur="$(this).totalPrice();" readonly="true"/>
													</div>
													<div class="col-sm-3">
														<label>Type</label>
														<form:select path="salesDO.salesDetails[${i}].type" class="form-control">
															<option value="">Select</option>
															<c:forEach items="${salesMO.getTypeList()}" var="k">
																<form:option value="${k.comboField}">${k.text}</form:option>
															</c:forEach>
														</form:select>
													</div>
													<div class="col-sm-3">
														<label>Sortex/Non Sortex</label>
														<form:select path="salesDO.salesDetails[${i}].sortexornon" class="form-control">
															<option value="">Select</option>
															<c:forEach items="${salesMO.getSortexList()}" var="k">
																<form:option value="${k.comboField}">${k.text}</form:option>
															</c:forEach>
														</form:select>
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
														<a href="javascript:;" id="" class="btn dynamicChildDelete float-right"><i class="feather icon-minus-circle"></i></a>
													</div>
												</div>
												</div>
												</c:forEach>
											</div>
											</div>
											<div class="row">
												<div class="col-sm-2">
													<label>Total Bags</label>
													<form:input path="salesDO.totalBags" class="form-control input-sm bagTotal" readonly="true"/>
												</div>
												<div class="col-sm-2">
												<label>Total KGS </label>
													<form:input path="salesDO.totalKgs" class="form-control input-sm kgTotal decimal validateField text-right" readonly="true"/>
												</div>
												<div class="col-sm-2">
													<label>Total Price</label>
													<form:input path="salesDO.totalPrice" class="form-control input-sm priceTotal decimal validateField text-right" readonly="true"/>
												</div>
											</div><br>
											<div class="row" style="float: right;">
												<a href="./SalesSearch.html?page=coffee" class="btn btn-danger btn-sm" role="button">Cancel</a>
												<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('salescoffeeFormId','btnId');" id="btnId">
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