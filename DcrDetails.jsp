<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="./resources/Css/mdb.min.css" />
<link type="text/css" rel="stylesheet" href="./resources/Css/purchase.css" /> 
<style type="text/css">

.colortext{
 color: blue;
 }

.dtp-actual-year{
	  display: none;
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

.custform-control-placeholder {
  position: absolute;
  padding: 7px 0 0 0px;
  transition: all 200ms;
  opacity: 0.5;
}

/* .form-control:focus + .custform-control-placeholder {
  transform: translate3d(0, -105%, 0);
  opacity: 1;
}  */
/* select..form-control + .custform-control-placeholder {
  transform: translate3d(0, -105%, 0);
  opacity: 1;
}  */

.custform-control-placeholder {
  transform: translate3d(0, -108%, 0);
  opacity: 1;
} 

.form-control{
	background-color: #fff !important;
	border-bottom-colour:#04a9f5 !important;
}

.form-control:focus {
	color: #495057;
	background-color: #fff !important;
	border-color: #80bdff ;
	border-bottom-colour:#04a9f5 !important;
	outline: 0;
	/* box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25); */
}

.col, .col-1, .col-10, .col-11, .col-12, .col-2, .col-3, .col-4, .col-5, .col-6, .col-7, .col-8, .col-9, .col-auto, .col-lg, .col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-auto, .col-md, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-auto, .col-sm, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-auto, .col-xl, .col-xl-1, .col-xl-10, .col-xl-11, .col-xl-12, .col-xl-2, .col-xl-3, .col-xl-4, .col-xl-5, .col-xl-6, .col-xl-7, .col-xl-8, .col-xl-9, .col-xl-auto {
    position: relative;
    width: 100%;
    float: left;
    min-height: 1px;
    padding-right: 8px;
    padding-left: 8px;
}

 .flexcroll {
    width: 100%;
    margin-bottom: 15px;
    height: auto;
    max-height: 110px;
   /*  overflow-y: scroll; */
} 
.cstm{
   border: 0; 
   border-bottom: 1px solid #04a9f5 !important;
}

.cstm .cstm:disabled, .cstm .cstm[readonly] {
	border-bottom: 1px solid #bdbdbd !important;
	background-color: transparent !important;
}
	
.Left0{
	padding-left: 0;
}

.Right0 {
    padding-Right: 0;
}

textarea:focus, 
select:focus,
textarea.form-control:focus, 
input.form-control:focus, 
input[type=text]:focus, 
input[type=password]:focus, 
input[type=email]:focus, 
input[type=number]:focus, 
[type=text].form-control:focus, 
[type=password].form-control:focus, 
[type=email].form-control:focus, 
[type=tel].form-control:focus, 
[contenteditable].form-control:focus {
  box-shadow: inset 0 -1px 0 #ddd;
}

.form-select:focus{
	box-shadow: inset 0 -1px 0 #ddd;
}
</style>
<script type="text/javascript" src="resources/Javascript/Dcr.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var form_URL = $("#formURLHidden").val();
	$.fn.validfunction = function(formId, btnID)
	{
		$("#mainBlkId").find('input','checkbox','button').each(function(){
			$(this).prop('disabled',false);
		});

		$("#mainBlkId").find('select').each(function(){
			$(this).prop('disabled',false);
		});
		
		if($("#formURLHidden").val().includes('edit')) {
			if($('.dynamicAdd').length == 1){
				if(!$(this).checkNotNull($('.dynamicAdd').find('select.validateClass').val()))				
				 $('.dynamicAdd').remove();
			}
		}
		$(this).validFields(formId,form_URL  , btnID);
	};
	
	
});
/* $.fn.yearchange = function() {
	  var dateToday = new Date();
	  var selectedYear = parseInt($('#year').val());
	  var currentMonth = dateToday.getMonth() + 1;
	  var monthNumber, monthName;

	  if (selectedYear == dateToday.getFullYear()) {
	    monthNumber = currentMonth;
	  } else {
	    monthNumber = 12;
	  }

	  $('#month option').each(function() {
	    var optionMonth = parseInt($(this).attr('data-order'));
	    if (optionMonth > monthNumber) {
	      $(this).hide();
	    } else {
	      $(this).show();
	      monthName = new Date(selectedYear, optionMonth - 1, 1).toLocaleString('default', { month: 'long' });
	      $(this).text(monthName);
	    }
	  });
	}; */
	
