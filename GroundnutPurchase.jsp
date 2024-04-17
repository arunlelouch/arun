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
<style type="text/css">

 .colortext{
 color: blue;
 }
 
 div.scrollactive {
  
  height: 600px;
 
  overflow-y: scroll;
}
 
 

.activity-feed {
  padding: 15px;
}
.activity-feed .feed-item {
  position: relative;
  padding-bottom: 20px;
  padding-left: 30px;
  border-left: 2px solid #e4e8eb;
}
.activity-feed .feed-item:last-child {
  border-color: transparent;
}
.activity-feed .feed-item:after {
  content: "";
  display: block;
  position: absolute;
  top: 0;
  left: -6px;
  width: 10px;
  height: 10px;
  border-radius: 6px;
  background: #fff;
  border: 1px solid #f37167;
}
.activity-feed .feed-item .date {
  position: relative;
  top: -5px;
  color: #8c96a3;
  text-transform: uppercase;
  font-size: 13px;
}
.activity-feed .feed-item .text {
  position: relative;
  top: -3px;
}



	#accAdd {
	    /* position: absolute;
	    top: 100px;
	    right: 1px;
	    width: 100px;
	    height: 100px;
	    -webkit-transition: all 2s ease-in-out;
	    transition: all 2s ease-in-out;
	    z-index: 1;
	    border-radius: 3px 0 0 3px;
	    padding: 10px;
	    background-color: #41a6d9;
	    color: white;
	    text-align: center;
	    box-sizing: border-box; */
	    
	}
