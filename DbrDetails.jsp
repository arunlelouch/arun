<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link type="text/css" rel="stylesheet" href="./resources/Css/mdb.min.css" />
<link type="text/css" rel="stylesheet" href="./resources/Css/purchase.css" /> 
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

.custform-control-placeholder {
  position: absolute;
  padding: 7px 0 0 0px;
  transition: all 200ms;
  opacity: 0.5;
}

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
<script type="text/javascript" src="./resources/Javascript/Dbr.js"></script>
<script type="text/javascript">
$(document).ready(function(){
//	$('.dtp-actual-year').hide();
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
		
		 $.fn.yearchange();
	};
	 var dateToday = new Date();
	  var currentMonth = dateToday.getMonth() + 1;
	  if ($('#year').val() == '2023') {
		    $('#month option').each(function() {
		      var optionMonth = parseInt($(this).attr('data-order'));
		      if (optionMonth > currentMonth) {
		        $(this).hide();
		      } else {
		        $(this).show();
		      }
		    });
		  }
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
								<h5>Daily Bank Reconciliation &nbsp;&nbsp;  ${dbrMO.dbrdo.dbrId}
								<c:if test="${edit == true}">
									<button type="button" class="btn btn-primary btn-sm float-right" onclick="$(this).getDBRActivityLogsDetails();">Activity Logs</button>
									 <button type="button" style="display: none;" class="btn btn-primary float-right activityhiddenbtn" data-toggle="modal" data-target="#exampleModal" >Activity Logs</button>
								 </c:if>
								 </h5><br>
								<input type="hidden" value="${url}" id="formURLHidden" />
								<form:form modelAttribute="dbrMO" id="DBRFormId" method="POST">
								<div class="mainBlock" id="mainBlkId">
									<div class="brachMain" id="branchMainId"> 
									<div class="row">
										<div class="col-md-12">
											<div class="md-form col-3">
												<label class="custform-control-placeholder">Bank Book<span style="color:red">*</span></label>
												<form:hidden path="dbrdo.Id" id="dbrId"/>
												<form:hidden path="dbrdo.dbrId" />
												<form:hidden path="dbrdo.extfld01"/>
												<form:hidden path="dbrdo.branchDO.id" id="branchAutoId"/>
												<form:hidden path="dbrdo.companyDO.id" value="${compId}"/>
												<input type="hidden" id="approver" value="${approver}"/>
												<input type="hidden" id="contra" value="${contra}"/>
												<input type="hidden" id="bankpay" value="${bankpay}"/>
												<input type="hidden" id="bankrec" value="${bankrec}"/>
												<form:select path="dbrdo.companyBranch" class="cstm form-control doNothingInp validateClass removeCss" id="compBranch" onchange="$(this).branchChange();">
													
													<c:forEach items="${dbrMO.getBranchDOs()}" var="var01">
														<form:option value="${var01.branchId}" data-AId="${var01.id}">${var01.branchName}</form:option>
													</c:forEach>
												</form:select>
											</div>
											<div class="md-form col-sm-1">
														<label class="custform-control-placeholder">Year<span style="color: red">*</span></label>
														<form:select path="dbrdo.year" class="cstm form-control form-select validateClass removeCss year"  style="height:33px;" id="year" onchange="$(this).branchChange();$(this).yearchange();" >
															 <form:option value="">Select</form:option>
															 <c:forEach items="${dbrMO.getYearCombos()}" var="obj">
																<form:option data-order="${obj.comboOrder}" value="${obj.comboField}">${obj.text}</form:option>
															</c:forEach> 
														</form:select>
											</div> 
											<div class="md-form col-1 Month_DIV">
												<label class="custform-control-placeholder">Month<span style="color: red">*</span></label>
												<form:select path="dbrdo.month" class="cstm form-control form-select validateClass removeCss month" id="month" onchange="$(this).branchChange();"  style="height:33px;" disabled="${editBoolean}">
													<!-- <option value="">Select</option> -->
													<c:forEach items="${dbrMO.getMonthCombos()}" var="obj">
														<form:option data-order="${obj.comboOrder}" value="${obj.comboField}">${obj.text}</form:option>
													</c:forEach>
												</form:select>
											</div>
											
											
											<div class="md-form col-2">
												<label class="custform-control-placeholder">Bank</label>
												<form:input path="dbrdo.bank" class="cstm form-control input-sm doNothingInp" value="${bankName}" readonly="true" id="bankName"/>
											</div>
											<div class="md-form col-2">
												<label class="custform-control-placeholder">Branch</label>
												<form:input path="dbrdo.branch" class="cstm form-control input-sm" value="${branchName}" readonly="true" id="branchName"/>
											</div>
											<div class="md-form col-2">
												<label class="custform-control-placeholder">Account</label>
												<form:input path="dbrdo.account" class="cstm form-control input-sm" value="${AccNo}" readonly="true" id="accNo"/>
												<form:hidden path="dbrdo.extfld02" value="${lid}" id="lid"/>
											</div>
										</div>
										<div class="col-md-12">
											<div class="md-form col-3">
											 <input type="hidden" id="open" value="${openingBal}">
												<label class="custform-control-placeholder">Opening Balance</label>
												<form:input path="dbrdo.openingBal" class="cstm form-control input-sm decimal validateField text-right" id="openingblc" readonly="true"/>
											</div>
											<div class="md-form col-3">
												<label class="custform-control-placeholder">Total Receipts</label>
												<form:input path="dbrdo.totalReceipts" class="cstm form-control input-sm decimal validateField text-right" id="totalReceipt" readonly="true"/>
											</div>
											<div class="md-form col-3">
												<label class="custform-control-placeholder">Total Payments</label>
												<form:input path="dbrdo.totalPaymnts" class="cstm form-control input-sm decimal validateField text-right" id="totalPayment" readonly="true"/>
											</div>
											<div class="md-form col-3">
												<label class="custform-control-placeholder">Closing Balance</label>
												<form:input path="dbrdo.closingBal" class="cstm form-control input-sm decimal validateField text-right"  id="closingblnc" readonly="true"/>
											</div>
										</div>
										<div class="col-md-12">
											<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		                                        <li class="nav-item">
		                                            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true" onblur="$(this).pendingModifiedChanges();">
		                                            Pending for Approval&nbsp;<c:if test="${dbrMO.pending.size() > 0}"><span class="badge-lg badge-light badge-pill">${dbrMO.pending.size()}</span></c:if>
		                                            </a>
		                                        </li>
		                                        <li class="nav-item">
		                                            <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false" onblur="$(this).pendingModifiedChanges();">
		                                            Modified&nbsp;<c:if test="${dbrMO.modified.size() > 0}"><span class="badge-lg badge-light badge-pill">${dbrMO.modified.size()}</span></c:if>
		                                            </a>
		                                        </li>
		                                         <li class="nav-item">
		                                            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false" onblur="$(this).pendingModifiedChanges();">
		                                            Approved&nbsp;<c:if test="${dbrMO.approved.size() > 0}"><span class="badge-lg badge-light badge-pill">${dbrMO.approved.size()}</span></c:if>
		                                            </a>
		                                        </li>
		                                    </ul>
		                                    <div class="tab-content" id="pills-tabContent">
		                                      <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
					                          	<!-- <a href="javascript:void();" class="btn btn-sm btn-primary accAdd float-right" id="accAdd" onclick="$(this).addAccount();">
													Add
												</a> --><br><br>
												<div class="row">
													<div class="col-12 Left0">
													<c:forEach begin="0" end="${dbrMO.pending.size() == 0 ? 0 : dbrMO.pending.size()-1}" var="j">	
														<section class="subBlock dynamicAdd" id="subBlkId${j}">
															<div class="col-12">
																<div class="col-10 Left0 Right0">
																	<div class="col-2 Left0 Right0">
																		<div class="md-form col-4 Left0 ">
																			<form:hidden path="pending[${j}].status" class="detailsSts"/>
																			<form:hidden path="pending[${j}].extfldone" class="addInfoSts"/>
																			<form:hidden path="pending[${j}].Id" class="detailsAutoId"/>
																			<form:hidden path="pending[${j}].transId"/>
																			<form:input value="${count}" path="pending[${j}].autoIncr" class="cstm dynamicInputId form-control srNo srinp" id="srNoP${j}" style="border:0 !important;" readonly="true" />
																			<c:if test="${j==0}"><label class="custform-control-placeholder" for="srNoP${j}" style="margin-left: -20px;">Sr No.</label></c:if>
																		</div>
																		<div class="md-form col-7 Left0 Right0">
																			<form:input path="pending[${j}].date" id="dateP${j}" class="cstm dynamicInputId form-control validateClass input-sm dynamicAddDate detailsCommonCls pendinddate" autocomplete="off" disabled="${editBoolean}"/>
																			<c:if test="${j==0}"><label class="custform-control-placeholder" for="dateP${j}">Date<span style="color: red">*</span></label></c:if>
																		</div>
																	</div>
																	<div class="md-form col-1">
																		<form:input path="pending[${j}].chequeNo" id="chqNo${j}" class="cstm dynamicInputId form-control input-sm chqNo detailsCommonCls"/>
																		<c:if test="${j==0}"><label class="custform-control-placeholder" for="chqNoP${j}">Chq No</label></c:if>
																	</div>
																	<div class="col-2 ledger_DIV">
																		<div class="md-form col-10 Left0 ">
																		<form:select path="pending[${j}].ledgerDO.id" class="cstm dynamicInputId form-control removeCss validateClass detailsCommonCls dynamicSelectId ledgerData" id="accHeadP${j}" onchange="$(this).ledgerChange()" disabled="${editBoolean}" style="height: 33px;">
																			<option value="">Select</option>
																			<c:forEach items="${dbrMO.getLedgerDOs()}" var="i">
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
																		<form:input path="pending[${j}].receipts" id="receiptsP${j}" class="cstm form-control receipt receiptss dynamicInputId input-sm text-right decimal validateField totalRec validateClass detailsCommonCls" onchange="$(this).totalReceipts();" onblur="$(this).checkk()" readonly="${editBoolean}"/>
																		<c:if test="${j==0}"><label class="custform-control-placeholder" for="receiptsP${j}">Receipts</label></c:if>
																	</div>
																	<div class="md-form col-2">
																		<form:input path="pending[${j}].paymentExp" id="payments${j}" class="cstm form-control paymentss receiptss dynamicInputId input-sm text-right decimal validateField totalPay validateClass detailsCommonCls" onchange="$(this).totalPayments();" onblur="$(this).checkk()" readonly="${editBoolean}"/>
																		<c:if test="${j==0}"><label class="custform-control-placeholder" for="payments${j}">Payments </label></c:if>
																	</div>
																	<div class="md-form col-3">
																	<form:textarea path="pending[${j}].narration" id="narrationP${j}" class="cstm dynamicInputId form-control input-sm detailsCommonCls" rows="1" readonly="${editBoolean}"/>
																		<c:if test="${j==0}"><label class="custform-control-placeholder" for="narrationP${j}">Narration</label></c:if>
																	</div>
																</div>
																<div class="col-2 Left0 Right0">
																	<div class="md-form col-3">
																	<c:choose>
																		<c:when test="${approver==true}">
																			<input type="hidden" value="${dbrMO.pending[j].approve}" class="checkVal doNothingInp">
			                                                           		<input name="pending[${j}].approve" type="checkbox" class="checkbox dynamicInputId approveCHKBX" onclick="$(this).checkVal();" id="chkBxP${j}" value="N" style="height: 40px;margin-left: 20px;"/>
			                                                            	<c:if test="${j==0}"><label for="chkBxP${j}" class="cr custform-control-placeholder">Approve</label></c:if>
																		</c:when>
																		<c:otherwise>
																			<form:input path="pending[${j}].approve" type="hidden"/>
																		</c:otherwise>
																	</c:choose>
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
														<a href="javascript:void();" class="btn btn-sm btn-primary accAdd float-right" id="accAdd" onclick="$(this).addAccount();">
													Add
												</a>
													</div>
												</div>
					                          </div>
					                          <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
					                          	<div class="row">
													<div class="col-12 Left0 ">
		                                        	<c:if test="${dbrMO.modified.size() > 0}">
		                                        	<c:forEach begin="0" end="${dbrMO.modified.size()  == 0 ? 0 : dbrMO.modified.size()-1}" var="j">
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
																			<form:select path="modified[${j}].ledgerDO.id" class="ledgerData cstm dynamicInputId form-control removeCss validateClass detailsCommonCls dynamicSelectId" id="accHeadM${j}" onchange="$(this).ledgerChange()" disabled="${editBoolean}" style="height: 33px;">
																				<option value="">Select</option>
																				<c:forEach items="${dbrMO.getLedgerDOs()}" var="i">
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
																				<input type="hidden" value="${dbrMO.modified[j].approve}" class="checkVal doNothingInp">
				                                                            	<input name="modified[${j}].approve" type="checkbox" class="checkbox approveCHKBX" onclick="$(this).checkVal();" id="chkBxM${j}" value="N" style="height: 40px;margin-left: 20px;"/>
				                                                            	<c:if test="${j==0}"><label for="chkBxM${j}" class="cr custform-control-placeholder">Approve</label></c:if>
																			</c:when>
																			<c:otherwise>
																				<form:input path="modified[${j}].approve" type="hidden"/>
																			</c:otherwise>
																		</c:choose>
																		<%-- <c:if test="${approver==true}">
				                                                       		<input type="hidden" value="${dbrMO.modified[j].approve}" class="checkVal doNothingInp">
				                                                            <input name="modified[${j}].approve" type="checkbox" class="checkbox approveCHKBX" onclick="$(this).checkVal();" id="chkBxM${j}" value="N" style="height: 40px;margin-left: 20px;"/>
				                                                            <c:if test="${j==0}"><label for="chkBxM${j}" class="cr custform-control-placeholder">Approve</label></c:if>
				                                                        
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
																				<input type="hidden" value="${dbrMO.modified[j].extfldtwo}" class="checkVal doNothingInp">
				                                                            	<input name="modified[${j}].extfldtwo" type="checkbox" class="checkbox transCHKBX" onclick="$(this).checkVal();" id="transChBXM${j}" value="N" style="height: 40px;margin-left: 20px;"/>
				                                                            	<c:if test="${j==0}"><label for="transChBXM${j}" class="cr custform-control-placeholder">Update</label></c:if>
																			</c:when>
																			<c:otherwise>
																				<form:input path="modified[${j}].extfldtwo" type="hidden"/>
																			</c:otherwise>
																		</c:choose>
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
					                          	<c:if test="${dbrMO.approved.size() > 0}">
		                                        	<c:forEach begin="0" end="${dbrMO.approved.size() == 0 ? 0 : dbrMO.approved.size()-1}" var="j">
		                                        		<section class="subBlock approved" id="subBlkIdA${j}">
		                                        			<div class="col-12">
																<div class="col-10 Left0 Right0">
																	<div class="col-2 Left0 Right0">
																		<div class="md-form col-4  Left0 ">
																			<form:hidden path="approved[${j}].status" class="detailsSts"/>
																			<form:hidden path="approved[${j}].extfldone" class="addInfoSts"/>
																			<form:hidden path="approved[${j}].Id" class="detailsAutoId"/>
																			<form:hidden path="approved[${j}].transId"/>
																			<form:input value="" path="approved[${j}].autoIncr" class="cstm form-control srNo" id="srNoA${j}" style="border:0 !important;" readonly="true" />
																			<c:if test="${j==0}"><label class="custform-control-placeholder" for="srNoA${j}" style="margin-left: -20px;">SrNo</label></c:if>
																		</div>
																		<div class="md-form col-8 Left0 Right0">
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
																		<form:select path="approved[${j}].ledgerDO.id" class="ledgerData cstm dynamicInputId form-control removeCss validateClass detailsCommonCls dynamicSelectId" id="accHeadA${j}" onchange="$(this).ledgerChange()" disabled="${editBoolean}" style="height: 33px;">
																			<option value="">Select</option>
																			<c:forEach items="${dbrMO.getLedgerDOs()}" var="i">
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
																	   <form:hidden path="approved[${j}].checkApprove" id="checkvalue${j}"  class="detailsCommonCls checkValue" /> 
																		<form:textarea path="approved[${j}].narration" id="narrationA${j}" class="cstm form-control input-sm detailsCommonCls checkNarration" rows="1" readonly="${editBoolean}"/>
																		<c:if test="${j==0}"><label class="custform-control-placeholder" for="narrationA${j}">Narration</label></c:if>
																	</div>
																</div>
																<div class="col-2 Left0 Right0">
																	<div class="md-form col-3">
																	<c:choose>
																		<c:when test="${approver==true}">
																			<input type="hidden" value="${dbrMO.approved[j].approve}" class="checkVal doNothingInp">
			                                                            	<input name="approved[${j}].approve" type="checkbox" class="checkbox approveCHKBX" onclick="$(this).checkVal();" id="chkBxA${j}" value="N" style="height: 40px;margin-left: 20px;"/>
			                                                            	<c:if test="${j==0}"><label for="chkBxA${j}" class="cr custform-control-placeholder">Approve</label></c:if>
																		</c:when>
																		<c:otherwise>
																			<form:input path="approved[${j}].approve" type="hidden"/>
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
																			<input type="hidden" value="${dbrMO.approved[j].extfldtwo}" class="checkVal doNothingInp">
			                                                            	<input name="approved[${j}].extfldtwo" type="checkbox" class="checkbox transCHKBX " onclick="$(this).checkVal();" id="transChBXA${j}" value="N" style="height: 40px;margin-left: 20px;"/>
			                                                            	<c:if test="${j==0}"><label for="transChBXA${j}" class="cr custform-control-placeholder">Update</label></c:if>
																		</c:when>
																		<c:otherwise>
																			<form:input path="approved[${j}].extfldtwo" type="hidden"/>
																		</c:otherwise>
																	</c:choose>
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
											<label class="custform-control-placeholder" for="transR">Total Receipts</label>
											<form:input path="dbrdo.totalTransRec" id="transR" class="cstm form-control input-sm decimal validateField text-right TotalTransRec" readonly="true"/></div>
											<div class="md-form col-2 ">
											<label class="custform-control-placeholder" for="transP">Total Payments</label>
											<form:input path="dbrdo.totalTransPay" id="transP" class="cstm form-control input-sm decimal validateField text-right TotalTransPay" readonly="true"/></div>
										</div>
									</div>
									</div><br>
									<div class="row" style="float: right;">
										<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('DBRFormId','btnId');" id="btnId">
											<span class="spinner-grow spinner-grow-sm" id="loadindGif" style="display: none;"></span>
											<b id="btnTextId">Submit</b>
										</button>
										<a href="./DBRSearch.html" class="btn btn-danger btn-sm" role="button">Cancel</a>
									</div>
												<%-- <div class="row">
													<div class="col-sm-3">
														<label>Company Branch<span style="color:red">*</span></label>
														<form:hidden path="dbrdo.Id" id="dbrId"/>
														<form:hidden path="dbrdo.dbrId" />
														<form:hidden path="dbrdo.extfld01"/>
														<form:hidden path="dbrdo.month" id="month"/>
														<form:hidden path="dbrdo.branchDO.id" id="branchAutoId"/>
														<form:hidden path="dbrdo.companyDO.id" value="${compId}"/>
														<input type="hidden" id="approver" value="${approver}"/>
														<input type="hidden" id="contra" value="${contra}"/>
														<input type="hidden" id="bankpay" value="${bankpay}"/>
														<input type="hidden" id="bankrec" value="${bankrec}"/>
														<form:select path="dbrdo.companyBranch" class="form-control doNothingInp validateClass" id="compBranch" onchange="$(this).branchChange();">
															<option value="" data-AId="">Select</option>
															<c:forEach items="${dbrMO.getBranchDOs()}" var="var01">
																<form:option value="${var01.branchId}" data-AId="${var01.id}">${var01.branchName}</form:option>
															</c:forEach>
														</form:select>
													</div>
													<div class="col-sm-3">
														<label>Bank</label>
														<form:input path="dbrdo.bank" class="form-control input-sm doNothingInp" value="${bankName}" readonly="true" id="bankName"/>
													</div>
													<div class="col-sm-3">
														<label>Branch</label>
														<form:input path="dbrdo.branch" class="form-control input-sm" value="${branchName}" readonly="true" id="branchName"/>
													</div>
													<div class="col-sm-3">
														<label>Account</label>
														<form:input path="dbrdo.account" class="form-control input-sm" value="${AccNo}" readonly="true" id="accNo"/>
														<form:hidden path="dbrdo.extfld02" value="${lid}" id="lid"/>
													</div>
												</div>
												<div class="row">
													<div class="col-sm-3">
														<label>Opening Balance</label>
														<form:input path="dbrdo.openingBal" class="form-control input-sm decimal validateField text-right" readonly="true"/>
													</div>
													<div class="col-sm-3">
														<label>Total Receipts</label>
														<form:input path="dbrdo.totalReceipts" class="form-control input-sm decimal validateField text-right" id="totalReceipt" readonly="true"/>
													</div>
													<div class="col-sm-3">
														<label>Total Payments</label>
														<form:input path="dbrdo.totalPaymnts" class="form-control input-sm decimal validateField text-right" id="totalPayment" readonly="true"/>
													</div>
													<div class="col-sm-3">
														<label>Closing Balance</label>
														<form:input path="dbrdo.closingBal" class="form-control input-sm decimal validateField text-right" readonly="true"/>
													</div>
												</div><br>
												<div class="row">
														<div class="col-sm-12">
					                                    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
					                                    	

					                                        <li class="nav-item">
					                                            <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">
					                                            Pending for Approval&nbsp;<c:if test="${dbrMO.pending.size() > 0}"><span class="badge-lg badge-light badge-pill">${dbrMO.pending.size()}</span></c:if>
					                                            </a>
					                                        </li>
					                                        <li class="nav-item">
					                                            <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">
					                                            Modified&nbsp;<c:if test="${dbrMO.modified.size() > 0}"><span class="badge-lg badge-light badge-pill">${dbrMO.modified.size()}</span></c:if>
					                                            </a>
					                                        </li>
					                                         <li class="nav-item">
					                                            <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">
					                                            Approved&nbsp;<c:if test="${dbrMO.approved.size() > 0}"><span class="badge-lg badge-light badge-pill">${dbrMO.approved.size()}</span></c:if>
					                                            </a>
					                                        </li>
					                                    </ul>
					                                    <div class="tab-content" id="pills-tabContent">
					                                    		 <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
					                                        	<c:if test="${dbrMO.approved.size() > 0}">
					                                        	<c:forEach begin="0" end="${dbrMO.approved.size() == 0 ? 0 : dbrMO.approved.size()-1}" var="j">
					                                        		<div class="subBlock approved border" id="subBlkIdA${j}">
																		<div class="row">
																			<div class="col-sm-2">Sr.No &nbsp;&nbsp;Date</div>
																			<div class="col-sm-2">Chq No.</div>
																			<div class="col-sm-2">Account Head<span style="color:red">*</span></div>
																			<div class="col-sm-2">Receipts</div>
																			<div class="col-sm-2">Payments</div>
																			<div class="col-sm-1 float-right"><c:if test="${approver==true}">Approve</c:if></div>
																		</div>
																		<div class="row">
																			<form:hidden path="approved[${j}].status" class="detailsSts"/>
																			<form:hidden path="approved[${j}].extfldone" class="addInfoSts"/>
																			<form:hidden path="approved[${j}].Id" class="detailsAutoId"/>
																			<form:hidden path="approved[${j}].transId"/>
																			<div class="input-group col-sm-2 span_DIV">
																				<div class="input-group-prepend"><span class="sr">${j +1}</span></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																				<form:input path="approved[${j}].autoIncr" type="hidden"/>
																				<form:input path="approved[${j}].date" class="form-control input-sm date dynamicAddDate detailsCommonCls" autocomplete="off" disabled="${editBoolean}"/>
																			</div>
																			<div class="col-sm-2 date_DIV"><form:input path="approved[${j}].chequeNo" class="form-control input-sm chqNo detailsCommonCls" readonly="${editBoolean}"/></div>
																			<div class="col-sm-2 ledger_DIV">
																				<form:select path="approved[${j}].ledgerDO.id" class="form-control dynamicSelId removeCss validateClass detailsCommonCls" id="accHeadA${j}" onchange="$(this).ledgerChange()" disabled="${editBoolean}">
																					<option value="">Select</option>
																					<c:forEach items="${dbrMO.getLedgerDOs()}" var="i">
																						<form:option value="${i.id}">${i.ledgerName}</form:option>
																					</c:forEach>
																				</form:select>
																				<form:input type="hidden" path="approved[${j}].ledgerDO.ledgerName" class="form-control"/>
																			</div>
																			<div class="col-sm-2"><form:input path="approved[${j}].receipts" class="form-control input-sm text-right decimal validateField totalRec detailsCommonCls" onchange="$(this).totalReceipts();" readonly="${editBoolean}"/></div>
																			<div class="col-sm-2"><form:input path="approved[${j}].paymentExp" class="form-control input-sm text-right decimal validateField totalPay detailsCommonCls" onchange="$(this).totalPayments();" readonly="${editBoolean}"/></div>
																			<div class="col-sm-1">
																				<c:if test="${approver==true}">
						                                                        <div class="checkbox d-inline float-right">
						                                                       		<input type="hidden" value="${dbrMO.approved[j].approve}" class="checkVal doNothingInp">
						                                                            <input name="approved[${j}].approve" type="checkbox" class="checkbox dynamicInputId approveCHKBX" onclick="$(this).checkVal();" id="chkBxA${j}" value="N"/>
						                                                            <label for="chkBxA${j}" class="cr"></label>
						                                                        </div>
						                                                        </c:if>
						                                                    </div>
																			<div class="col-sm-1 float-right"><a href="#" id="" class="btn dynamicChildDelete"><i class="feather icon-minus-circle float-right"></i></a></div>
																		</div>
																		<div class="row">
																			<div class="col-sm-6">Narration</div>
																			<c:if test="${edit == true}"><div class="col-sm-2"></div></c:if>
																			<c:if test="${approver==true && edit == true}"><div class="col-sm-2 transUpdate_DIV" style="display: none">Update Transaction</div></c:if>
																		</div>
																		<div class="row">
																			<div class="col-sm-6"><form:textarea path="approved[${j}].narration" class="form-control input-sm detailsCommonCls" rows="1" readonly="${editBoolean}"/></div>
																			<c:if test="${edit == true}">
																				<div class="col-sm-2">
																					<input type="button" class="btn btn-primary btn-sm doNothingInp addInfoBtn" data-toggle="modal" data-target="#exampleModalCenter" value="Additional Info" onclick="$(this).getDcrDetailsId()">
																				</div>
																			</c:if>
																			<div class="col-sm-2 transUpdate_DIV" style="display: none">
																				<c:if test="${approver==true && edit == true}">
						                                                        <div class="checkbox d-inline">
						                                                       		<input type="hidden" value="${dbrMO.approved[j].extfldtwo}" class="checkVal doNothingInp">
						                                                            <input name="approved[${j}].extfldtwo" type="checkbox" class="checkbox dynamicInputId transCHKBX" onclick="$(this).checkVal();" id="transChBXA${j}" value="N"/>
						                                                            <label for="transChBXA${j}" class="cr"></label>
						                                                        </div>
						                                                        </c:if>
						                                                    </div>
																		</div>
																		<br>
																	</div>
																</c:forEach>
																</c:if>
					                                        </div>
					                                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
						                                        <a href="#" class="btn btn-sm btn-primary accAdd float-right" id="accAdd" onclick="$(this).addAccount(this.id);">
																	Add
																</a>
																<c:forEach begin="0" end="${dbrMO.pending.size() == 0 ? 0 : dbrMO.pending.size()-1}" var="j">
																		<div class="subBlock dynamicAdd border" id="subBlkId${j}">
																			<div class="row">
																				<div class="col-sm-2">Sr.No &nbsp;&nbsp;Date</div>
																				<div class="col-sm-2">Chq No.</div>
																				<div class="col-sm-2">Account Head<span style="color:red">*</span></div>
																				<div class="col-sm-2">Receipts</div>
																				<div class="col-sm-2">Payments</div>
																				<div class="col-sm-1 float-right"><c:if test="${approver==true}">Approve</c:if></div>
																			</div>
																			<div class="row">
																				<form:hidden path="pending[${j}].status" class="detailsSts"/>
																				<form:hidden path="pending[${j}].extfldone" class="addInfoSts"/>
																				<form:hidden path="pending[${j}].Id" class="detailsAutoId"/>
																				<form:hidden path="pending[${j}].transId"/>
																				<div class="input-group col-sm-2 span_DIV monthChangeDiv">
																					<div class="input-group-prepend"><span class="sr">${j +1}</span></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																					<form:input path="pending[${j}].autoIncr" type="hidden"/>
																					<form:input path="pending[${j}].date" class="form-control input-sm  date dynamicAddDate detailsCommonCls" id="myreffId" autocomplete="off" disabled="${editBoolean}"/>
																				</div>
																				<div class="col-sm-2 date_DIV"><form:input path="pending[${j}].chequeNo" class="form-control input-sm chqNo detailsCommonCls" readonly="${editBoolean}"/></div>
																				<div class="col-sm-2 ledger_DIV">
																					<form:select path="pending[${j}].ledgerDO.id" class="form-control dynamicSelId removeCss validateClass detailsCommonCls" id="accHeadP${j}" onchange="$(this).ledgerChange()" disabled="${editBoolean}">
																						<option value="">Select</option>
																						<c:forEach items="${dbrMO.getLedgerDOs()}" var="i">
																							<form:option value="${i.id}">${i.ledgerName}</form:option>
																						</c:forEach>
																					</form:select>
																					<form:input type="hidden" path="pending[${j}].ledgerDO.ledgerName" class="form-control"/>
																				</div>
																				<div class="col-sm-2"><form:input path="pending[${j}].receipts" class="form-control input-sm text-right decimal validateField totalRec detailsCommonCls" onchange="$(this).totalReceipts();" readonly="${editBoolean}"/></div>
																				<div class="col-sm-2"><form:input path="pending[${j}].paymentExp" class="form-control input-sm text-right decimal validateField totalPay detailsCommonCls" onchange="$(this).totalPayments();" readonly="${editBoolean}"/></div>
																				<div class="col-sm-1">
																					<c:if test="${approver==true}">
							                                                        <div class="checkbox d-inline float-right">
							                                                       		<input type="hidden" value="${dbrMO.pending[j].approve}" class="checkVal doNothingInp">
							                                                            <input name="pending[${j}].approve" type="checkbox" class="checkbox dynamicInputId approveCHKBX" onclick="$(this).checkVal();" id="chkBxP${j}" value="N"/>
							                                                            <label for="chkBxP${j}" class="cr"></label>
							                                                        </div>
							                                                        </c:if>
							                                                    </div>
																				<div class="col-sm-1 float-right"><a href="#" id="" class="btn dynamicChildDelete"><i class="feather icon-minus-circle float-right"></i></a></div>
																			</div>
																			<div class="row">
																				<div class="col-sm-6">Narration</div>
																				<c:if test="${edit == true}"><div class="col-sm-2"></div></c:if>
																				<c:if test="${approver==true && edit == true}"><div class="col-sm-2 transUpdate_DIV" style="display: none">Update Transaction</div></c:if>
																			</div>
																			<div class="row">
																				<div class="col-sm-6"><form:textarea path="pending[${j}].narration" class="form-control input-sm detailsCommonCls" rows="1" readonly="${editBoolean}"/></div>
																				<c:if test="${edit == true}">
																					<div class="col-sm-2">
																						<input type="button" class="btn btn-primary btn-sm doNothingInp addInfoBtn" data-toggle="modal" data-target="#exampleModalCenter" value="Additional Info" onclick="$(this).getDcrDetailsId()">
																					</div>
																				</c:if>
																				<div class="col-sm-2 transUpdate_DIV" style="display: none">
																					<c:if test="${approver==true && edit == true}">
							                                                        <div class="checkbox d-inline">
							                                                       		<input type="hidden" value="${dbrMO.pending[j].extfldtwo}" class="checkVal doNothingInp">
							                                                            <input name="pending[${j}].extfldtwo" type="checkbox" class="checkbox dynamicInputId transCHKBX" onclick="$(this).checkVal();" id="transChBXP${j}" value="N"/>
							                                                            <label for="transChBXP${j}" class="cr"></label>
							                                                        </div>
							                                                        </c:if>
							                                                    </div>
																			</div>
																			<br>
																		</div>	
																</c:forEach>
					                                        </div>
					                                        <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
					                                        	<c:if test="${dbrMO.modified.size() > 0}">
					                                        	<c:forEach begin="0" end="${dbrMO.modified.size()  == 0 ? 0 : dbrMO.modified.size()-1}" var="j">
					                                        		<div class="subBlock modified border" id="subBlkIdM${j}">
																		<div class="row">
																			<div class="col-sm-2">Sr.No &nbsp;&nbsp;Date</div>
																			<div class="col-sm-2">Chq No.</div>
																			<div class="col-sm-2">Account Head<span style="color:red">*</span></div>
																			<div class="col-sm-2">Receipts</div>
																			<div class="col-sm-2">Payments</div>
																			<div class="col-sm-1 float-right"><c:if test="${approver==true}">Approve</c:if></div>
																		</div>
																		<div class="row">
																			<form:hidden path="modified[${j}].status" class="detailsSts"/>
																			<form:hidden path="modified[${j}].extfldone" class="addInfoSts"/>
																			<form:hidden path="modified[${j}].Id" class="detailsAutoId"/>
																			<form:hidden path="modified[${j}].transId"/>
																			<div class="input-group col-sm-2 span_DIV">
																				<div class="input-group-prepend"><span class="sr">${j +1}</span></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																				<form:input path="modified[${j}].autoIncr" type="hidden"/>
																				<form:input path="modified[${j}].date" class="form-control input-sm date dynamicAddDate detailsCommonCls" autocomplete="off" disabled="${editBoolean}"/>
																			</div>
																			<div class="col-sm-2 date_DIV"><form:input path="modified[${j}].chequeNo" class="form-control input-sm chqNo detailsCommonCls" readonly="${editBoolean}"/></div>
																			<div class="col-sm-2 ledger_DIV">
																				<form:select path="modified[${j}].ledgerDO.id" class="form-control dynamicSelId removeCss validateClass detailsCommonCls" id="accHeadM${j}" onchange="$(this).ledgerChange()" disabled="${editBoolean}">
																					<option value="">Select</option>
																					<c:forEach items="${dbrMO.getLedgerDOs()}" var="i">
																						<form:option value="${i.id}">${i.ledgerName}</form:option>
																					</c:forEach>
																				</form:select>
																				<form:input type="hidden" path="modified[${j}].ledgerDO.ledgerName" class="form-control"/>
																			</div>
																			<div class="col-sm-2"><form:input path="modified[${j}].receipts" class="form-control input-sm text-right decimal validateField totalRec detailsCommonCls" onchange="$(this).totalReceipts();" readonly="${editBoolean}"/></div>
																			<div class="col-sm-2"><form:input path="modified[${j}].paymentExp" class="form-control input-sm text-right decimal validateField totalPay detailsCommonCls" onchange="$(this).totalPayments();" readonly="${editBoolean}"/></div>
																			<div class="col-sm-1">
																				<c:if test="${approver==true}">
						                                                        <div class="checkbox d-inline float-right">
						                                                       		<input type="hidden" value="${dbrMO.modified[j].approve}" class="checkVal doNothingInp">
						                                                            <input name="modified[${j}].approve" type="checkbox" class="checkbox dynamicInputId approveCHKBX" onclick="$(this).checkVal();" id="chkBxM${j}" value="N"/>
						                                                            <label for="chkBxM${j}" class="cr"></label>
						                                                        </div>
						                                                        </c:if>
						                                                    </div>
																			<div class="col-sm-1 float-right"><a href="#" id="" class="btn dynamicChildDelete"><i class="feather icon-minus-circle float-right"></i></a></div>
																		</div>
																		<div class="row">
																			<div class="col-sm-6">Narration</div>
																			<c:if test="${edit == true}"><div class="col-sm-2"></div></c:if>
																			<c:if test="${approver==true && edit == true}"><div class="col-sm-2 transUpdate_DIV" style="display: none">Update Transaction</div></c:if>
																		</div>
																		<div class="row">
																			<div class="col-sm-6"><form:textarea path="modified[${j}].narration" class="form-control input-sm detailsCommonCls" rows="1" readonly="${editBoolean}"/></div>
																			<c:if test="${edit == true}">
																				<div class="col-sm-2">
																					<input type="button" class="btn btn-primary btn-sm doNothingInp addInfoBtn" data-toggle="modal" data-target="#exampleModalCenter" value="Additional Info" onclick="$(this).getDcrDetailsId()">
																				</div>
																			</c:if>
																			<div class="col-sm-2 transUpdate_DIV" style="display: none">
																				<c:if test="${approver==true && edit == true}">
						                                                        <div class="checkbox d-inline">
						                                                       		<input type="hidden" value="${dbrMO.modified[j].extfldtwo}" class="checkVal doNothingInp">
						                                                            <input name="modified[${j}].extfldtwo" type="checkbox" class="checkbox dynamicInputId transCHKBX" onclick="$(this).checkVal();" id="transChBXM${j}" value="N"/>
						                                                            <label for="transChBXM${j}" class="cr"></label>
						                                                        </div>
						                                                        </c:if>
						                                                    </div>
																		</div>
																		<br>
																	</div>
																</c:forEach>
																</c:if>
					                                        </div>
					                                    </div>
					                                </div>
											</div>
													<br>
					                                    
												<div class="row">
													<div class="col-sm-6"></div>
													<div class="col-sm-3 ">
													<label>Total Receipts</label>
													<form:input path="dbrdo.totalTransRec" class="form-control input-sm decimal validateField text-right TotalTransRec" readonly="true"/></div>
													<div class="col-sm-3 ">
													<label>Total Payments</label>
													<form:input path="dbrdo.totalTransPay" class="form-control input-sm decimal validateField text-right TotalTransPay" readonly="true"/></div>
												</div><br>
												<div class="row" style="float: right;">
													<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('DBRFormId','btnId');" id="btnId">
														<span class="spinner-grow spinner-grow-sm" id="loadindGif" style="display: none;"></span>
														<b id="btnTextId">Submit</b>
													</button>
													<a href="./DBRSearch.html" class="btn btn-danger btn-sm" role="button">Cancel</a>
												</div> --%>
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
					      		<button class="btn btn-sm btn-primary w-75 addInfosave" onclick="$(this).saveDBRAddInfo();"><i class="fab fa-telegram fa-lg"></i></button>
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