/* 	$.fn.yearchange = function() {
		  var dateToday = new Date();
		  var selectedYear = parseInt($('#year').val());
		  var currentMonth = dateToday.getMonth() + 1;
		  var monthNumber, monthName;

		  if (selectedYear == dateToday.getFullYear()) {
		    monthNumber = currentMonth;
		  } else {
		    monthNumber = 12;
		  }

		  $('#month option').each(function() {
		    var optionMonth = parseInt($(this).attr('data-order'));
		    if (optionMonth > monthNumber) {
		      $(this).hide();
		    } else {
		      $(this).show();
		      monthName = new Date(selectedYear, optionMonth - 1, 1).toLocaleString('default', { month: 'long' });
		      $(this).text(monthName);
		    }
		  });

		  // Automatically select the current month
		  $('#month').val(monthNumber);
		}; */ 
		
		$.fn.yearchange = function(){
			window.setTimeout( function(){
			var yearValue = $('#year').val();
			var currentYear = new Date().getFullYear();
			var monthDropdown = $('#month');
			var monthOptions = monthDropdown.find('option');
			var optionValue = $('option').val();
			var currentDate = new Date();
			var currentMonthIndex = currentDate.getMonth();
			var monthNames = [
			  'January', 'February', 'March', 'April', 'May', 'June',
			  'July', 'August', 'September', 'October', 'November', 'December'
			];
			var currentMonth = monthNames[currentMonthIndex];
			
			monthOptions.each(function() {
			  var value = $(this).val();
			  var text = $(this).text();
			  console.log('Value: ' + value + ', Text: ' + text);
			});
			
			if (yearValue < currentYear) {
				 
				  monthOptions.show();
				} else if (yearValue > currentYear) {
				  var currentMonthIndex = currentDate.getMonth(); 
				  monthOptions.each(function(index) {
				    if (index > currentMonthIndex) {
				      $(this).hide();
				    } else {
				      $(this).show();
				    }
				  });
				} else {
				
				}
		    	
			var currentMonthIndex = currentDate.getMonth();
			var monthNames = [
			  'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
			  'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
			];
			if (yearValue == 2023) {
			  var currentMonth = monthNames[currentMonthIndex];
			  var monthDropdown = $('#month').val();
			  var monthNames = [
			    'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN',
			    'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'
			  ];

			  var selectedMonthIndex = monthNames.indexOf(monthDropdown);
			  if (selectedMonthIndex !== -1) {
			    console.log("Index of selected month: " + selectedMonthIndex);
			  } else {
			    console.log("Selected month not found in monthNames array.");
			  }

			  var months = $('#month').val();
			  if(months!=currentMonth && selectedMonthIndex > currentMonthIndex){
				  $("#month").val(currentMonth);
			  }
			  
			 
			  monthOptions.each(function(index) {
				  
				
				    if (index > currentMonthIndex) {
				      $(this).hide();
				    } else {
				      $(this).show();
				    }
				  });
			  
			}

			 }, 1000 );
		}

/* $(document).ready(function() {
	  $(".transCHKBX").click(function() {
	    if ($("#myCheckbox").prop("checked")) {
	      alert("Checkbox is checked.");
	    } else {
	      alert("Checkbox is not checked.");
	    }
	  });
	}); */