</style>
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
								<div class="card-header" ><h5>Ground Nut Purchase</h5>
								<c:if test="${edit == true}">
								<button type="button" class="btn btn-primary float-right" onclick="$(this).getPurchaseActivityLogsDetails();">Activity Logs</button>
										 <button type="button" style="display: none;" class="btn btn-primary float-right activityhiddenbtn" data-toggle="modal" data-target="#exampleModal" >Activity Logs</button>
										 </c:if>
								</div>
									<div class="card-block">
										<input type="hidden" value="${url}" id="formURLHidden" />
										<form:form modelAttribute="purchaseMO" id="groundNutFormId" method="POST">
											<div class="brachMain" id="mainBlkId">
											<div class="row">
												<div class="col-sm-4">
													<label>Branch<span style="color:red">*</span></label>
													<form:hidden path="purchaseDO.Id" id="purchaseId"/>
													<form:hidden path="purchaseDO.purchaseId"/>
													<form:hidden path="purchaseDO.companyDO.id" value="${compId}"/>
													<input type="hidden" id="approver" value="${approver}"/>
													<input type="hidden" id="type" value="${type}"/>
													<input type="hidden" id="commLed" value="${commLed}"/>
													<input type="hidden" id="typeLed" value="${typeLed}"/>
													<input type="hidden" id="voucher" value="${voucher}"/>
													<form:select path="purchaseDO.branch" id="branchAuId" onchange="$(this).branchChange()" class="form-control validateClass removeCss">
														<option value="">Select</option>
														<c:forEach items="${purchaseMO.getBranchDOs()}" var="k">
															<form:option value="${k.branchId}">${k.branchName}</form:option>
														</c:forEach>
													</form:select> 
												</div>
											</div><br>
											
											<div class="row">
											<div class="col-sm-12">
					                                    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					                                    	

					                                        <li class="nav-item">
					                                            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">
					                                            Pending for Approval&nbsp;<c:if test="${dcrMO.pending.size() > 0}"><span class="badge-lg badge-light badge-pill">${dcrMO.pending.size()}</span></c:if>
					                                            </a>
					                                        </li>
					                                        <li class="nav-item">
					                                            <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">
					                                            Modified&nbsp;<c:if test="${dcrMO.modified.size() > 0}"><span class="badge-lg badge-light badge-pill">${dcrMO.modified.size()}</span></c:if>
					                                            </a>
					                                        </li>
					                                         <li class="nav-item">
					                                            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">
					                                            Approved&nbsp;<c:if test="${dcrMO.approved.size() > 0}"><span class="badge-lg badge-light badge-pill">${dcrMO.approved.size()}</span></c:if>
					                                            </a>
					                                        </li>
					                                    </ul>
					                                    <div class="tab-content" id="pills-tabContent">
					                                  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
					                                  <c:if test="${purchaseMO.approved.size() > 0}">
					                                  <c:forEach begin="0" end="${purchaseMO.approved.size() == 0 ? 0 : purchaseMO.approved.size() -1}" var="i">
												<div class="row float-right"><a href="#" class="btn btn-sm btn-primary" onclick="$(this).addPurchaseDtls();">Add</a></div>
												<div class="subBlock border" id="subBlkId${i}">
												<div class="row">
													<div class="col-sm-1">
														<label>Sr No.</label>
														<form:hidden path="approved[${i}].Id" id="detailsAutoId"/>
														<form:hidden path="approved[${i}].transId"/>
														<form:input type="hidden" path="approved[${i}].autoIncr" class="sr"/>
														<span class="span_DIV" class="sr">${i + 1}</span>
													</div>
													<div class="col-sm-2">
														<label>Date</label>
														<form:input path="approved[${i}].date" class="form-control input-sm date dynamicAddDate" id="newdate" onchange="$(this).dateChange();" />
													</div>
													<div class="col-sm-2 Batch_DIV">
														<label>B.No</label>
														<form:input path="approved[${i}].batchNo" class="form-control number input-sm btchNo"/>
													</div>
													<div class="col-sm-2 Select_DIV">
														<label>Vendor<span style="color:red">*</span></label>
														<form:select path="approved[${i}].intrmDO.id" class="form-control slect validateClass removeCss" id="vendor${i}" onchange="$(this).vendorChamge();">
															<option value="">Select</option>
															<c:forEach items="${purchaseMO.getIntrmDOs()}" var="j">
																<form:option data-extfld="${j.extFldOne}" value="${j.id }">${j.name}</form:option>
															</c:forEach>
														</form:select>
														<form:input type="hidden" path="approved[${i}].intrmDO.extFldOne"/>
													</div>
													<div class="col-sm-1">
														<label>Bags</label>
														<form:input path="approved[${i}].bags" class="form-control input-sm number totalBags" onblur="$(this).totalbags();"/>
													</div>
													<div class="col-sm-1">
														<label>New wt</label>
														<form:input path="approved[${i}].kgs" class="form-control input-sm totalKgs decimal validateField text-right" onblur="$(this).totalKgs();" onchange="$(this).calcTotal()"/>
													</div>
													<div class="col-sm-1">
														<label>Price/Kg</label>
														<form:input path="approved[${i}].pricePerKg" class="form-control input-sm decimal validateField text-right pricePerKg" onchange="$(this).calcTotal()"/>
													</div>
													<div class="col-sm-2">
														<label>Total</label>
														<form:input path="approved[${i}].totalPrice" class="form-control input-sm totalPrice decimal validateField text-right readonly" onblur="$(this).totalPrice();" readonly="true"/>
													</div>
												
												</div>	
												<div class="row">
													<div class="col-sm-2">
														<label>Commissions</label>
														<form:input path="approved[${i}].commission" class="form-control input-sm totalCommission decimal validateField text-right" onblur="$(this).totalComm();"/>
													</div>
													<div class="col-sm-2">
														<label>Grand Total</label>
														<form:input path="approved[${i}].totalComm" class="form-control input-sm totals decimal validateField text-right readonly" onblur="$(this).totals();" readonly="true"/>
													</div>
													<div class="col-sm-2">
														<label>Type</label>
														<form:select path="approved[${i}].vendorType" class="form-control">
															<option value="">Select</option>
															<c:forEach items="${purchaseMO.getTypeList()}" var="k">
																<form:option value="${k.comboField}">${k.text}</form:option>
															</c:forEach>
														</form:select>
													</div>
													<div class="col-sm-2">
														<label>Sortex/Non Sortex</label>
														<form:select path="approved[${i}].sortexornon" class="form-control">
															<option value="">Select</option>
															<c:forEach items="${purchaseMO.getSortexList()}" var="k">
																<form:option value="${k.comboField}">${k.text}</form:option>
															</c:forEach>
														</form:select>
													</div>
													<div class="col-sm-1">
														<c:if test="${approver==true}">
	                                                        <div class="checkbox d-inline float-right">
	                                                        	<label>Approve</label>
	                                                       		<input type="hidden" value="${purchaseMO.approved[i].approve}" class="checkVal doNothingInp">
	                                                            <input name="approved[${i}].approve" type="checkbox" class="checkbox dynamicInputId" onclick="$(this).checkVal();" id="chkBx${i}" value="N"/>
	                                                        	<label for="chkBx${i}" class="cr"></label>
	                                                        </div>
	                                                     </c:if>
													</div>
													<c:if test="${edit == true}">
													<div class="col-sm-1">
																					<input type="button" class="btn btn-primary btn-sm doNothingInp addInfoBtn" data-toggle="modal" data-target="#exampleModalCenter" value="Additional Info" onclick="$(this).getDcrDetailsId()">
																				</div>
																				</c:if>
													<div class="col-sm-1">
														<a href="javascript:;" id="" class="btn dynamicChildDelete float-right"><i class="feather icon-minus-circle"></i></a>
													</div>
												</div><br>
												</div>
												</c:forEach>
												</c:if>
					                                  </div>
					                                  <div class="tab-pane fade" id="pills-home" role="tabpanel" aria-labelledby="pills-profile-tab">
					                                  
					                                  <c:forEach begin="0" end="${purchaseMO.pending.size() == 0 ? 0 : purchaseMO.pending.size() -1}" var="i">
												<div class="row float-right"><a href="#" class="btn btn-sm btn-primary" onclick="$(this).addPurchaseDtls();">Add</a></div>
												<div class="subBlock border" id="subBlkId${i}">
												<div class="row">
													<div class="col-sm-1">
														<label>Sr No.</label>
														<form:hidden path="pending[${i}].Id" id="detailsAutoId"/>
														<form:hidden path="pending[${i}].transId"/>
														<form:input type="hidden" path="pending[${i}].autoIncr" class="sr"/>
														<span class="span_DIV" class="sr">${i + 1}</span>
													</div>
													<div class="col-sm-2">
														<label>Date</label>
														<form:input path="pending[${i}].date" class="form-control input-sm date dynamicAddDate"/>
													</div>
													<div class="col-sm-2 Batch_DIV">
														<label>B.No</label>
														<form:input path="pending[${i}].batchNo" class="form-control number input-sm btchNo"/>
													</div>
													<div class="col-sm-2 Select_DIV">
														<label>Vendor<span style="color:red">*</span></label>
														<form:select path="pending[${i}].intrmDO.id" class="form-control slect validateClass removeCss" id="vendor${i}" onchange="$(this).vendorChamge();">
															<option value="">Select</option>
															<c:forEach items="${purchaseMO.getIntrmDOs()}" var="j">
																<form:option data-extfld="${j.extFldOne}" value="${j.id }">${j.name}</form:option>
															</c:forEach>
														</form:select>
														<form:input type="hidden" path="pending[${i}].intrmDO.extFldOne"/>
													</div>
													<div class="col-sm-1">
														<label>Bags</label>
														<form:input path="pending[${i}].bags" class="form-control input-sm number totalBags" onblur="$(this).totalbags();"/>
													</div>
													<div class="col-sm-1">
														<label>New wt</label>
														<form:input path="pending[${i}].kgs" class="form-control input-sm totalKgs decimal validateField text-right" onblur="$(this).totalKgs();" onchange="$(this).calcTotal()"/>
													</div>
													<div class="col-sm-1">
														<label>Price/Kg</label>
														<form:input path="pending[${i}].pricePerKg" class="form-control input-sm decimal validateField text-right pricePerKg" onchange="$(this).calcTotal()"/>
													</div>
													<div class="col-sm-2">
														<label>Total</label>
														<form:input path="pending[${i}].totalPrice" class="form-control input-sm totalPrice decimal validateField text-right readonly" onblur="$(this).totalPrice();" readonly="true"/>
													</div>
												
												</div>	
												<div class="row">
													<div class="col-sm-2">
														<label>Commissions</label>
														<form:input path="pending[${i}].commission" class="form-control input-sm totalCommission decimal validateField text-right" onblur="$(this).totalComm();"/>
													</div>
													<div class="col-sm-2">
														<label>Grand Total</label>
														<form:input path="pending[${i}].totalComm" class="form-control input-sm totals decimal validateField text-right readonly" onblur="$(this).totals();" readonly="true"/>
													</div>
													<div class="col-sm-2">
														<label>Type</label>
														<form:select path="pending[${i}].vendorType" class="form-control">
															<option value="">Select</option>
															<c:forEach items="${purchaseMO.getTypeList()}" var="k">
																<form:option value="${k.comboField}">${k.text}</form:option>
															</c:forEach>
														</form:select>
													</div>
													<div class="col-sm-2">
														<label>Sortex/Non Sortex</label>
														<form:select path="pending[${i}].sortexornon" class="form-control">
															<option value="">Select</option>
															<c:forEach items="${purchaseMO.getSortexList()}" var="k">
																<form:option value="${k.comboField}">${k.text}</form:option>
															</c:forEach>
														</form:select>
													</div>
													<div class="col-sm-1">
														<c:if test="${approver==true}">
	                                                        <div class="checkbox d-inline float-right">
	                                                        	<label>Approve</label>
	                                                       		<input type="hidden" value="${purchaseMO.pending[i].approve}" class="checkVal doNothingInp">
	                                                            <input name="pending[${i}].approve" type="checkbox" class="checkbox dynamicInputId" onclick="$(this).checkVal();" id="chkBx${i}" value="N"/>
	                                                        	<label for="chkBx${i}" class="cr"></label>
	                                                        </div>
	                                                     </c:if>
													</div>
													 <c:if test="${edit == true}"> 
																				<div class="col-sm-1">
																					<input type="button" class="btn btn-primary btn-sm doNothingInp addInfoBtn" data-toggle="modal" data-target="#exampleModalCenter" value="Additional Info" onclick="$(this).getDcrDetailsId()">
																				</div>
																			</c:if> 
													<div class="col-sm-1">
														<a href="javascript:;" id="" class="btn dynamicChildDelete float-right"><i class="feather icon-minus-circle"></i></a>
													</div>
												</div><br>
												</div>
												</c:forEach>
												
					                                  </div>
					                                  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-profile-tab">
					                                  <c:if test="${purchaseMO.modified.size() > 0}">
					                                  <c:forEach begin="0" end="${purchaseMO.modified.size() == 0 ? 0 : purchaseMO.modified.size() -1}" var="i">
												<div class="row float-right"><a href="#" class="btn btn-sm btn-primary" onclick="$(this).addPurchaseDtls();">Add</a></div>
												<div class="subBlock border" id="subBlkId${i}">
												<div class="row">
													<div class="col-sm-1">
														<label>Sr No.</label>
														<form:hidden path="modified[${i}].Id" id="detailsAutoId"/>
														<form:hidden path="modified[${i}].transId"/>
														<form:input type="hidden" path="modified[${i}].autoIncr" class="sr"/>
														<span class="span_DIV" class="sr">${i + 1}</span>
													</div>
													<div class="col-sm-2">
														<label>Date</label>
														<form:input path="modified[${i}].date" class="form-control input-sm date dynamicAddDate"/>
													</div>
													<div class="col-sm-2 Batch_DIV">
														<label>B.No</label>
														<form:input path="modified[${i}].batchNo" class="form-control number input-sm btchNo"/>
													</div>
													<div class="col-sm-2 Select_DIV">
														<label>Vendor<span style="color:red">*</span></label>
														<form:select path="modified[${i}].intrmDO.id" class="form-control slect validateClass removeCss" id="vendor${i}" onchange="$(this).vendorChamge();">
															<option value="">Select</option>
															<c:forEach items="${purchaseMO.getIntrmDOs()}" var="j">
																<form:option data-extfld="${j.extFldOne}" value="${j.id }">${j.name}</form:option>
															</c:forEach>
														</form:select>
														<form:input type="hidden" path="modified[${i}].intrmDO.extFldOne"/>
													</div>
													<div class="col-sm-1">
														<label>Bags</label>
														<form:input path="modified[${i}].bags" class="form-control input-sm number totalBags" onblur="$(this).totalbags();"/>
													</div>
													<div class="col-sm-1">
														<label>New wt</label>
														<form:input path="modified[${i}].kgs" class="form-control input-sm totalKgs decimal validateField text-right" onblur="$(this).totalKgs();" onchange="$(this).calcTotal()"/>
													</div>
													<div class="col-sm-1">
														<label>Price/Kg</label>
														<form:input path="modified[${i}].pricePerKg" class="form-control input-sm decimal validateField text-right pricePerKg" onchange="$(this).calcTotal()"/>
													</div>
													<div class="col-sm-2">
														<label>Total</label>
														<form:input path="modified[${i}].totalPrice" class="form-control input-sm totalPrice decimal validateField text-right readonly" onblur="$(this).totalPrice();" readonly="true"/>
													</div>
												
												</div>	
												<div class="row">
													<div class="col-sm-2">
														<label>Commissions</label>
														<form:input path="modified[${i}].commission" class="form-control input-sm totalCommission decimal validateField text-right" onblur="$(this).totalComm();"/>
													</div>
													<div class="col-sm-2">
														<label>Grand Total</label>
														<form:input path="modified[${i}].totalComm" class="form-control input-sm totals decimal validateField text-right readonly" onblur="$(this).totals();" readonly="true"/>
													</div>
													<div class="col-sm-2">
														<label>Type</label>
														<form:select path="modified[${i}].vendorType" class="form-control">
															<option value="">Select</option>
															<c:forEach items="${purchaseMO.getTypeList()}" var="k">
																<form:option value="${k.comboField}">${k.text}</form:option>
															</c:forEach>
														</form:select>
													</div>
													<div class="col-sm-2">
														<label>Sortex/Non Sortex</label>
														<form:select path="modified[${i}].sortexornon" class="form-control">
															<option value="">Select</option>
															<c:forEach items="${purchaseMO.getSortexList()}" var="k">
																<form:option value="${k.comboField}">${k.text}</form:option>
															</c:forEach>
														</form:select>
													</div>
													<div class="col-sm-1">
														<c:if test="${approver==true}">
	                                                        <div class="checkbox d-inline float-right">
	                                                        	<label>Approve</label>
	                                                       		<input type="hidden" value="${purchaseMO.modified[i].approve}" class="checkVal doNothingInp">
	                                                            <input name="modified[${i}].approve" type="checkbox" class="checkbox dynamicInputId" onclick="$(this).checkVal();" id="chkBx${i}" value="N"/>
	                                                        	<label for="chkBx${i}" class="cr"></label>
	                                                        </div>
	                                                     </c:if>
													</div>
													 <c:if test="${edit == true}"> 
																				<div class="col-sm-1">
																					<input type="button" class="btn btn-primary btn-sm doNothingInp addInfoBtn" data-toggle="modal" data-target="#exampleModalCenter" value="Additional Info" onclick="$(this).getDcrDetailsId()">
																				</div>
																			</c:if> 
													<div class="col-sm-1">
														<a href="javascript:;" id="" class="btn dynamicChildDelete float-right"><i class="feather icon-minus-circle"></i></a>
													</div>
												</div><br>
												</div>
												</c:forEach>
												</c:if>
					                                  </div>
					                                  </div>
					                                  </div>
											<!-- <div class="card">
												<div class="card-body">
												

											</div>
											</div> -->
											<div class="row">
												<div class="col-sm-2">
													<label>Total Bags</label>
													<form:input path="purchaseDO.totalBags" class="form-control input-sm bagTotal" readonly="true"/>
												</div>
												<div class="col-sm-2">
												<label>Total KGS </label>
													<form:input path="purchaseDO.totalKgs" class="form-control input-sm kgTotal decimal validateField text-right" readonly="true"/>
												</div>
												<div class="col-sm-2">
													<label>Total Price</label>
													<form:input path="purchaseDO.totalPrice" class="form-control input-sm priceTotal decimal validateField text-right" readonly="true"/>
												</div>
												<div class="col-sm-2">
													<label>Total Commission</label>
													<form:input path="purchaseDO.totalComm" class="form-control input-sm commTotal decimal validateField text-right" readonly="true"/>
												</div>
												<div class="col-sm-2">
													<label>Total</label>
													<form:input path="purchaseDO.total" class="form-control input-sm fiTotal decimal validateField text-right" readonly="true"/>
												</div>
											</div><br>
											<div class="row" style="float: right;">
												<a href="./PurchaseSearch.html?page=GroundNut" class="btn btn-danger btn-sm" role="button">Cancel</a>
												<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('groundNutFormId','btnId');" id="btnId">
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
						
						
						<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLongTitle">Additional Info</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				      </div>
				      <div class="modal-footer">
				      	<div class="input-group">
							<input type="hidden" id="detailsId">
				      		<input type="text" class="form-control input-sm" placeholder="Type Here..." id="addInfoMsg">
					      	<div class="input-group-append">
					      		<button class="btn btn-sm btn-primary w-75 addInfosave" onclick="$(this).saveSaleAddInfo();"><i class="fab fa-telegram fa-lg"></i></button>
					      	</div>
				      	</div>
				      </div>
				    </div>
				  </div>
				</div>
						
						
							<!-- Modal for activity Log-->

					<div class="modal fade activitylog"  id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content scrollactive">
								<div class="modal-header ">
									<h5 class="modal-title" id="exampleModalLabel">Activity Logs</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body acctivityLog">

									

								</div>
								<!-- <div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Save
										changes</button>
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
</body>
</html>