</script>
</head>
<body>
<div class="pcoded-main-container" style="background-color: white;">
	<div class="pcoded-wrapper">
		<div class="pcoded-content">
			<div class="pcoded-inner-content">
				<div class="main-body" >
					<div class="page-wrapper">
						<div class="row">
							<div class="col-sm-12">
								<!-- <img src="./resources/images/Three dots.gif" id="loading" style="display: none;"> -->	
								<!-- <div class="card" id="mainCard">
									<div class="card-header" ><h5>Daily Cash Reconciliation</h5></div>
									<div class="card-block"> -->
										<h5>Daily Cash Reconciliation &nbsp;&nbsp;  ${dcrMO.dcrdo.dcrId}
                                         <c:if test="${edit == true}">
                                         <button type="button" class="btn btn-primary btn-sm float-right" onclick="$(this).getActivityLogsDetails();">Activity Logs</button>
                                         <button type="button" style="display: none;" class="btn btn-primary btn-sm float-right activityhiddenbtn" data-toggle="modal" data-target="#exampleModal" >Activity Logs</button>
                                      	 </c:if>
                                        </h5> <br>
										<input type="hidden" value="${url}" id="formURLHidden" />
										<form:form modelAttribute="dcrMO" id="DCRFormId" method="POST" class="form-floating">
										<div class="mainBlock" id="mainBlkId">
												<div class="brachMain" id="branchMainId">
												<div class="row">
													<div class="col-md-12">
													<div class="md-form col-sm-2">
														<label class="custform-control-placeholder">Cash Book<span style="color:red">*</span></label>
														<form:hidden path="dcrdo.Id" id="dcrId"/>
														<form:hidden path="dcrdo.dcrId"/>
														<form:hidden path="dcrdo.extfld01"/>
														<form:hidden path="dcrdo.branchDO.id" id="branchAutoId"/>
														<form:hidden path="dcrdo.companyDO.id" value="${compId}"/>
														<input type="hidden" id="approver" value="${approver}"/>
														<input type="hidden" id="contra" value="${contra}"/>
														<input type="hidden" id="ledger" value="${ledger}"/>
														<input type="hidden" id="cashpay" value="${cashpay}"/>
														<input type="hidden" id="cashrec" value="${cashrec}"/>
														
														<form:select path="dcrdo.branch" class="cstm form-control doNothingInp validateClass" id="branchAuId" onchange="$(this).branchChange();" disabled="${editBoolean}" style="height:33px;">
															<option value="">Select</option>
															<c:forEach items="${dcrMO.getBranchDOs()}" var="var01">
																<form:option data-Id="${var01.id}" value="${var01.branchId}">${var01.branchName}</form:option>
															</c:forEach>
														</form:select>
													</div>
													  <div class="md-form col-sm-1">
														<label class="custform-control-placeholder">Year<span style="color: red">*</span></label>
														<form:select path="dcrdo.year" class="cstm form-control form-select validateClass removeCss year"  style="height:33px;" id="year" onchange="$(this).branchChange();$(this).yearchange();">
															<form:option value="">Select</form:option>
															 <c:forEach items="${dcrMO.getYearsCombos()}" var="obj">
																<form:option data-order="${obj.comboOrder}" value="${obj.comboField}">${obj.text}</form:option>
															</c:forEach>
														</form:select>
													</div> 
													<div class="md-form col-sm-1 Month_DIV">
														<label class="custform-control-placeholder">Month<span style="color: red">*</span></label>
														<form:select path="dcrdo.month" class="cstm form-control form-select validateClass removeCss " id="month" onchange="$(this).branchChange();" style="height:33px;" disabled="${editBoolean}">
															<!-- <option value="">Select</option> -->
															<c:forEach items="${dcrMO.getMonthCombos()}" var="obj">
																<form:option data-order="${obj.comboOrder}" value="${obj.comboField}">${obj.text}</form:option>
															</c:forEach>
														</form:select>
													</div>
													
													
													<div class="md-form col-sm-2">
													    <input type="hidden" id="open" value="${openingBal}" >
														<label class="custform-control-placeholder">Opening Balance</label>
														<form:input path="dcrdo.openingBal" class="cstm form-control decimal validateField text-right" id="openingblc" readonly="true"/>
													</div>
													<div class="md-form col-sm-2">
														<label class="custform-control-placeholder">Total Receipts</label>
														<form:input path="dcrdo.totalReceipts" class="cstm form-control decimal validateField text-right" id="totalReceipt" readonly="true"/>
													</div>
													<div class="md-form col-sm-2">
														<label class="custform-control-placeholder">Total Payments</label>
														<form:input path="dcrdo.totalPaymnts" class="cstm form-control decimal validateField text-right" id="totalPayment" readonly="true"/>
													</div>
													<div class="md-form col-sm-2">
														<label class="custform-control-placeholder">Closing Balance</label>
														<form:input path="dcrdo.closingBal" class="cstm form-control decimal validateField text-right" id="closingblnc" readonly="true"/>
													</div>
												</div><br>
												<div class="col-md-12">
													 <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					                                        <li class="nav-item">
					                                            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true" onblur="$(this).pendingModifiedChanges();">
					                                            Pending for Approval<c:if test="${dcrMO.pending.size() > 0}">&nbsp;<span class="badge-lg badge-light badge-pill">${dcrMO.pending.size()}</span></c:if>
					                                            </a>
					                                        </li>
					                                        <li class="nav-item">
					                                            <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false" onblur="$(this).pendingModifiedChanges();">
					                                            Modified<c:if test="${dcrMO.modified.size() > 0}">&nbsp;<span class="badge-lg badge-light badge-pill">${dcrMO.modified.size()}</span></c:if>
					                                            </a>
					                                        </li>
					                                        <li class="nav-item">
					                                            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false" onblur="$(this).pendingModifiedChanges();">
					                                            Approved<c:if test="${dcrMO.approved.size() > 0}">&nbsp;<span class="badge-lg badge-light badge-pill">${dcrMO.approved.size()}</span></c:if>
					                                            </a>
					                                        </li>
					                                    </ul>
														<div class="tab-content" id="pills-tabcontent">
															<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
						                                        <!-- <a href="javascript:void();" class="btn btn-sm btn-primary accAdd float-right" id="accAdd" onclick="$(this).addAccount(this.id);">
																	Add
																</a> --><br><br>
																<div class="row">
																	<div class="col-12 Left0">
																	<c:forEach begin="0" end="${dcrMO.pending.size() == 0 ? 0 : dcrMO.pending.size()-1}" var="j">	
																		<section class="subBlock dynamicAdd" id="subBlkId${j}">
																			<div class="col-12">
																				<div class="col-10 Left0 Right0">
																					<div class="col-2 Left0 Right0">
																						<div class="md-form col-4 Left0 ">
																							<form:hidden path="pending[${j}].status" class="detailsSts"/>
																							<form:hidden path="pending[${j}].extfldone" class="addInfoSts"/>
																							<form:hidden path="pending[${j}].Id" class="detailsAutoId"/>
																							<form:hidden path="pending[${j}].transId"/>
																							<%-- <span class="sr srspan">${count}</span> --%>
																							<form:input value="${count}" path="pending[${j}].autoIncr" class="cstm dynamicInputId form-control srNo srinp" id="srNoP${j}" style="border:0 !important;" readonly="true" />
																							<c:if test="${j==0}"><label class="custform-control-placeholder" for="srNoP${j}" style="margin-left: -20px;">Sr No.</label></c:if>
																						</div>
																						<div class="md-form col-8 Left0 Right0">
																							<form:input path="pending[${j}].date" id="dateP${j}" class="cstm dynamicInputId form-control input-sm dynamicAddDate validateClass detailsCommonCls pendinddate" autocomplete="off" disabled="${editBoolean}"/>
																							<c:if test="${j==0}"><label class="custform-control-placeholder" for="dateP${j}">Date<span style="color: red">*</span></label></c:if>
																						</div>
																					</div>
																					<div class="md-form col-1">
																						<form:input path="pending[${j}].chequeNo" id="chqNo${j}" class="cstm dynamicInputId form-control input-sm chqNo detailsCommonCls" disabled="${editBoolean}"/>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="chqNoP${j}">Chq No</label></c:if>
																					</div>
																					<div class="col-2 ledger_DIV">
																						<div class="md-form col-10 Left0 ">
																						<form:select path="pending[${j}].ledgerDO.id" class="ledgerData cstm dynamicInputId form-control removeCss validateClass detailsCommonCls" id="accHeadP${j}" onchange="$(this).ledgerChange()" disabled="${editBoolean}" style="height: 33px;">
																							<option value="">Select</option>
																							<c:forEach items="${dcrMO.getLedgeDOs()}" var="i">
																								<form:option value="${i.id}">${i.ledgerName}</form:option>
																							</c:forEach>
																						</form:select>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="accHeadP${j}">Account Head<span style="color: red">*</span></label></c:if>
																						<form:input type="hidden" path="pending[${j}].ledgerDO.ledgerName" class="form-control "/>
																						<form:textarea path="pending[${j}].accHeadDesc" id="accHeadDescP${j}" class="cstm dynamicInputId form-control input-sm detailsCommonCls" rows="1" readonly="${editBoolean}" style="display: none;"/>
																						</div>
																						<div class="md-form col-2 Left0">
																							<button type="button" class="accHeadBtn" data-toggle="modal" data-target="#accHeadDesc" style="display: none;" onclick="$(this).openAccHead()">
																							<i class="fas fa-database fa-lg"></i>
																							</button>
																						</div>
																					</div>
																					<div class="md-form col-2">
																						<form:input path="pending[${j}].receipts" id="receiptsP${j}" class="cstm form-control receipt receiptss dynamicInputId input-sm text-right decimal changes  validateField totalRec validateClass detailsCommonCls" onchange="$(this).totalReceipts();" onblur="$(this).checkk()" readonly="${editBoolean}"/>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="receiptsP${j}">Receipts</label></c:if>
																					</div>
																					<div class="md-form col-2">
																						<form:input path="pending[${j}].paymentExp" id="payments${j}" class="cstm form-control paymentss receiptss dynamicInputId input-sm text-right decimal changes   validateField totalPay validateClass detailsCommonCls" onchange="$(this).totalPayments();" onblur="$(this).checkk()" readonly="${editBoolean}"/>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="payments${j}">Payments</label></c:if>
																					</div>
																					<div class="md-form col-3">
																					<form:textarea path="pending[${j}].narration" id="narrationP${j}" class="cstm dynamicInputId form-control input-sm detailsCommonCls" rows="1" readonly="${editBoolean}"/>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="narrationP${j}">Narration</label></c:if>
																					</div>
																				</div>
																				<div class="col-2 Left0 Right0">
																					<div class="md-form col-3">
																					<c:if test="${approver==true}">
																						<input type="hidden" value="${dcrMO.pending[j].approve}" class="checkVal doNothingInp">
							                                                            <input name="pending[${j}].approve" type="checkbox" class="checkbox dynamicInputId approveCHKBX" onclick="$(this).checkVal();" id="chkBxP${j}" value="N" style="height: 40px;margin-left: 20px;"/>
							                                                            <c:if test="${j==0}"><label for="chkBxP${j}" class="cr custform-control-placeholder">Approve</label></c:if>
																					</c:if>
							                                                        </div>
																					<div class="md-form col-3 AddInfo_DIV">
																					 <c:if test="${edit == true}">
																						<input type="button" class="btn btn-primary btn-sm doNothingInp addInfoBtn" data-toggle="modal" data-target="#exampleModalCenter" value="Additional Info" onclick="$(this).getDcrDetailsId()">
																					</c:if>
																					</div>
								                                                    <div class="md-form col-2 float-right">
								                                                    	<a href="javascript:void();" id="" class="dynamicChildDelete"><i class="fas fa-trash-alt fa-lg"></i></a>
								                                                    </div>
																				</div>
																			</div>
																		</section>
																		
																		  
																		
																		</c:forEach>
																		<a href="javascript:void();" class="btn btn-sm btn-primary accAdd float-right" id="accAdd" onclick="$(this).addAccount(this.id);">
																	Add
																</a> 
																	</div>
																</div>
					                                        </div>
					                                        <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
					                                        	<div class="row">
																<div class="col-12 Left0 ">
					                                        	<c:if test="${dcrMO.modified.size() > 0}">
					                                        	<c:forEach begin="0" end="${dcrMO.modified.size()  == 0 ? 0 : dcrMO.modified.size()-1}" var="j">
					                                        		<section class="subBlock modified" id="subBlkIdM${j}">
					                                        			<div class="col-12">
																				<div class="col-10 Left0 Right0">
																					<div class="col-2 Left0 Right0">
																						<div class="md-form col-4  Left0 ">
																							<form:hidden path="modified[${j}].status" class="detailsSts"/>
																							<form:hidden path="modified[${j}].extfldone" class="addInfoSts"/>
																							<form:hidden path="modified[${j}].Id" class="detailsAutoId"/>
																							<form:hidden path="modified[${j}].transId"/>
																							<form:input value="" path="modified[${j}].autoIncr" class="cstm form-control srNo" id="srNoM${j}" style="border:0 !important;" readonly="true" />
																							<c:if test="${j==0}"><label class="custform-control-placeholder" for="srNoM${j}" style="margin-left: -20px;">SrNo</label></c:if>
																						</div>
																						<div class="md-form col-8 Left0 Right0">
																							<form:input path="modified[${j}].date" id="dateM${j}" class="cstm form-control input-sm dynamicAddDate detailsCommonCls ModifiedDate" autocomplete="off" disabled="${editBoolean}"/>
																							<c:if test="${j==0}"><label class="custform-control-placeholder" for="dateM${j}">Date</label></c:if>
																						</div>
																					</div>
																					<div class="md-form col-1">
																						<form:input path="modified[${j}].chequeNo" id="chqNoM${j}" class="cstm form-control input-sm chqNo detailsCommonCls" readonly="${editBoolean}"/>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="chqNoM${j}">Chq No</label></c:if>
																					</div>
																					<div class="md-form col-2 ledger_DIV">
																						<div class="md-form col-10 Left0 ">
																							<form:select path="modified[${j}].ledgerDO.id" class="ledgerData cstm dynamicInputId form-control removeCss validateClass detailsCommonCls" id="accHeadM${j}" onchange="$(this).ledgerChange()" disabled="${editBoolean}" style="height: 33px;">
																								<option value="">Select</option>
																								<c:forEach items="${dcrMO.getLedgeDOs()}" var="i">
																									<form:option value="${i.id}">${i.ledgerName}</form:option>
																								</c:forEach>
																							</form:select>
																							<c:if test="${j==0}"><label class="custform-control-placeholder" for="accHeadM${j}">Account Head<span style="color: red">*</span></label></c:if>
																							<form:input type="hidden" path="modified[${j}].ledgerDO.ledgerName" class="form-control "/>
																							<form:textarea path="modified[${j}].accHeadDesc" id="accHeadDescM${j}" class="cstm dynamicInputId form-control input-sm detailsCommonCls" rows="1" readonly="${editBoolean}" style="display: none;"/>
																						</div>
																						<div class="md-form col-2 Left0">
																							<button type="button" class="accHeadBtn" data-toggle="modal" data-target="#accHeadDesc" style="display: none;" onclick="$(this).openAccHead()">
																							<i class="fas fa-database fa-lg"></i>
																							</button>
																						</div>
																					</div>
																					<div class="md-form col-2">
																						<form:input path="modified[${j}].receipts" id="receiptsM${j}" class="cstm form-control input-sm text-right decimal validateField totalRec detailsCommonCls" onchange="$(this).totalReceipts();" readonly="${editBoolean}"/>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="receiptsM${j}">Receipts</label></c:if>
																					</div>
																					<div class="md-form col-2">
																						<form:input path="modified[${j}].paymentExp" id="paymentsM${j}" class="cstm form-control input-sm text-right decimal validateField totalPay detailsCommonCls" onchange="$(this).totalPayments();" readonly="${editBoolean}"/>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="paymentsM${j}">Payments</label></c:if>
																					</div>
																					<div class="md-form Left0  col-3">
																						<form:textarea path="modified[${j}].narration" id="narrationM${j}" class="cstm form-control input-sm detailsCommonCls" rows="1" readonly="${editBoolean}"/>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="narrationM${j}">Narration</label></c:if>
																					</div>
																				</div>
																				<div class="col-2 Left0 Right0">
																					<div class="md-form col-3">
																					<c:choose>
																						<c:when test="${approver==true}">
							                                                       		<input type="hidden" value="${dcrMO.modified[j].approve}" class="checkVal doNothingInp">
							                                                            <input name="modified[${j}].approve" type="checkbox" class="checkbox approveCHKBX" onclick="$(this).checkVal();" id="chkBxM${j}" value="N" style="height: 40px;margin-left: 20px;"/>
							                                                            <c:if test="${j==0}"><label for="chkBxM${j}" class="cr custform-control-placeholder">Approve</label></c:if>
							                                                       		</c:when>
							                                                       		<c:otherwise>
							                                                       			<form:input path="modified[${j}].approve" type="hidden"/>
							                                                       		</c:otherwise>
																					</c:choose>
																					
							                                                        </div>
																					<div class="md-form col-3">
																					 <c:if test="${edit == true}">
																						<input type="button" class="btn btn-primary btn-sm doNothingInp addInfoBtn" data-toggle="modal" data-target="#exampleModalCenter" value="Additional Info" onclick="$(this).getDcrDetailsId()">
																					</c:if>
																					</div>
																					<div class="md-form col-2 transUpdate_DIV float-right" style="display: none">
																					<c:choose>
																						<c:when test="${approver==true && edit == true}">
																							<input type="hidden" value="${dcrMO.modified[j].extfldtwo}" class="checkVal doNothingInp">
								                                                            <input name="modified[${j}].extfldtwo" type="checkbox" class="checkbox transCHKBX" onclick="$(this).checkVal();" id="transChBXM${j}" value="N" style="height: 40px;margin-left: 20px;"/>
								                                                            <c:if test="${j==0}"><label for="transChBXM${j}" class="cr custform-control-placeholder">Update<span style="color: red">*</span></label></c:if>
																						</c:when>
																						<c:otherwise>
																							<form:input path="modified[${j}].extfldtwo" type="hidden"/>
																						</c:otherwise>
																					</c:choose>
																					<%-- <c:if test="${approver==true && edit == true}">
							                                                       		<input type="hidden" value="${dcrMO.modified[j].extfldtwo}" class="checkVal doNothingInp">
							                                                            <input name="modified[${j}].extfldtwo" type="checkbox" class="checkbox transCHKBX" onclick="$(this).checkVal();" id="transChBXM${j}" value="N" style="height: 40px;margin-left: 20px;"/>
							                                                            <c:if test="${j==0}"><label for="transChBXM${j}" class="cr custform-control-placeholder">Update</label></c:if>
							                                                       	
							                                                       	</c:if> --%>
							                                                        </div>
																				</div>
																			</div>
					                                        		</section>
					                                        	</c:forEach>
					                                        	</c:if>
					                                        	</div>
					                                        	</div>
					                                        </div>
															<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
															<div class="row">
																<div class="col-12 Left0">
																<c:if test="${dcrMO.approved.size() > 0}">
																<c:forEach begin="0" end="${dcrMO.approved.size() == 0 ? 0 : dcrMO.approved.size()-1}" var="j">
																		<section class="subBlock approved" id="subBlkIdA${j}">
																			<div class="col-12">
																				<div class="col-10 Left0 Right0">
																					<div class="col-2 Left0 Right0">
																						<div class="md-form col-4  Left0 ">
																							<form:hidden path="approved[${j}].status" class="detailsSts"/>
																							<form:hidden path="approved[${j}].extfldone" class="addInfoSts"/>
																							<form:hidden path="approved[${j}].Id" class="detailsAutoId"/>
																							<form:hidden path="approved[${j}].transId"/>
																							<form:hidden  path="approved[${j}].temp" class="temp"/>
																							<form:input value="" path="approved[${j}].autoIncr" class="cstm form-control srNo" id="srNoA${j}" style="border:0 !important;" readonly="true" />
																							<c:if test="${j==0}"><label class="custform-control-placeholder" for="srNoA${j}" style="margin-left: -20px;">SrNo</label></c:if>
																						</div>
																						<div class="md-form col-7 Left0 Right0">
																							<form:input path="approved[${j}].date" id="dateA${j}" class="cstm form-control input-sm dynamicAddDate detailsCommonCls approvedDate" autocomplete="off" disabled="${editBoolean}"/>
																							<c:if test="${j==0}"><label class="custform-control-placeholder" for="dateA${j}">Date</label></c:if>
																						</div>
																					</div>
																					<div class="md-form col-1">
																						<form:input path="approved[${j}].chequeNo" id="chqNoA${j}" class="cstm form-control input-sm chqNo detailsCommonCls" readonly="${editBoolean}"/>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="chqNoA${j}">Chq No</label></c:if>
																					</div>
																					<div class="md-form col-2 ledger_DIV">
																						<div class="md-form col-10 Left0 ">
																							<form:select path="approved[${j}].ledgerDO.id" class="ledgerData cstm dynamicInputId form-control removeCss validateClass detailsCommonCls" id="accHeadA${j}" onchange="$(this).ledgerChange()" disabled="${editBoolean}" style="height: 33px;">
																								<option value="">Select</option>
																								<c:forEach items="${dcrMO.getLedgeDOs()}" var="i">
																									<form:option value="${i.id}">${i.ledgerName}</form:option>
																								</c:forEach>
																							</form:select>
																							<c:if test="${j==0}"><label class="custform-control-placeholder" for="accHeadA${j}">Account Head<span style="color: red">*</span></label></c:if>
																							<form:input type="hidden" path="approved[${j}].ledgerDO.ledgerName" class="form-control "/>
																							<form:textarea path="approved[${j}].accHeadDesc" id="accHeadDescA${j}" class="cstm dynamicInputId form-control input-sm detailsCommonCls" rows="1" readonly="${editBoolean}" style="display: none;"/>
																						</div>
																						<div class="md-form col-2 Left0">
																							<button type="button" class="accHeadBtn" data-toggle="modal" data-target="#accHeadDesc" style="display: none;" onclick="$(this).openAccHead()">
																							<i class="fas fa-database fa-lg"></i>
																							</button>
																						</div>
																					</div>
																					<div class="md-form col-2">
																						<form:input path="approved[${j}].receipts" id="receiptsA${j}" class="cstm form-control input-sm text-right decimal validateField totalRec detailsCommonCls" onchange="$(this).totalReceipts();" readonly="${editBoolean}"/>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="receiptsA${j}">Receipts</label></c:if>
																					</div>
																					<div class="md-form col-2">
																						<form:input path="approved[${j}].paymentExp" id="paymentsA${j}" class="cstm form-control input-sm text-right decimal validateField totalPay detailsCommonCls" onchange="$(this).totalPayments();" readonly="${editBoolean}"/>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="paymentsA${j}">Payments</label></c:if>
																					</div>
																					<div class="md-form Left0  col-3">
																					 <form:hidden path="approved[${j}].checkApprove" id="checkvalue${j}"  class="detailsCommonCls checkValue"/>
																						<form:textarea path="approved[${j}].narration" id="narrationA${j}" class="cstm form-control input-sm detailsCommonCls checkNarration" rows="1" readonly="${editBoolean}"/>
																						<c:if test="${j==0}"><label class="custform-control-placeholder" for="narrationA${j}">Narration</label></c:if>
																					</div>
																				</div>
																				<div class="col-2 Left0 Right0">
																					<div class="md-form col-3">
																					<c:choose>
																						<c:when test="${approver==true}">
																							<input type="hidden" value="${dcrMO.approved[j].approve}" class="checkVal doNothingInp">
							                                                            	<input name="approved[${j}].approve" type="checkbox" class="checkbox approveCHKBX" onclick="$(this).checkVal();" id="chkBxA${j}" value="N" style="height: 40px;margin-left: 20px;"/>
							                                                            	<c:if test="${j==0}"><label for="chkBxA${j}" class="cr custform-control-placeholder">Approve</label></c:if>
																						</c:when>
																						<c:otherwise>
																							<form:input path="approved[${j}].approve" type="hidden"/>
																						</c:otherwise>
																					</c:choose>
																					<%-- <c:if test="${approver==true}">
							                                                       		<input type="hidden" value="${dcrMO.approved[j].approve}" class="checkVal doNothingInp">
							                                                            <input name="approved[${j}].approve" type="checkbox" class="checkbox approveCHKBX" onclick="$(this).checkVal();" id="chkBxA${j}" value="N" style="height: 40px;margin-left: 20px;"/>
							                                                            <c:if test="${j==0}"><label for="chkBxA${j}" class="cr custform-control-placeholder">Approve</label></c:if>
							                                                       
							                                                        </c:if> --%>
							                                                        </div>
																					<div class="md-form col-3">
																					 <c:if test="${edit == true}">
																						<input type="button" class="btn btn-primary btn-sm doNothingInp addInfoBtn" data-toggle="modal" data-target="#exampleModalCenter" value="Additional Info" onclick="$(this).getDcrDetailsId()">
																					</c:if>
																					</div>
																					<div class="md-form col-2 transUpdate_DIV float-right" style="display: none">
																					<c:choose>
																						<c:when test="${approver==true && edit == true}">
																							<input type="hidden" value="${dcrMO.approved[j].extfldtwo}" class="checkVal doNothingInp">
							                                                            	<input name="approved[${j}].extfldtwo" type="checkbox" class="checkbox transCHKBX" onclick="$(this).checkVal();" id="transChBXA${j}" value="N" style="height: 40px;margin-left: 20px;"/>
							                                                            	<c:if test="${j==0}"><label for="transChBXA${j}" class="cr custform-control-placeholder">Update<span style="color: red">*</span></label></c:if>
																						</c:when>
																						<c:otherwise>
																							<form:input path="approved[${j}].extfldtwo" type="hidden"/>
																						</c:otherwise>
																					</c:choose>
																					<%-- <c:if test="${approver==true && edit == true}">
							                                                       		<input type="hidden" value="${dcrMO.approved[j].extfldtwo}" class="checkVal doNothingInp">
							                                                            <input name="approved[${j}].extfldtwo" type="checkbox" class="checkbox transCHKBX" onclick="$(this).checkVal();" id="transChBXA${j}" value="N" style="height: 40px;margin-left: 20px;"/>
							                                                            <c:if test="${j==0}"><label for="transChBXA${j}" class="cr custform-control-placeholder">Update</label></c:if>
							                                                       	</c:if> --%>
							                                                        </div>
																				</div>
																			</div>
																		</section>
																		</c:forEach>
																		</c:if>
																	</div>
																</div>
															</div>
														</div>														
					                                   </div>
														<div class="col-md-12" style="margin-top: 1%;">
															<div class="col-4"></div>
															<div class="md-form col-2 ">
																<form:input path="dcrdo.totalTransRec" id="transR" class="cstm form-control input-sm text-right decimal validateField TotalTransRec" readonly="true"/>
																<label class="custform-control-placeholder" for="transR">Total Receipts</label>
															</div>
															<div class="md-form col-2 ">
																<form:input path="dcrdo.totalTransPay" id="transP" class="cstm form-control input-sm text-right decimal validateField TotalTransPay" readonly="true"/>
																<label class="custform-control-placeholder" for="transP">Total Payments</label>
															</div>
														</div>
												</div><br>
											</div>
											<br>
											<div class="row" style="float: right;">
												<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('DCRFormId','btnId');" id="btnId">
													<span class="spinner-grow spinner-grow-sm" id="loadindGif" style="display: none;"></span>
													<b id="btnTextId">Submit</b>
												</button>
												<a href="./DCRSearch.html" class="btn btn-danger btn-sm" role="button">Cancel</a>
											</div><br>
										</div>
									</form:form>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal -->
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
					      		<button class="btn btn-sm btn-primary w-75 addInfosave" onclick="$(this).saveAddInfo();"><i class="fab fa-telegram fa-lg"></i></button>
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
                        </div>
                    </div>
                </div>
                
                <!-- Modal for Account Head Description -->
                <div class="modal fade bd-example-modal-sm"  id="accHeadDesc" tabindex="-1" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header ">
                                <h5 class="modal-title" id="exampleModalLabel">Description</h5>
                            </div>
                            <div class="modal-body">
                            	<textarea class="form-control" id="accHdDes"></textarea>
                            	<small id="descSmall" style="display: none;color: red; float: right;">Description Required</small>
                            </div>
                            <div class="modal=footer">
                            	<!-- <button class="btn btn-sm btn-primary float-right" onclick="$(this).accHeadDesc()" >Ok</button>
                            	<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="accHeadClose"></button> -->
                           		<button class="close" data-dismiss="modal" aria-label="Close" id="accHeadClose"></button>
                            	<button class="btn btn-sm btn-primary float-right" onclick="$(this).accHeadDesc()" >Ok</button>
                            	<button class="btn btn-sm btn-danger float-right" onclick="$(this).accDescClose();">Close</button>
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