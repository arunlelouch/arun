<%@include file="TagLibraries.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="javascript" src="resources/Javascript/Report.js"></script>
<script type="text/javascript">

</script>
<style type="text/css">


.data-holderUl200 {
	background: #FFFFFF none repeat scroll 0 0;
    display: none;
    list-style: none;
    position: absolute;    
    width: 181.22222px;   
    border: 1px solid #999880;
    cursor: pointer;
    margin-top: -1px;
    font-weight: normal;
    height: auto;
    z-index: 10000;
    max-height: 300px;
    overflow-y: scroll;
    white-space : nowrap;
 }
 
.inputClass{
font-weight: bold;
}
.verticalLine {
  border-left: 2px solid #212121;height: 1388px;width: 78px;
}

.Vertical{
 border-left: 2px solid #212121;height: 25px;width: 7px;
}


/* width */
::-webkit-scrollbar {width: 7px;}
/* Track */
::-webkit-scrollbar-track {background: #f1f1f1;} 
/* Handle */
::-webkit-scrollbar-thumb {background: #888;} 
/* Handle on hover */
::-webkit-scrollbar-thumb:hover {background: #555;}
.vl {border-left: 2px solid #212121;height: 481px;}
.alignCls { text-align: right; }
.hl {border-top: 1px solid #212121;height: 2px;width: 100%;}
.stayDer {background: #0f589521;}	
.stayDerGrpSum {background:  #c5c5c5;width: 100%;}
input[type="text"]:not(.data-holderInp):not(.customInpStyle) {border: none;background: transparent;}
input[type="text"]:not(.data-holderInpEdit) {background: transparent;}
input:focus {outline: none;}
.narrationTr {background-color: #ececec;}
hr { width:100%; height:1px; background: #fff }
.textStyleNonEdit_500 {	color: #999;padding-left: 5px;padding-right: 5px;width: 500px;background-color: #FFEFCF;}
.textStyleNonEdit_300 {color: #999;padding-left: 5px;padding-right: 5px;width: 300px;background-color: #FFEFCF;}
.textStyleNonEdit_200 {	color: #999;padding-left: 5px;padding-right: 5px;width: 200px;background-color: #FFEFCF;}
.tdHeightCls {color: #000000;text-decoration: none;padding-top: 0px;height: 40px;}
.rightAlign {text-align: right;	width: 17%;}
.commClsForStyle{text-align: right;background: transparent;border: none;width: 110px;}
.commClsForFA{text-align: right;background: transparent;border: none;width: 100px;}
.doNothingCls{color: #000000;padding-left: 5px;padding-right: 5px;width: 130px;}
.ui-dialog .ui-dialog-content {	position: relative;	border: 0;padding: 10px;background: none;max-width: 100%;min-height: 50px;word-wrap: break-word;line-height: 20px;text-align: left !important;}
.tab {border-bottom: 2px solid #05223a21;overflow: hidden;height: 20px;}
.tab button {color: black;float: left;outline: none;	cursor: pointer;transition: 0.3s;background-color: #9c9c9c;}
.tab button:hover { background-color: #ddd; }
.tab button.active { background-color: #28529221; border-radius: 0px; }
</style>
</head>
<body class="bodyClass" style="overflow-y:auto">
<div id="divmaincontainer">
<table border="0" cellpadding="0" cellspacing="0" class="innerTable mainTbl" style="width:100%;">
<tr>
	<td style="width: 13%;vertical-align: top"><div style="width:105%;max-height: 425px;display: inline-block;overflow-y:scroll;margin-top: 145px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 96%; width:100%;">
			<c:forEach begin="0" end="${reportUIDOs.size() == 0 ? 0 : reportUIDOs.size() - 1}" var="i">
				<tr style="height: 5%;"><td class="reportTypeCls ${reportUIDOs[i].featureMasterDO.featureId}" id="${reportUIDOs[i].featureMasterDO.featureName}">
					<b><a href="#">${reportUIDOs[i].featureMasterDO.displayName}</a><span class="commonHide arrowSpan" style="display: none; padding-left: 10px;"> >></span></b></td>
				</tr>
			</c:forEach>			
			<tr style="height: 35%;"></tr>
			<!--casshFlow-->
			<tr style="height: 5%;"><td class="reportTypeCls" id="CASHFLOW">
				<b><a href="#">Cash Flow</a><span class="commonHide arrowSpan" style="display: none; padding-left: 10px;"> >></span></b></td>
			</tr>
			<!--casshFlow-->
			<tr style="height: 45%;"></tr>
			<!-- Accounts Chart -->
			<tr style="height: 5%;"><td class="reportTypeCls" id="ACCOUNTSCHART">
					<b><a href="#">Accounts Chart</a><span class="commonHide arrowSpan" style="display: none; padding-left: 10px;"> >></span></b></td>
			</tr>
			<!-- Accounts Chart -->
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="height: 2%; width:100%;">
			<tr style="height: 5%;"><td class="reportTypeCls" id="viewSetup">
				<b><a href="#"><input type="button" value="View Setup" id=""/></a><span class="commonHide arrowSpan" style="display: none; padding-left: 10px;"> >></span></b></td>
			</tr>
		</table></div>
	</td>
	<td style="width:1%"><div class="vl"></div></td>
	<td style="position: absolute; height: 98%; width: 86%;">
	
 <div class="setUpViewDiv commonHide" style="display: none; height: 100%;margin-top: 154px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 3%; width:54%;">
			<tr style="height: 2%;">
				<td style="width: 20%;"><input type="checkbox" class="printZeros"/>&nbsp;&nbsp;&nbsp;&nbsp;<b>Print Zero</b></td>
				<td style="width: 20%;"><input type="checkbox" class="showNarration"/>&nbsp;&nbsp;&nbsp;&nbsp;<b>Show Narration </b></td>
				<td style="width: 20%;"><input type="checkbox" class="groupCheckBox"/>&nbsp;&nbsp;&nbsp;&nbsp;<b>Print Zero Balance Data </b> </td>
			</tr>
		</table>
	</div> 
	<!-- Journa Register Report Data -->
	
 <div class="firstStepJV journalTab commonHide"  style="display: none; height: 100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 98%; width:52%;margin-top: 197px;">
			<tr style="height: 2%;">
				<td width="100%">
					<div style="float: left;"  class="JV">
						From<input type="text" class="periodFrom date" style="width: 80px;"/> -To <input type="text" class="periodTo date" style="width: 80px;"/>
					</div>
					<div style="float: left; padding-left: 20px;"><b>Year</b>
						<input type="text" class="entryYear"></input>
					</div>
					<div  style="float: right;"><b>No. of Entries</b></div>
				</td>
			</tr>
			<tr><td width= "100%"><div class="hl"></div></td></tr>
			<tr style="height: 60%;">
			<td>
				<table border="0" cellpadding="0" cellspacing="0" style="height: 50%; width:100%;" class="highlightTblRw">
					<tr class="firstStepDblClk" id="1"><td><b>January</b><div class="january" style="float: right; padding-right: 20px;">0</div></td></tr>
					<tr class="firstStepDblClk" id="2"><td><b>February</b><div class="february" style="float: right; padding-right: 20px;">0</div></td></tr>
					<tr class="firstStepDblClk" id="3"><td><b>March</b><div class="march" style="float: right; padding-right: 20px;">0</div></td></tr>
					<tr class="firstStepDblClk" id="4"><td><b>April</b><div class="april" style="float: right; padding-right: 20px;">0</div></td></tr>
					<tr class="firstStepDblClk" id="5"><td><b>May</b><div class="may" style="float: right; padding-right: 20px;">0</div></td></tr>
					<tr class="firstStepDblClk" id="6"><td><b>June</b><div class="june" style="float: right; padding-right: 20px;">0</div></td></tr>
					<tr class="firstStepDblClk" id="7"><td><b>July</b><div class="july" style="float: right; padding-right: 20px;">0</div></td></tr>
					<tr class="firstStepDblClk" id="8"><td><b>August</b><div class="august" style="float: right; padding-right: 20px;">0</div></td></tr>
					<tr class="firstStepDblClk" id="9"><td><b>September</b><div class="september" style="float: right; padding-right: 20px;">0</div></td></tr>
					<tr class="firstStepDblClk" id="10"><td><b>October</b><div class="october" style="float: right; padding-right: 20px;">0</div></td></tr>
					<tr class="firstStepDblClk" id="11"><td><b>November</b><div class="november" style="float: right; padding-right: 20px;">0</div></td></tr>
					<tr class="firstStepDblClk" id="12"><td><b>December</b><div class="december" style="float: right; padding-right: 20px;">0</div></td></tr>
				</table>
			</td>
			</tr>
			<tr style="height: 18%;"><td align="right"></td></tr>
		</table>
	</div>
	<div class="secondStepJV commonHide" style="display: none; height: 100%;margin-top: 147px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:99%; display: inline-block; overflow-y: scroll; max-height: 480px;"  
			id="journalEntryTable"	class="highlightTblRw">
			<tr class="excptRow">
				<td><div><input type="button" value="<< Back" class="secondStepBackBtn"/></div></td>
				<td><b>List of all journal Entries</b>
					<input type="hidden" readonly="readonly" style="font-weight: bold;" class="year"/>
					<input type="hidden" readonly="readonly" style="font-weight: bold;" class="month"/>
				</td>
				<td><div><input type="button" value="Narration" class="narration narrationShowAll"/></div></td>
				<td><div><input type="text" class="narrationSearch customInpStyle" placeholder="Enter Narration"/></div></td>
				<td colspan="5">
					<div style="float: right;" class="dispalyJV"><b> Period : </b> 
						<input type="text" class="periodFrom dtFormat jvDate startdate" style="width: 66px;"/> - <input type="text" class="periodTo dtFormat jvDate enddate" style="width: 66px;"/>
					</div>					
				</td>
			</tr>
			
			<tr class="excptRow">
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Date</b></td>
				<td width="25%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="18%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher Type</b></td>
				<td width="15%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher No.</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="secondStepDblClk narrationClick">
				<td><input type="text" class="transDate" readonly="readonly"/></td>
				<td><input type="text" class="ledgerName" readonly="readonly"/></td>
				<td><input type="text" class="voucherType" readonly="readonly"/></td>
				<td><input type="text" class="transId" readonly="readonly"/></td>
				<td style="text-align: right;">
					<input type="hidden" class="month"/>
					<input type="hidden" class="transAmountHdn validateField decimal"/>
					<div class="transAmountDR emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<input type="hidden" class="transAmountHdn validateField decimal" title="Credit Amount" readonly="readonly"/>
					<div class="transAmountCR"></div>
				</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>
	<div class="thirdStepJV commonHide"  style="display: none; height: 100%;margin-top: 147px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 90%; width:100%; display: table; overflow-y: scroll; max-height: 455px;"
				id="journalEntryDtlsTable" class="highlightTblRw">
			<tbody style="display: table; width: 100%;">
				<tr class="excptRow">
					<td colspan="3">
						<div style="float: left;"><input type="button" value="<< Back" class="thirdStepBackBtn"/></div>
						<div class="journalNo" style="text-align: right;padding-right: 200px;font-weight: bold;"><b style="padding-left: 10px;">Journal No. : </b></div>					
					</td>
					<td colspan="2" style="align:right"><div class="editBtn" style=" display: none"><b style="float:right; margin-right: 9%;"><img src="resources/images/edit.png" style="padding-left: 25px; width: 12px; height : 15px;" border="0" title="Edit Record" id="edit"/></b></div></td>
				</tr>
				
				<tr class="excptRow">
					<td width="50%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
					<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
					<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
					<td colspan="2" width="20%" style="text-align: center; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Balance</b></td>
				</tr>
				
				<c:forEach  begin="0" end="0" var="i">
				<tr class="thirdStepDblClk">
					<td><input type="text" class="ledgerName" readonly="readonly"/></td>
					<td style="text-align: right;">
						<input type="hidden" class="month"/>
						<input type="hidden" class="transAmountHdnDR validateField decimal" style="width: 500px;"/>
						<div class="transAmountDR emptyVal"></div>
					</td>
					<td style="text-align: right;">
						<input type="hidden" class="transAmountHdnCR validateField decimal emptyVal"/>
						<div class="transAmountCR emptyVal"></div>
					</td>
					<td style="text-align: right;">
						<div class="cumBal emptyVal"></div>
					</td>		
					<td style="text-align: left">
						<input type="text" class="cumDrCr" readonly="readonly"/>
					</td>		
				</tr>			
				</c:forEach>
			</tbody>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" style="width:100%;" id="journalEntryDtlsTableTotal" class="highlightTblRw">
				<tr class="thirdSteptotal">
					<td style="width:50%"><b>Narration :</b><input type="text" class="ledgerNarration" readonly="readonly"/></td>
					<td style="width:15% ;text-align: right;border-top: 1pt solid; border-bottom: 1pt solid">
						<input type="hidden" class="transAmountHdnDRTotal validateField decimal" style="width: 500px;" />
						<b><span class="transAmountDRTotal emptyVal" style="padding-right: 2px;"></span></b>
					</td>
					<td style="width:15% ;text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
						<input type="hidden" class="transAmountHdnCRTotal validateField decimal emptyVal"/>
						<b><span class="transAmountCRTotal emptyVal" style="padding-left: 2px;"></span></b>
					</td>
					<td colspan="2" style="width:20%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid"></td>
				</tr>
			</table>
	</div>
	
	<!-- Journa Register Report Data - End -->
	
	<!-- Cash or Bank Book Report Data -->
	
	<div class="firstStepCBB cashOrBankTab commonHide" style="display: none;height: 100%;margin-top: 146px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 90%; width:100%; display: table; overflow-y: scroll;
			max-height: 430px;" id="cashBankLedgers" class="highlightTblRw">
			<tbody style="display: table; width: 100%;">
				<tr class="excptRow">
				<td>
					<div style="float: left;"><input type="button" value="<< Back" class="thirdStepBackBtn"/></div>
					<div class=""><b style="padding-left: 10px;"></b></div>
					
				</td>
				<td></td>
				<td></td><td></td><td></td><td></td>
				</tr>
			
				<tr class="excptRow">
					<td width="70%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
					<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
					<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				</tr>
				
				<c:forEach  begin="0" end="0" var="i">
				<tr class="firstStepCBBDblClk">
					<td>
						<input type="text" class="groupName ledgerName" readonly="readonly" style="font-weight: bold;"/>
						<input type="hidden" class="ledgerAuto"/>
						</td>
					<td style="text-align: right;">
						<input type="hidden" class="amountHdn validateField decimal"/>
						<div class="groupTtlAmountDR emptyVal" style="text-align: right;"></div>
					</td>
					<td style="text-align: right;">
						<div class="groupTtlAmountCR emptyVal" style="text-align: right;"></div>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%;" id="cashBankLedgersTotal" class="highlightTblRw">
			<tr class="" style="background-color: background-color: #afafaf6b;">
				<td style="width : 70%; border-top: 1pt solid; border-bottom: 1pt solid;font-weight: bold"><b>Grand Total </b></td>
				<td style=" width: 15%; border-top: 1pt solid; border-bottom: 1pt solid;font-weight: bold">
					<div class="groupTotDR emptyVal" style="width: 143px; padding-right: 2px; text-align: right;"></div>
				</td>
				<td style="width : 15%; border-top: 1pt solid; border-bottom: 1pt solid;font-weight: bold">
					<div class="groupTotCR emptyVal" style="width: 135px; padding-left: 2px; text-align: right;"></div>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="secondStepCBB commonHide"  style="display: none;height: 100%;margin-top: 147px;">
		<table border="0" cellpadding="0" cellspacing="0" style=" width:99%; line-height: 10px;" id="cashBankStepTwoLedgers">
			<tr style="height: 20%;" >
				<td colspan="4">
					<input type="hidden" class="ledgerId"/>
					<input type="hidden" class="ledgerAuto"/>
					<input type="hidden" class="ledgerName"/>
					<input type="hidden" class="accType"/>
					<div style="float: left;"><input type="button" value="<< Back" class="secondStepBackBtnCBB"/></div>
					<div style="float: right;"><input type="button" value="BRS" class="showBRS" style="display: none;"/></div>
				</td>
			</tr>
			<tr style="height: 2%;">
				<td style="width:40%">
					<div style="float: left; width: 49%"><b>Year</b>
						<input type="text" value="2018" class="entryYearCBB"></input>
					</div>
				</td>
				<td style="width:20%"><div class="rightAlign" style="float: right;"><b>Debit</b></div></td>
				<td style="width:20%"><div class="rightAlign" style="float: right;"><b>Credit</b></div></td>
				<td style="width:20%"><div class="" style="float: right;"><b>Closing Balance</b></div></td>
			</tr>
			<tr><td colspan="4" width= "100%"><div class="hl"></div></td></tr>
			<tr style="height: 100%;">
			<td colspan="4">
				<table border="0" cellpadding="0" cellspacing="0" style="height: 50%; width:100%;" class="highlightTblRw">
					<tr class="openBalHideForPl">
						<td style="width:40%"><div  style="float: left; width: 49%; text-decoration: underline;">Opening Balance</div></td>
						<td style="width:20%"><div class="" style="float: right;"></div></td>
						<td style="width:20%"><div class="" style="float: right;padding-right:65px;"></div></td>
						<td style="width:20%"><div class="openingBal " style="float: right;text-align:right; "></div> </td>
					</tr>
					<tr class="secondStepDblClkCBB" id="1">
						<td style="width:40%"><div style="float: left; width: 49% ;height: 21px;"><b>January</b></div></td>
						<td style="width:20%"><div class="januarydebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="januarycredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="januarycb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCBB" id="2">
						<td style="width:40%"><div style="float: left; width: 49%;height: 21px;"><b>February</b></div></td>
						<td style="width:20%">	<div class="februarydebit" style="float: right;"></div></td>
						<td style="width:20%">	<div class="februarycredit" style="float: right;"></div></td>
						<td style="width:20%">	<div class="februarycb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCBB" id="3">
						<td style="width:40%"><div style="float: left; width: 49%;height: 21px;"><b>March</b></div></td>
						<td style="width:20%"><div class="marchdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="marchcredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="marchcb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCBB" id="4">
						<td style="width:40%"><div style="float: left; width: 49%;height: 21px;"><b>April</b></div></td>
						<td style="width:20%"><div class="aprildebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="aprilcredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="aprilcb amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCBB" id="5">
						<td style="width:40%"><div style="float: left; width: 49%;height: 21px;"><b>May</b></div></td>
						<td style="width:20%"><div class="maydebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="maycredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="maycb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCBB" id="6">
						<td style="width:40%"><div style="float: left; width: 49%;height: 21px;"><b>June</b></div></td>
						<td style="width:20%"><div class="junedebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="junecredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="junecb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCBB" id="7">
						<td style="width:40%"><div style="float: left; width: 49%;height: 21px;"><b>July</b></div></td>
						<td style="width:20%"><div class="julydebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="julycredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="julycb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCBB" id="8">
						<td><div style="float: left; width: 49%;height: 21px;"><b>August</b></div></td>
						<td style="width:20%"><div class="augustdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="augustcredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="augustcb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCBB" id="9">
						<td style="width:40%"><div style="float: left; width: 49%;height: 21px;"><b>September</b></div></td>
						<td style="width:20%"><div class="septemberdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="septembercredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="septembercb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCBB" id="10">
						<td style="width:40%"><div style="float: left; width: 49%;height: 21px;"><b>October</b></div></td>
						<td style="width:20%"><div class="octoberdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="octobercredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="octobercb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCBB" id="11">
						<td style="width:40%"><div style="float: left; width: 49%;height: 21px;"><b>November</b></div></td>
						<td style="width:20%"><div class="novemberdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="novembercredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="novembercb amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCBB" id="12">
						<td style="width:40%"><div style="float: left; width: 49%;height: 21px;"><b>December</b></div></td>
						<td style="width:20%"><div class="decemberdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="decembercredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="decembercb amtForCls" style="float: right;"></div></td>
					</tr>
				</table>
			</td>
			</tr>
			
			<!-- <tr style="height: 18%;"><td colspan="4" class="hl"></td></tr> -->
			
			<tr class="secondStepCBBClsBal" id="">
				<td style="width:40%;border-bottom: 1px solid black;border-top: 1px solid black;"><div  style="float: left; width: 49%"><b>Grand Total</b></div></td>
				<td style="width:20%;border-bottom: 1px solid black;border-top: 1px solid black;"><div class="debitTotal" style="float: right; font-weight: bold;"></div></td>
				<td style="width:20%;border-bottom: 1px solid black;border-top: 1px solid black;"><div class="creditTotal" style="float: right; font-weight: bold;"></div></td>
				<td style="width:20%;border-bottom: 1px solid black;border-top: 1px solid black;"><div class="closingBal" style="float: right; font-weight: bold;"></div>
					<div class="closingBalHdn" style="display: none;"></div></td>
			</tr>
			
			<!-- <tr style="height: 18%;"><td colspan="4" class="hl"></td></tr> -->
		</table>
	</div>
	
	<div class="thirdStepCBB commonHide" style="display: none;height: 100%;margin-top: 147px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 82%; width:99%; display: inline-block; overflow-y: scroll; max-height: 450px; line-height: 1px;"
			id="cashBankEntryTable"	class="highlightTblRw">
			<tr class="excptRow">
				<td><div>
					<input type="button" value="<< Back" class="thirdStepBackBtnCBB"/>
				</div></td>
				<td style="font-weight: bold;text-align: right" colspan="2">
					<div>	<!-- Ledger : -->
						<input type="text" readonly="readonly" style="font-weight: bold;" class="faLedger ledgerName"/>
						<input type="hidden" class="ledgerAutoId"/>
					</div>
					<input type="hidden" readonly="readonly" style="font-weight: bold;" class="year"/>
					<input type="hidden" readonly="readonly" style="font-weight: bold;" class="month"/>
				</td>
				<td><div><input type="button" value="Narration" class="narration narrationShowAll"/></div></td>
				<td><div><input type="text" class="narrationSearch customInpStyle" placeholder="Enter Narration"/></div></td>
				<td colspan="3">
					<div style="float: right;" class="displayGrp"><b> Period : </b> 
						<input type="text" class="periodFrom dtFormat cbDate startdate" style="width: 66px;"/> - <input type="text" class="periodTo dtFormat cbDate enddate" style="width: 66px;"/>
					</div>					
				</td>
				<!-- <td><div style="float: right;"><input type="button" value="BRS" class="showBRS" style="display: none;"/></div></td> -->
			</tr>
			
			<tr class="excptRow">
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Date</b></td>
				<td width="25%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="15%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher Type</b></td>
				<td width="15%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher No.</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Balance</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="thirdStepDblClkCBB narrationClick">
				<td><input type="text" class="transDate" readonly="readonly"/></td>
				<td><input type="text" class="ledgerName" readonly="readonly"/></td>
				<td><input type="text" class="voucherType" readonly="readonly"/></td>
				<td><input type="text" class="transId" readonly="readonly"/></td>
				<td style="text-align: right;">
					<div class="transAmount emptyVal drAmt"></div>
				</td>
				<td style="text-align: right;">
					<div class="transAmount emptyVal crAmt"></div>
				</td>
				<td style="text-align: right;">
					<div class="cumBal emptyVal"></div>	
				</td>
				<td style="text-align: left;">
					<input type="text" class="cumDrCr" readonly="readonly" style="width:15px;"/>				
				</td>
			</tr>
			</c:forEach>
		</table>
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%; line-height: 10px;" id="cashBankEntryTableTtl" class="highlightTblRw">
			<tr class="">
				<td style="border-top:1pt solid black;"></td>
				<td style="width : 28%; border-top:1pt solid black;"></td>
				<td style="width : 15%; border-top:1pt solid black;"></td>
				<td style="width : 15%; border-top:1pt solid black;"><b>Opening Balance :</b></td>
				<td style="width : 13%; border-top:1pt solid black;"><div class="openingBalanceDR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 12%; border-top:1pt solid black;"><div class="openingBalanceCR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 13%; border-top:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
				<td style="width : 14%; border-top:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
			</tr>
			<tr class="">
				<td></td>
				<td></td>
				<td></td>
				<td><b>Current Total :</b></td>
				<td><div class="totalDR emptyVal" style="text-align: right;"></div></td>
				<td><div class="totalCR emptyVal" style="text-align: right;"></div></td>
				<td><div class="balance emptyVal" style="text-align: right;"></div></td>
				<td><div class="balance emptyVal" style="text-align: right;width : 2%"></div></td>
			</tr>
			<tr class="">
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"></td>
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"></td>
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"></td>
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Closing Balance :</b></td>
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"><div class="closingBalanceDR emptyVal" style="text-align: right; font-weight: bold"></div></td>
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"><div class="closingBalanceCR emptyVal" style="text-align: right; font-weight: bold"></div></td>
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"><div class="emptyVal" style="text-align: right;width : 2%"></div></td>
			</tr>
		</table>
		
	</div>
	
	<div class="fourthStepCBB commonHide"  style="display: none;height: 100%;margin-top: 147px;">
	<table border="0" cellpadding="0" cellspacing="0" style="height: 90%; width:99%; display: inline-block; overflow-y: scroll; max-height: 430px;"  
			id="cashBankEntryDtlsTable" class="highlightTblRw">
			<tr class="excptRow">
				<td colspan="3">
					<div style="float: left;"><input type="button" value="<< Back" class="fourthStepBackBtnCBB"/></div>
					<div class="voucherType" style="text-align:right;padding-right:200px;font-weight: bold;"><b style="padding-left: 10px;"> : </b></div>
				</td>				
				<td colspan="2" style="align:right"><div class="editBtn" style="display : none"><b style="float:right;"><img src="resources/images/edit.png" style="padding-left: 25px; width: 12px; height : 15px;" border="0" title="Edit Record" id="edit"/></b></div></td>
			</tr>
			
			<tr class="excptRow mainn">
				<td style="width:40%;border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td style="width:16%;text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td style="width:15%;text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td colspan="2" width="20%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;padding-right:50px"><b>Balance</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="">
				<td><input type="text" class="ledgerName" readonly="readonly"/></td>
				<td style="text-align: right;">
					<div class="drAmt emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="crAmt emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="cumBal emptyVal"></div>
				</td>
				<td style="text-align: left">
					<input type="text" class="cumDrCr" style="width:15px;" readonly="readonly"/>
				</td>
			</tr>
			</c:forEach>
			
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%;" id="cashBankEntryDtlsTableTtl" class="highlightTblRw">
			<tr class="thirdSteptotal">
				<td style="width:40%"><span><b>Narration :</b><input type="text" class="ledgerNarration" readonly="readonly"/></span></td>
				<td style="text-align: right; width: 15%; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="transAmountDRTotal emptyVal" style="width: 143px; padding-right: 2px;"></span></b>
				</td>
				<td style="width : 17%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<input type="hidden" class="transAmountHdnCRTotal validateField decimal emptyVal"/>
					<b><span class="transAmountCRTotal emptyVal" style="width: 135px; padding-left: 2px;"></span></b>
				</td>
				<td style="width : 10%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid"></td>
				<td style="width : 5%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid"></td>
			</tr>
		</table>
	</div>
	
	<!-- Cash or Bank Book Report Data - End -->
	
	<!-- Sundry Age Wise Report Data -->
	
	<!-- <div class="firstStepSUNDRCR sundryDrCr commonHide"  style="display: none;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:100%;">
			<tr style="height: 2%;"><td></td> <td></td><td></td></tr>
			<tr style="height: 2%;" valign="top">
				<td class="ageWiseLedgerTxt" style="width: 105px;">Sundry Debtors	:</td>
				<td class="data-holdertd" width="20%;"><div><select name="ledger" id="ledgerAuto" class="sundDRCR dropdown_Fixed200 ledgerList"/></div></td>
				<td width="20%;" style="padding-left: 70px;"><input type="button" class="ageWiseVoucher" value="Ledger Vouchers"/></td>
				<td width="11%;"><input type="button" class="ageWise" value="Age-wise"/></td>
				<td></td>
			</tr>
		</table>
	</div> -->
	
	<div class="secondStepSUNDRCR commonHide" style="display: none;height: 100%;margin-top: 147px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:99%; display: inline-block; overflow-y: scroll; max-height: 450px;"
			id="sundryDRCREntryTable" class="highlightTblRw">
			<tr class="excptRow">
				<td><div>
					<input type="button" value="<< Back" class="secondStepBckBtnSUNDRCR"/>
				</div></td>
				<td class="sundryDCLedger"><b>Ledger : </b></td>
				<td>
					<input type="button" class="billWise" value="Bill-wise" id="ledgerBillWiseRpt"/>
					<input type="hidden" class="ledgerAuto"/>
					<input type="hidden" class="ledgerNameTemp"/>
				</td>
				<td></td><td></td><td></td><td></td>
			</tr>
			
			<tr class="excptRow">
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Date</b></td>
				<td width="25%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="18%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher Type</b></td>
				<td width="15%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher No.</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="sundryDRCREntryRow">
				<td><input type="text" class="transDate" readonly="readonly"/></td>
				<td><input type="text" class="ledgerName" readonly="readonly"/></td>
				<td><input type="text" class="voucherType" readonly="readonly"/></td>
				<td><input type="text" class="transId" readonly="readonly"/></td>
				<td style="text-align: right;">
					<div class="transAmount emptyVal drAmt"></div>
				</td>
				<td style="text-align: right;">
					<div class="transAmount emptyVal crAmt"></div>
				</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>
	
	<div class="thirdStepSUNDRCR commonHide"  style="display: none;height: 100%;">
	<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:99%; display: inline-block; overflow-y: scroll; max-height: 430px;"  
			id="sunDrCrEntryDtlsTable" class="highlightTblRw">
			<tr class="excptRow">
				<td>
					<div style="float: left;"><input type="button" value="<< Back" class="thirdStepSUNDRCRBtn"/></div>
					<div class="voucherType"><b style="padding-left: 10px;"> : </b></div>
				</td>
				<td></td>
				<td></td><td></td><td></td><td></td>
			</tr>
			
			<tr class="excptRow mainn">
				<td width="70%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="">
				<td><input type="text" class="ledgerName" readonly="readonly"/></td>
				<td style="text-align: right;">
					<div class="drAmt emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="crAmt emptyVal"></div>
				</td>
			</tr>
			</c:forEach>
			
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:96%;" id="sunDrCrEntryDtlsTableTtl" class="highlightTblRw">
			<tr class="thirdSteptotal">
				<td width="70%"><b>Narration :</b><input type="text" class="ledgerNarration" readonly="readonly"/></td>
				<td style="text-align: right; width: 15%; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><div class="transAmountDRTotal emptyVal" style="width: 143px; padding-right: 2px;"></div></b>
				</td>
				<td style="width : 15%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<input type="hidden" class="transAmountHdnCRTotal validateField decimal emptyVal"/>
					<b><div class="transAmountCRTotal emptyVal" style="width: 135px; padding-left: 2px;"></div></b>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="ageWiseDtlsSUNDRCR commonHide" style="display: none; width:40%; float: left; height: 25%;">
		<div>
			<table border="0" cellpadding="0" cellspacing="0" style="height: 2%; width:99%;" class="ageWiseBckBtn">
			<tr><td>
				<div style="float: left;">
					<input type="button" value="<< Back" class="sundryDrCrAgeWiseBck"/>
					<input type="hidden" class="groupId"/> 
					<input type="hidden" class="ledgerId"/> 
					<input type="hidden" class="ledgerAuto"/>
					<input type="hidden" class="ledgerName"/>
				</div>
			</td></tr>
			</table>
		</div>
		<div style="border-style : groove;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 98%; width:99%;" id="sundryDRCRAgeDtls" class="">
			<tr class="ageWiseTr" id="1">
				<td style="width: 25%;">From</td>
				<td style="width: 25%;"> :		<b><input type="text" value="0" style="width: 50%;" title="From Range" class="focusCls fromCls" readonly="readonly"/></b></td>
				<td style="width: 25%;">To</td>
				<td style="width: 25%;"> :		<b><input type="text" maxlength="3" value="90" style="width: 50%;" title="To Range"  class="focusCls setNextRow number validateField"/></b></td>
			</tr>
			<tr class="ageWiseTr" id="2">
				<td style="width: 25%;">From</td>
				<td style="width: 25%;"> :		<b><input type="text" maxlength="3" value="90" style="width: 50%;" title="From Range" class="focusCls fromCls" readonly="readonly"/></b></td>
				<td style="width: 25%;">To</td>
				<td style="width: 25%;"> :		<b><input type="text" maxlength="3" value="180" style="width: 50%;" title="To Range"  class="focusCls setNextRow number validateField"/></b></td>
			</tr>
			<tr class="ageWiseTr" id="3">
				<td style="width: 25%;">From</td>
				<td style="width: 25%;"> :		<b><input type="text" maxlength="3" value="180" style="width: 50%;" title="From Range" class="focusCls fromCls" readonly="readonly"/></b></td>
				<td style="width: 25%;">To</td>
				<td style="width: 25%;"> :		<b><input type="text" maxlength="3" value="360" style="width: 50%;" title="To Range"  class="focusCls setNextRow number validateField"/></b></td>
			</tr>
			<tr class="ageWiseTr" id="4">
				<td style="width: 25%;">From</td>
				<td style="width: 25%;"> :		<b><input type="text" maxlength="3" value="360" style="width: 50%;" title="From Range"  class="focusCls fromCls" readonly="readonly"/></b></td>
				<td style="width: 25%;">To</td>
				<td style="width: 25%;"> :		<b><input type="text" value="0" style="width: 50%;" title="To Range"  class="focusCls setNextRow number validateField" readonly="readonly"/></b></td>
			</tr>
		</table>
		</div>
	</div>
	
	<div class="showGenBtn commonHide" style="padding-top: 12%; padding-left: 2%; float: left; display: none;">
		<input type="button" class="genReport" value="Generate"/>
	</div>
	
	<div class="dispalyAgeWiseData commonHide"  style="display: none;height: 100%;">
	<table border="0" cellpadding="0" cellspacing="0" id="ageWiseRangeDtlsTable" class="highlightTblRw">
			<tr class="excptRow">
				<td><div style="float: left;"><input type="button" value="<< Back" class="ageWiseRangeBckBtn"/></div></td>
				<td class="" align="right">Ledger : </td>
				<td><b><input type="text" class="ageWiseLedgerName" readonly="readonly"/></b></td>
				<td></td><td></td><td></td><td></td>
			</tr>
			<tr class="excptRow">
				<td width="10%;" align="center" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Date</b></td>
				<td width="13%;" align="right" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Opening Amount</b></td>
				<td width="13%;" align="right" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Pending Amount</b></td>
				<td width="13%;" align="right" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b class="firstRange"></b></td>
				<td width="13%;" align="right" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b class="secRange"></b></td>
				<td width="13%;" align="right" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b class="thirdRange"></b></td>
				<td width="14%;" align="right" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b class="fourthRange"></b></td>
				<td width="10%;" align="center" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Due On</b></td>
			</tr>
			<c:forEach  begin="0" end="0" var="i">
			<tr class="">
				<td><input type="text" class="dates addTxt" readonly="readonly"/></td>
				<td style="text-align: right;"><div class="openingBal emptyVal"></div></td>
				<td style="text-align: right;"><div class="pending emptyVal"></div></td>
				<td style="text-align: right;"><div class="range0 emptyVal checkIndex"></div></td>
				<td style="text-align: right;"><div class="range1 emptyVal checkIndex"></div></td>
				<td style="text-align: right;"><div class="range2 emptyVal checkIndex"></div></td>
				<td style="text-align: right;"><div class="range3 emptyVal checkIndex"></div></td>
				<td style="text-align: right;"><input type="text" class="dates" readonly="readonly" style="text-align: right;"/></td>
			</tr>
			</c:forEach>
			
		</table>
	</div>
	
	<!-- Sundry Age Wise Report Data - End -->
	
	<!-- Fixed Asset Report Data -->
	
	<div class="firstStepFA FIXEDASSET commonHide" style="display: none; height: 100%;margin-top: 146px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 90%; width:99%; display: inline-block; overflow-y: scroll;
			max-height: 430px;" id="fixedAssetLedgers" class="highlightTblRw">
				<tr class="excptRow">
				<td colspan="3" style="text-align: left;"><input type="button" class="genDeprData" value="Depreciation"/></td>
				</tr>
			
				<tr class="excptRow">
					<td style="width:50%;border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
					<td style="width:15%;text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
					<td style="width:10%;text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
					<td style="width:13%;text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Current WDV(${asOnDate})</b></td>
				</tr>
				
				<c:forEach  begin="0" end="0" var="i">
				<tr class="firstStepFADblClk">
					<td>
						<input type="text" class="groupName ledgerName" readonly="readonly" style="font-weight: bold;"/>
						<input type="hidden" class="ledgerAuto"/>
						</td>
					<td style="text-align: right;">
						<div class="groupTotDR emptyVal drAmt" style="text-align: right;"></div>
					</td>
					<td style="text-align: right;">
						<div class="groupTotCR emptyVal crAmt" style="text-align: right;"></div>
					</td>
					<td style="text-align: right;">
						<div class="currWDV emptyVal" style="text-align: right;"></div>
					</td>
				</tr>
				</c:forEach>
		</table>
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:99%;" id="fixedAssetTotalTbl" class="highlightTblRw">
			<tr class="" style="background-color: background-color: #afafaf6b;">
				<td style="width : 60.5%; border-top: 1pt solid; border-bottom: 1pt solid;font-weight: bold"><b>Grand Total </b></td>
				<td style=" width: 25%; border-top: 1pt solid; border-bottom: 1pt solid;font-weight: bold">
					<div class="groupTotDR emptyVal" style="width: 300px; padding-right: 0px; text-align: right;"></div>
				</td>
				<td style="width : 25%; border-top: 1pt solid; border-bottom: 1pt solid;font-weight: bold">
					<div class="groupTotCR emptyVal" style="width: 130px; padding-right: 7px; text-align: right;"></div>
				</td>
				<td style="width : 25%; border-top: 1pt solid; border-bottom: 1pt solid;font-weight: bold">
					<div class="currWDVTot emptyVal" style="width: 135px; padding-right: 7px; text-align: right;"></div>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="secondStepFA commonHide" style="display: none;height: 100%;margin-top: 146px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:99%; display: inline-block; overflow-y: scroll; max-height: 450px;"
			id="fixedAssetEntryTable" class="highlightTblRw">
			<tr class="excptRow">
				<td><div>
					<input type="button" value="<< Back" class="secondStepBckBtnFA"/>
				</div></td>
				<td class="" colspan="3" style="text-align: center;">
					<input type="text" readonly="readonly" class="faLedger ledgerName" style="font-size: 1.15em;font-weight: bold;height:20px"/>
					<input type="hidden" class="ledgerAuto"/>
				</td>
				<td style="text-align: right;"><div><input type="button" value="Narration" class="narration narrationShowAll"/> </div></td>
				<td><div><input type="text" class="narrationSearch customInpStyle" placeholder="Enter Narration"/></div></td>
			</tr>
			
			<tr class="excptRow">
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Date</b></td>
				<td width="25%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="18%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher Type</b></td>
				<td width="15%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher No.</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="fixedAssetEntryRow narrationClick">
				<td><input type="text" class="transDate" readonly="readonly"/></td>
				<td><input type="text" class="LedgerName ledgerName" readonly="readonly"/></td>
				<td><input type="text" class="voucherName" readonly="readonly"/></td>
				<td><input type="text" class="transId" readonly="readonly"/></td>
				<td style="text-align: right;">
					<div class="transAmount emptyVal drAmt"></div>
				</td>
				<td style="text-align: right;">
					<div class="transAmount emptyVal crAmt"></div>
				</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>
	
	<div class="thirdStepFA commonHide"  style="display: none;height: 100%;margin-top: 146px;">
	<table border="0" cellpadding="0" cellspacing="0" style="height: 90%; width:99%; display: table; overflow-y: scroll; max-height: 430px;"  
			id="faEntryDtlsTable" class="highlightTblRw">
		<tbody style="display: table; width: 100%;">
			<tr class="excptRow">
				<td colspan="3">
					<div style="float: left;"><input type="button" value="<< Back" class="thirdStepBckBtnFA"/></div>
					<div class="voucherType" style="text-align:right;padding-right:300px;font-weight: bold;"><b > : </b></div>
				</td>
				<!-- <td width="15%" ></td>						
				<td width="15%"></td> -->
				<td colspan="2" style="align:right"><div class="editBtn" style="dispaly:none"><b style="float:right;"><img src="resources/images/edit.png" style="padding-left: 25px; width: 12px; height : 15px;" border="0" title="Edit Record" id="edit"/></b></div></td>
			</tr>
			
			<tr class="excptRow">
				<td width="50%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td colspan="2" width="20%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;padding-right:60px"><b>Balance</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="">
				<td width="50%"><input type="text" class="ledgerName" readonly="readonly"/></td>
				<td width="15%;" style="text-align: right;">
					<div class="drAmt emptyVal"></div>
				</td>
				<td width="15%;" style="text-align: right;">
					<div class="crAmt emptyVal"></div>
				</td>
				<td width="15%;" style="text-align: right;">
					<div class="cumBal emptyVal"></div>
				</td>
				<td style="text-align: left">
					<input type="text" class="cumDrCr" readonly="readonly" style="width:15px;"/>
				</td>
			</tr>
			</c:forEach>
		</tbody>	
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%;" id="thirdStepFAtotal" class="highlightTblRw">
			<tr class="thirdStepFAtotal">
				<td width="50%"><b>Narration :</b><input type="text" class="ledgerNarration" readonly="readonly" style="width: 100%;"/></td>
				<td style="width:15%;text-align: right; width: 15%; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="transAmountDRTotal emptyVal" style="width: 143px; padding-right: 2px;"></span></b>
				</td>
				<td style="width:15%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="transAmountCRTotal emptyVal" style="width: 135px; padding-left: 2px;"></span></b>
				</td>
				<td style="width:20%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid"></td>
			</tr>
		</table>
	</div>
	
	<!-- Fixed Asset Book Report Data -->
	
	<!-- Ledger Report Data -->
	
	<div class="firstStepLedger ledgerRpt commonHide"  style="display: none; height: 100%;margin-top: 147px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:66%;" id="ledgerDrop">
			<!-- <tr style="height:2%"><td colspan="5"><input type="checkbox" class="groupCheckBox" checked="checked"/>&nbsp;&nbsp;&nbsp;&nbsp;<b>Print Zero Balance Data </b></td></tr> -->
			<tr valign="top">
				<td class="" style="width: 2%;"><b>Ledgers	:</b></td>
				<td class="data-holdertd" width="5%;">
					<div>
					<!-- <input  type="hidden" name="ledgerId" id="ledgerId" class=""/> -->
													<%-- <select  name="ledger" id="ledgerAuto" class="sundDRCR form-control js-example-basic-single  ledgerList"  >
									                 	<option value=""><f:message code="label.select"/></option>
									               		<c:forEach items="${}" var="list">
									               			<form:option data-parentmaingrpid="${list.underGroup.underGroup.groupId}" data-maingrpid="${list.underGroup.groupId}" data-grpId="${list.groupId}" value="${list.id}">${list.groupName}</form:option>
									               		</c:forEach>
									                 </select> --%>
						 <select name="ledger" id="ledgerAuto" class="sundDRCR dropdown_Fixed200 ledgerList"/>
						<input type="hidden" name="ledgerId" id="ledgerId" class="data-prop"/> 
					</div>
				</td>
				<!-- <td class="" style="width: 12%;"><b>Period	:</b></td>
				<td width="40%;">
					<div style="float: left;" class="Ledger">
						<input type="text" class="periodFrom dtFormat startdate" style="width: 66px;"/> 
							- 
						<input type="text" class="periodTo dtFormat enddate" style="width: 66px;"/>
					</div>
				</td> -->
				<td class="" style="width: 10%;"><input type="button" class="genLedgerRpt" value="Generate"/></td>
			</tr>
		</table>
	</div>
	
	<div class="secondStepLedger commonHide" style="display: none; height: 100%;margin-top: 146px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 81%; width:99%; display: inline-block; overflow-y: scroll; max-height: 480px;"  
			id="LedgerEntryTable" class="highlightTblRw">
			<tr class="excptRow">
				<td><div><input type="button" value="<< Back" class="secondStepLedgerBackBtn"/></div></td>
				<td style="font-weight: bold;float:left" colspan="2"> 
						<!-- Ledger : -->
					<div><input type="text" readonly="readonly" class="faLedger ledgerName" /></div>
					<div><input type="hidden" readonly="readonly" class="faLedger ledgerAutoId" /></div>
					<input type="hidden" readonly="readonly" style="font-weight: bold;" class="year"/>
					<input type="hidden" readonly="readonly" style="font-weight: bold;" class="month"/>
				</td>
				
				<td><div><input type="button" value="Narration" class="narration narrationShowAll"/></div></td>
				<td><div><input type="text" class="narrationSearch customInpStyle" placeholder="Enter Narration"/></div></td>
				<td colspan="4">
					<div style="float: right;" class="displayGrp"><b> Period : </b> 
						<input type="text" class="periodFrom dtFormat tbDate startdate" style="width: 66px;"/> - <input type="text" class="periodTo dtFormat tbDate enddate" style="width: 66px;"/>
					</div>					
				</td>
			</tr>
			<tr class="excptRow">
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Date</b></td>
				<td style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher No.</b></td>
				<td style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher Type</b></td>
				<td style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td style="width : 20%;text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td colspan="2" style="width : 20%;text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;padding-right:50px"><b>Balance</b></td>				
						
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="secondStepDblClkLedger narrationClick">
				<td width="15%;"><input type="text" class="transDate" readonly="readonly"/></td>
				<td width="25%;">
					<input type="text" class="transId" readonly="readonly"/>
					<input type="hidden" class="accType"/>
				</td>
				<td width="15%;"><input type="text" class="voucherName" readonly="readonly"/></td>
				<td style="width : 10%; text-align: right;"><div class="drAmount emptyVal drAmt"></div></td>
				<td style="width : 10%; text-align: right;"><div class="crAmount emptyVal crAmt"></div></td>
				<td style="width : 20%; text-align: right;"><div class="cumBal closingBal"></div></td>
				<td style="width : 5%;  text-align: left;">
					<div class="">
						<input type="text" class="cumCrDr" style="width:15px; background: transparent;" readonly="readonly" />
					</div>
				</td>
			</tr>
			</c:forEach>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:98%;" id="secondStepLedgtotal" class="highlightTblRw">
			<tr class="ledgerOpeningBal">
				<td width="25%;" style="border-top:1pt solid black;">
					<input type="text" readonly="readonly" class="textStyleNonEdit_300"/>
				</td>
				<td style="width : 28%; border-top:1pt solid black;text-align: right;font-weight: bold;font-size: 1.15em"><b>Opening Balance :</b></td>
				<td style="width : 15.8%; border-top:1pt solid black;"><div class="openingBalanceDR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 16%; border-top:1pt solid black;"><div class="openingBalanceCR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 13%; border-top:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
				<td style="width : 14%; border-top:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
			</tr>
			<tr class="secondStepLedgertotal" style="line-height: 100%;">
				
				<td width="25%;" style="">
					<input type="text" readonly="readonly" class="textStyleNonEdit_300"/>
				</td>
				<td style="width : 28%;text-align: right;font-weight: bold;font-size: 1.15em"><b>Grand Total :</b></td>
				<td style="width : 15.2%; text-align: right;">
					<div class="transAmountDRTotal emptyVal" style="font-weight: bold;"></div>
				</td>
				<td style="width : 11.3%; text-align: right; ">
					<div class="transAmountCRTotal emptyVal" style="padding-left: 2px; font-weight: bold;"></div>
				</td>
				<td style="width : 20%;"></td>
				<!-- <td  width="15%;" style="text-align: right; border-top: 1pt solid; border-bottom: 1pt solid;">
					<div class="balanceTotal emptyVal" style="width: 135px; font-weight: bold;"></div>
				</td> -->
			</tr>
			<tr class="secondStepLedgerttl" style="line-height: 100%;">
				<td width="15%;" style="width : 15%;text-align: left;font-weight: bold;font-size: 1.15em;border-top:1pt solid black;border-bottom:1pt solid black;"><b>Grand Total :</b></td>
				<td width="25%;" style="border-top:1pt solid black;border-bottom:1pt solid black;">
					<input type="text" readonly="readonly" class="textStyleNonEdit_300"/>
				</td>
				<td style="width : 15%;border-top:1pt solid black;border-bottom:1pt solid black;"></td>
				<td style="width : 14.5%; text-align: right;font-weight: bold;font-size: 1.15em;border-top:1pt solid black;border-bottom:1pt solid black;">
					<div class="transAmountDRTotal emptyVal" style="font-weight: bold;"></div>
				</td>
				<td style="width : 9%; text-align: right;font-weight: bold;font-size: 1.15em;border-top:1pt solid black;border-bottom:1pt solid black; ">
					<div class="transAmountCRTotal emptyVal" style="padding-left: 1px; font-weight: bold;"></div>
				</td>
				<td style="width : 20%;border-top:1pt solid black;border-bottom:1pt solid black; "></td>
				<!-- <td  width="15%;" style="text-align: right; border-top: 1pt solid; border-bottom: 1pt solid;">
					<div class="balanceTotal emptyVal" style="width: 135px; font-weight: bold;"></div>
				</td> -->
			</tr>
			<tr class="ledgerClosingBal">
				<td width="25%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;">
					<input type="text" readonly="readonly" class="textStyleNonEdit_300"/>
				</td>
				<td style="width : 28%; border-top:1pt solid black;border-bottom:1pt solid black;text-align: right;font-weight: bold;font-size: 1.15em"><b>Closing Balance :</b></td>
				<td style="width : 15.8%; border-top:1pt solid black;border-bottom:1pt solid black;"><div class="closingBalanceDR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 16%; border-top:1pt solid black;border-bottom:1pt solid black;"><div class="closingBalanceCR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 13%; border-top:1pt solid black;border-bottom:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
				<td style="width : 14%; border-top:1pt solid black;border-bottom:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
			</tr>
		</table>
	</div>
	
	<div class="thirdStepLedgerRpt commonHide"  style="display: none;height: 100%;margin-top: 146px;">
	<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:99%; display: inline-block; overflow-y: scroll; max-height: 415px;"  
			id="ledgerEntryDtlsTable" class="highlightTblRw">
		<tbody style="display: table; width: 100%;">
			<tr class="excptRow">
				<td colspan="3">
					<div style="float: left;"><input type="button" value="<< Back" class="thirdStepLedgerBckBtn"/></div>
					<div class="voucherType" style="text-align:right;padding-right:200px;font-weight: bold;"><b> : </b></div>
				</td>
				<!-- <td width="15%" ></td>	
				<td width="15%" ></td>	 -->
				<td colspan="2" style="align:right"><div class="editBtn" style="display:none"><b style="float:right"><img src="resources/images/edit.png" style="padding-left: 25px; width: 12px; height : 15px;" border="0" title="Edit Record" id="edit"/></b></div></td>
			</tr>
			
			<tr class="excptRow">
				<td width="50%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td colspan="2" width="20%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;padding-right:55px;"><b>Balance</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="">
				<td><input type="text" class="ledgerName" readonly="readonly"/></td>
				<td style="text-align: right;">
					<div class="drAmt emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="crAmt emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="cumBal emptyVal"></div>
				</td>
				<td style="text-align: left">
					<input type="text" class="cumDrCr" style="width:15px" readonly="readonly"/>
				</td>
			</tr>
			</c:forEach>
		</tbody>	
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%;" id="ledgerEntryDtlsTableTtl" class="highlightTblRw">
			<tr class="">
				<td width="50%"><b>Narration :</b><input type="text" class="ledgerNarration" readonly="readonly"/></td>
				<td style="width:14.3%;text-align: right;; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="transAmountDRTotal emptyVal" style="padding-right: 2px;"></span></b>
				</td>
				<td style="width:14.3%;text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="transAmountCRTotal emptyVal" style="padding-left: 2px;"></span></b>
				</td>
				<td colspan="2" style="width : 21%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid"> </td>
				<!-- <td  style="width : 5%;;text-align: right;text-align: right; border-top: 1pt solid; border-bottom: 1pt solid"></td> -->
			</tr>
		</table>
	</div>
	
	<!-- Ledger Report Data End-->
	
	<!-- Ledger Bill-wise Report Data -->
	
	<div class="secondStepLedgerBill commonHide" style="display: none; height: 100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 93%; width:99%; display: inline-block; overflow-y: scroll; max-height: 480px;"  
			id="LedgerBillEntryTable"	class="highlightTblRw">
			<tr class="excptRow">
				<td width="45%;">
					<div style="float: left;"><input type="button" value="<< Back" class="secondStepLedgerBillBackBtn"/></div>
					<div style="float: left;">
						<input type="text" readonly="readonly" class="faLedger ledgerName"/>
						<input type="hidden" readonly="readonly" class="ledgerAuto"/>
					</div>
				</td>
				<td><input class="cleared checkChange" type="radio" name="gender" value="male" checked="checked"/> All </td>
				<td style="width: 18%"><input class="pending checkChange" type="radio" name="gender" value="male"/> Pending Amount </td><td></td><td></td>
			</tr>
			<tr class="excptRow">
				<td width="45%" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Date</b></td>
				<td width="15%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher No.</b></td>
				<td width="15%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher Type</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Bill Amount</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Pending Amount</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="secondStepDblClkLedgeBillr">
				<td width="40%;"><input type="text" class="transDate" readonly="readonly"/></td>
				<td width="15%;">
					<input type="text" class="transId" readonly="readonly"/>
					<input type="hidden" class="transAuto" readonly="readonly"/>
					<input type="hidden" class="ledgerAuto" readonly="readonly"/>
				</td>
				<td width="15%;"><input type="text" class="voucherType" readonly="readonly"/></td>
				<td width="15%;" style="text-align: right;"><div class="transAmnt emptyVal"></div></td>
				<td width="15%;" style="text-align: right;"><div class="pendingAmnt emptyVal"></div></td>
			</tr>
			</c:forEach>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:98.5%;" id="secondStepLedgBilltotal" class="highlightTblRw">
			<tr class="secondStepLedgerBilltotal" style="line-height: 100%;">
				<td width="40%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Grand Total</b></td>
				<td width="15%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;">
					<input type="text" readonly="readonly" class="textStyleNonEdit_300"/>
				</td>
				<td width="15%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"></td>
				<td width="17.8%;" style="text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<div class="transAmountDRTotal emptyVal" style="font-weight: bold;"></div>
				</td>
				<td width="13%;" style="text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<div class="transAmountCRTotal emptyVal" style="padding-left: 2px; font-weight: bold;"></div>
				</td>
			</tr>
		</table>
	</div>
	<div>
	</div>
	<!-- Ledger Bill-wise Report Data End -->
	
	<!-- Day Book Report Data -->
	
	<div class="dayBookRpt commonHide"  style="display: none; height: 100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 99%; width:99%;margin-top: 148px;" id="dayBookDataTable">
			<!-- <tr style="height:2%"><td colspan="7"><input type="checkbox" class="groupCheckBox" checked="checked"/>&nbsp;&nbsp;&nbsp;&nbsp;<b>Print Zero Balance Data </b></td></tr> -->
			<tr valign="top">				
				<td style="width:30%" colspan="2" style="line-height: 10px;">
					<div style="float: left;" class="dayBook"><b> Period : </b> 
						From<input type="text" class="periodFrom date  " style="width: 80px;"/> - 
						To<input type="text" class="periodTo date " style="width: 80px;"/>
					</div>
				</td>
				<td colspan="2" style="width: 10%;"><input type="button" class="genDayBookRpt" value="Generate"/></td>
				<td style="text-align: right;"><div><input type="button" value="Narration" class="narration narrationShowAll"/></div></td>
				<td colspan="3"><div><input type="text" class="narrationSearch customInpStyle" placeholder="Enter Narration"/></div></td>
			</tr>
			<tr style="height: 90%;width:100%">
				<td align="right" colspan="7">
				<div class="firstStepDBDiv"  style="height: 99%; ">
					<div class="" style="height:6%">
						<table border="0" cellpadding="0" cellspacing="0" style="height: 90%; width: 100%;" id="firstStepDBentryDtls">
						<tr style="line-height:6px">
							<td style="width: 16%;border-top: 1px solid black;border-bottom: 1px solid black;"><b>Date</b></td>
							<td style="width: 16%;border-top: 1px solid black;border-bottom: 1px solid black;"><b>Ledger Name</b></td>
							<td style="width: 16%;border-top: 1px solid black;border-bottom: 1px solid black;"><b>Voucher Type</b></td>
							<td style="width: 16%;border-top: 1px solid black;border-bottom: 1px solid black;"><b>Transaction ID</b></td>
							<td style="width: 16%;border-top: 1px solid black;border-bottom: 1px solid black; text-align: right;"><b>Debit</b></td>
							<td style="width: 16%;border-top: 1px solid black;border-bottom: 1px solid black; text-align: right;"><b>Credit</b></td>
							<!-- <td style="text-align: right;padding-right:40px"><b>Cum Balance</b></td>
							<td></td> -->
						</tr>
						</table>
					</div>
					<div class="dayBookEntryLedger" style="">
						<table border="0" cellpadding="0" cellspacing="0" style="height: 90%; width: 100%; display: inline-block; overflow-y: scroll; max-height: 350px; line-height: 1px;"
							id="dayBookLedgerTbl" class="highlightTblRw">
						<tr class="displayDayBookData dblClkDBRow narrationClick">
							<td style="width: 8%;"><input type="text" class="transDate dateFormate emptyVal" readonly="readonly"/></td>
							<td style="width: 30%;">
								<input type="text" class="ledgerName emptyVal" readonly="readonly"/>
								<input type="hidden" class="ledgerAutoId emptyVal" />
							</td>
							<td style="width: 10%;"><input type="text" class="voucherType emptyVal" readonly="readonly"/></td>
							<td style="width: 10%;">
								<input type="text" class="transId" readonly="readonly"/>
								<input type="hidden" class="transAutoId emptyVal" />
							</td>
							<td style="width: 13%;text-align: right;"><div class="drAmt emptyVal"></div>
							</td>
							<td style="width: 13%;text-align: right;"><div class="crAmt emptyVal"></div></td>
							<!-- <td style="text-align: right;"><div class="cumBal emptyVal"></div></td>
							<td style="text-align: left;">
								<input type="text" class="cumDrCr emptyVal" readonly="readonly"  style="width: 15px;"/>
							</td> -->
						</tr>
						</table>
					</div>			
				</div>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="firstStepDayBook commonHide" style="display: none; height: 100%;margin-top: 146px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:100%; display: inline-block; overflow-y: scroll; max-height: 415px;"  
			id="DBEntryDtls" class="highlightTblRw">
		<tbody style="width: 100%; display: table;">
			<tr class="excptRow">
				<td colspan="3">
					<div style="float: left;"><input type="button" value="<< Back" class="firstStepDBBckBtn"/></div>
					<div class="voucherType" style="text-align:right;padding-right:250px;font-size:1.15em;font-weight: bold;height:20px;"><b> : </b></div>
				</td>				
				<td colspan="2" style="align:right"><div class="editBtn" style=""><b style="float:right"><img src="resources/images/edit.png" style="padding-left: 25px; width: 12px; height : 15px;" border="0" title="Edit Record" id="edit"/></b></div></td>
			</tr>
			
			<tr class="excptRow">
				<td width="50%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td colspan="2" width="20%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;padding-right: 45px;"><b>Balance</b></td>
			</tr>
			<c:forEach  begin="0" end="0" var="i">
			<tr class="">
				<td><input type="text" class="ledgerName" readonly="readonly"/></td>
				<td style="text-align: right;">
					<div class="drAmt emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="crAmt emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="cumBal emptyVal"></div>
				</td>
				<td style="text-align: left" style="width:5%">
					<input type="text" class="cumDrCr" style="width:14px !important;padding-left:0px;padding-right:0px" readonly="readonly"/>
				</td>
			</tr>
			</c:forEach>
		</tbody>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%;" id="DBEntryDtlsTableTtl" class="highlightTblRw">
			<tr class="">
				<td style="width:50%"><b>Narration :</b><input type="text" class="ledgerNarration" readonly="readonly"/></td>
				<td style="width:14.3%;text-align: right;; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="transAmountDRTotal emptyVal" style="padding-right: 2px;"></span></b>
				</td>
				<td style="width:14.3%;text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="transAmountCRTotal emptyVal" style="padding-left: 2px;"></span></b>
				</td>
				<td colspan="2" style="width : 21%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid"> </td>
				<!-- <td  style="text-align: right;text-align: right; border-top: 1pt solid; border-bottom: 1pt solid"></td> -->
			</tr>
		</table>
	</div>
	
	<!-- Daybook Report Data Block end! -->
	
	<!-- Depreciation Report Data -->
	
	<div class="firstStepDepreciation depreciationRpt commonHide"  style="display: none; height: 100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:99%; display: inline-block; overflow-y: scroll; max-height: 480px;"  
			id="firstStepDeprecEntryTable"	class="highlightTblRw">
			<tr class="excptRow">
				<td width="9%;">
					<div style="float: left;"><input type="button" value="<< Back" class="firstStepDeprecBckBtn"/></div>
				</td>
				<td></td><td></td>
				<td>
					<div style="float: left;"></div>
				</td>
				<td>
					<!-- <div style="float: left;"><input type="text" readonly="readonly" class="ledgerName"/></div> -->
				</td>
			</tr>
			<tr class="excptRow">
				<td width="12%;" style="text-align: left;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Ledger Name</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Prev. WDV</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Opening Dep.</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Opening WDV.</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Current Dep. Amt</b></td>
				<td width="15%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Current WDV(${asOnDate})</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Dep. Amt</b></td>
				<!-- <td width="12%;" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Cummulative Bal</b></td> -->
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="firstStepDblClkDeprec">
				<td width="12%;">
					<input type="text" class="ledgerName" readonly="readonly"/>
					<input type="hidden" class="ledgerAuto" readonly="readonly"/>
				</td>
				<td width="12%;" style="text-align: right;"><div class="prevWdv emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="openingDep emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="openingWdv emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="curYrDep emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="curWdv emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="deprAmnt emptyVal"></div></td>
				
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class="secondStepDepreciation commonHide" style="display: none; height: 100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:99%; display: inline-block; overflow-y: scroll; max-height: 480px;"  
			id="depreciationEntryTable"	class="highlightTblRw">
			<tr class="excptRow">
				<td width="20%;">
					<div style="float: left;"><input type="button" value="<< Back" class="secondStepDepreciationBckBtn"/></div>
				</td>
				<td></td>
				<td>
					<div style="float: left;"></div>
				</td>
				<td colspan="3">
					<div style="float: left;"><input type="text" readonly="readonly" class="ledgerName" style="font-weight: bold;font-size: 1em;"/></div>
				</td>
			</tr>
			<tr class="excptRow">
				<td width="12%;" style="text-align: left;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Trans Date</b></td>
				<td width="12%;" style="text-align: left;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Trans Id</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Prev. WDV</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Opening Dep.</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Opening WDV.</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Current Dep. Amt</b></td>
				<td width="15%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Current WDV(${asOnDate})</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Dep. Amt</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="secondStepDblClkDeprec">
				<td width="12%;"><input type="text" class="transDate" readonly="readonly"/></td>
				<td width="12%;">
					<input type="text" class="transId" readonly="readonly"/>
					<input type="hidden" class="transAuto" readonly="readonly"/>
				</td>
				<td width="12%;" style="text-align: right;"><div class="prevWdv emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="openingDep emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="openingWdv emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="curYrDep emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="curWdv emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="deprAmnt emptyVal"></div></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class="thirdStepDepreciation commonHide" style="display: none; height: 100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:99%; display: inline-block; overflow-y: scroll; max-height: 480px;"  
			id="depreciationCCTable" class="highlightTblRw">
			<tr class="excptRow">
				<td width="15%;">
					<div style="float: left;"><input type="button" value="<< Back" class="thirdStepDepreBckBtn"/></div>
				</td>
				<td></td>
				<td>
					<div style="float: left;"></div>
				</td>
				<td colspan="3">
					<div style="float: left;"><input type="text" readonly="readonly" class="transId" style="font-weight: bold;font-size: 1em;"/></div>
				</td>
			</tr>
			<tr class="excptRow">
				<td width="12%;" style="text-align: left;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Cost Center</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Prev. WDV</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Opening Dep.</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Opening WDV.</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Current Dep. Amt</b></td>
				<td width="15%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Current WDV(${asOnDate})</b></td>
				<td width="12%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Dep. Amt</b></td>
				<!-- <td width="15%;" style="text-align: right;border-bottom:1pt solid black;border-top:1pt solid black;"><b>Cum. Balance</b></td> -->
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="thirdStepDblClkDeprec">
				<td width="12%;">
					<input type="text" class="costCenterName" readonly="readonly"/>
					<input type="hidden" class="costCenterId" readonly="readonly"/>
				</td>
				<td width="12%;" style="text-align: right;"><div class="prevWdv emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="openingDep emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="openingWdv emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="curYrDep emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="curWdv emptyVal"></div></td>
				<td width="12%;" style="text-align: right;"><div class="deprAmnt emptyVal"></div></td>
				<!-- <td width="12%;" style="text-align: right;"><div class="closingBal emptyVal"></div>
					<input type="text" class="cumDrCr" style="width:15px;" readonly="readonly"/>
				</td> -->
			</tr>
			</c:forEach>
		</table>
	</div>
	<div>
	</div>
	
	<!-- Depreciation Report Data End -->
	
	<!-- Bank Reconciliation Report Data  -->
	
	<div class="firstStepBRS commonHide"  style="display: none; height: 100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:52%;">
			<tr style="height: 2%;">
				<td width="100%">
					<div style="float: left; width: 80px;"><input type="button" value="<< Back" class="firstStepBckBtnBRS"/></div>
					<div style="float: left;" class="BRS"><b> Period : </b> 
						<input type="text" class="periodFrom dtFormat startdate" style="width: 66px;"/> - <input type="text" class="periodTo dtFormat enddate" style="width: 66px;"/>
					</div>
					<div style="float: left; padding-left: 20px; width: 100px; display: none;"><b>Year</b>
						<input type="text" class="entryYearBRS" placeholder="yyyy"></input>
					</div>
					<div class="genBRS" style=" float: left; padding-left: 100px;">
						<input type="hidden" class="ledgerAuto"/>
						<input type="hidden" class="ledgerName"/>
						<input type="button" class="genReportBRS" value="Generate"/>
					</div>
				</td>
			</tr>
			<tr  style="height: 2%;"><td width= "100%"><div class="hl"></div></td></tr>
			<tr style="height: 96%;"><td align="right"></td></tr>
		</table>
	</div>
	
	<div class="secondStepBRS commonHide" style="display: none;height: 100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 85%; width:100%; display: inline-block; overflow-y: scroll; max-height: 450px;"
			id="brsEntryTable" class="highlightTblRw">
			<tr class="excptRow">
				<td><div>
					<input type="button" value="<< Back" class="secondStepBckBtnBRS"/>
					<input type="hidden" class="ledgerAuto"/>
				</div></td>
				<td colspan="3" ><input type="text" readonly="readonly" class="brsLedger notRefBRS" style="text-align: right;font-weight: bold"/></td>
				<td  colspan="4" style="text-align: right;"><input type="button" class="brsBtn noBRS" value="All Bank Transactions"/></td>
				<!-- <td></td><td></td><td></td><td></td><td></td><td></td><td></td> -->
			</tr>
			
			<tr class="excptRow">
				<td style="width:8%; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Date</b></td>
				<td style="width:30%; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td style="width:8%; border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher Type</b></td>
				<td style="width:8%; border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Instrument No.</b></td>
				<td style="width:8%; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Instrument&nbsp;Date</b></td>
				<td style="width:8%; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Bank Date</b></td>
				<td style="width:15%; text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td style="width:15%; text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="brsEntryRow">
				<td><input type="text" class="transDate" readonly="readonly"/></td>
				<td><input type="text" class="LedgerName ledgerName" readonly="readonly"/></td>
				<td>
					<input type="text" class="voucherName" readonly="readonly"/>
					<input type="hidden" class="transId" readonly="readonly"/>
					<input type="hidden" class="periodFrom" readonly="readonly"/>
					<input type="hidden" class="periodTo" readonly="readonly"/>
				</td>
				<td><input type="text" class="instmntNo" readonly="readonly"/></td>
				<td><input type="text" class="instmntDate" readonly="readonly"/></td>
				<td><input type="text" class="bankDate"/></td>
				<td style="text-align: right;">
					<div class="transAmount emptyVal drAmt"></div>
				</td>
				<td style="text-align: right;">
					<div class="transAmount emptyVal crAmt"></div>
				</td>
			</tr>
			</c:forEach>
		</table>
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%; line-height: 10px;" id="brsEntryTableTtl" class="highlightTblRw">
			<tr class="">
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black; text-align: right;"><b>Balance as per company Book :</b></td>
				<td style="width: 12%; border-top:1pt solid black;"><div class="companyBkDR emptyVal" style="text-align: right;"></div></td>
				<td style="width: 14.5%; border-top:1pt solid black;"><div class="companyBkCR emptyVal" style="text-align: right; padding-right: 5px;"></div></td>
			</tr>
			<tr class="">
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black; text-align: right;"><b>Amount not reflected in Bank :</b></td>
				<td style="border-top:1pt solid black;"><div class="bankRefDR emptyVal" style="text-align: right;"></div></td>
				<td style="border-top:1pt solid black;"><div class="bankRefCR emptyVal" style="text-align: right; padding-right: 5px;"></div></td>
			</tr>
			<tr class="bankBkAMountTr">
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black; text-align: right;"><b>Balance as per Bank Book :</b></td>
				<td style="border-top:1pt solid black;"><div class="bankBalDR emptyVal" style="text-align: right;"></div></td>
				<td style="border-top:1pt solid black;"><div class="bankBalCR emptyVal" style="text-align: right; padding-right: 5px;"></div></td>
			</tr>
		</table>
		
	</div>
	
	<div class="thirdStepBRS commonHide" style="display: none;height: 100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 86%; width:100%; display: inline-block; overflow-y: scroll; max-height: 450px;"
			id="brsEntryDtlsTable" class="highlightTblRw">
			<tr class="excptRow">
				<td><div>
					<input type="button" value="<< Back" class="thirdStepBckBtnBRS"/>
					<input type="hidden" class="ledgerAuto"/>
				</div></td>
				<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			</tr>
			
			<tr class="excptRow">
				<td style="width:8%; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Date</b></td>
				<td style="width:30%; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td style="width:8%; border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher Type</b></td>
				<td style="width:8%; border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Instrument No.</b></td>
				<td style="width:8%; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Instrument&nbsp;Date</b></td>
				<td style="width:8%; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Bank Date</b></td>
				<td style="width:15%; text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td style="width:15%; text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="brsEntryRow">
				<td><input type="text" class="transDate" readonly="readonly"/></td>
				<td><input type="text" class="LedgerName ledgerName" readonly="readonly"/></td>
				<td><input type="text" class="voucherName" readonly="readonly"/></td>
				<td><input type="text" class="instmntNo" readonly="readonly"/></td>
				<td><input type="text" class="instmntDate" readonly="readonly"/></td>
				<td><input type="text" class="bankDate" readonly="readonly"/></td>
				<td style="text-align: right;">
					<div class="transAmount emptyVal drAmt"></div>
				</td>
				<td style="text-align: right;">
					<div class="transAmount emptyVal crAmt"></div>
				</td>
			</tr>
			</c:forEach>
			
		</table>
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%; line-height: 10px;" id="brsEntryDtlsTableTtl" class="highlightTblRw">
			<tr class="">
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style=" border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black;"></td>
				<td style="border-top:1pt solid black; text-align: right;"><b>Grand Total :</b></td>
				<td style="width : 12%; border-top:1pt solid black;"><div class="companyBkDR emptyVal" style="text-align: right;"></div></td>
				<td style="width : 12%; border-top:1pt solid black;"><div class="companyBkCR emptyVal" style="text-align: right; padding-right: 5px;"></div></td>
			</tr>
		</table>
		
	</div>
	
	<!-- Bank Reconciliation Report Data End -->
	
	<!-- Trial Balance, Profit and Loss and Balance Sheet Reports Data  Start -->
	
	<div class="trialBalRpt commonHide" style="display: none; height: 100%; margin-top: 146px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width: 60%;" id="trialBalRptFirstTbl">
			<!-- <tr><td width="2%"><input type="checkbox" class="groupCheckBox" checked="checked"/><b>Print Zero Balance Data </b></td></tr> -->
			<tr style="height: 2%;">
				<td width="100%">					
					<div style="float: left;" class="BRS"><b> Period : </b> 
						From<input type="text" class="periodFrom date " style="width: 80px;"/> -To <input type="text" class="periodTo date" style="width: 80px;"/>
					</div>
					<div class="" style=" float: left; padding-left: 70px;">
						<input type="radio" name="gender" value="SUMMARY" checked="checked" class="checked selected"> Summary</input>
						<input type="radio" name="gender" value="DETAIL" class="checked"> Details</input>
						<input type="radio" name="gender" value="LEDGER" class="checked"> Ledger Wise </input>
					</div>
					<div class="" style=" float: left; padding-left:  50px;">
						<input type="hidden" class="ledgerAuto"/>
						<input type="button" class="genReportTB" value="Generate"/>
					</div>
				</td>
			</tr>
			<tr  style="height: 2%;"><td width= "100%"><div class="hl"></div></td></tr>
			<tr style="height: 96%;"><td align="right"></td></tr>
		</table>
	</div>
	
	<div class="trialBalSum commonHide"  style="display: none; height: 100%;overflow-y: scroll;margin-top: 146px;">
		<div style="width:100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%;"  
			id="firstStepTBTable" class="highlightTblRw">
			<tr class="excptRow">
				<td>
					<div style="float: left;"><input type="button" value="<< Back" class="firstStepBackBtnTB"/></div>
					<div style="float: left; width: 90%;">
						<div class="reportNames" style="padding-left: 100px; font-weight: bold; float: left; width: 20%;">Trial Balance</div>
						<div class="rptPeriods" style="float: left;"></div>
					</div>
				</td>
				<td><div style="float: left;"><input type="button" value="Details" class="detailsBtn" style="display: none;"/></div></td>
				<td></td>
			</tr>
			
			<tr class="excptRow">
				<td width="70%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td  class = 'bll' width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Liabilities</b></td>
				<td  class = 'bll' width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Assets</b></td>
			</tr>
			<tr class="excptRow">
				<td width="70%;" class="txtlabelHead" style="font-weight:bold;font-size:1.3em;font-style:italic;text-decoration:underline;display:block"></td>
				<td width="15%"></td>
				<td width="15%"></td>
			</tr>
			
			<c:forEach begin="0" end="0" var="i">
			<tr class="firstStepDblClkTB">
				<td>
					<input type="text" class="ledgerName groups subGroups" readonly="readonly"/>
					<input type="hidden" class="ledgerId"/>
					<input type="hidden" class="ledgerAuto"/>
					<input type="hidden" class="accType"/>
				</td>
				<td style="text-align: right;">
					<div class="drAmount subGroupDr groupDr emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="crAmount subGroupCr groupCr emptyVal"></div>
				</td>
			</tr>
			</c:forEach>			
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%;" id="firstStepTBTableGrossTotal" class="highlightTblRw">	
			<tr class="firstSteptotalTB">
				<td style="width : 70%;font-weight: bold;font-size:1.15em ;display:block" class="textLbl">					
					<b class="hideForOther" style="float: left;"></b>
					<b class="hideForOther" style="float: left;"><span class="" style="width: 120px; padding-top: 3px;"></span></b>
					<b class="hideForOther" style="float: left;"><span class="" style="width: 25px;"></span></b>
					<b style=""></b>
				</td>
				<td></td>
				<td style="text-align: right; width: 15%; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="drAmountTtl emptyVal" style="width: 145px; padding-right: 2px;"></span></b>
				</td>
				<td style="width : 15%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid;">
					<b><span class="crAmountTtl emptyVal" style="width: 135px; padding-left: 5px !important;"></span></b>
				</td>
			</tr>
		</table>
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%;"  
			id="firstStepTBTableIndirect" class="highlightTblRw">
			<tr class="excptRow">
				<td width="70%;" class="txtlabelHead" style="font-weight:bold;font-size:1.3em;font-style:italic;text-decoration:underline;display:block"></td>
				<td width="15%"></td>
				<td width="15%"></td>
			</tr>
			<c:forEach begin="0" end="0" var="i">
			<tr class="" style="width:100%">
				<td width="70%;">
					<input type="text" class="ledgerName groups subGroups" readonly="readonly"/>
					<input type="hidden" class="ledgerId"/>
					<input type="hidden" class="ledgerAuto"/>
					<input type="hidden" class="accType"/>
				</td>
				<td width="15%" style="text-align: right;">
					<div class="drAmount subGroupDr groupDr emptyVal"></div>
				</td>
				<td width="15%" style="text-align: right;">
					<div class="crAmount subGroupCr groupCr emptyVal"></div>
				</td>
				<td></td>
			</tr>
			</c:forEach>			
		</table><!-- </div>		
		<div  style="width:99%; display: inline-block;"> -->
		<table border="0" cellpadding="0" cellspacing="0"  style="width:100%;" id="firstStepTBTableTotalpl" class="highlightTblRw">
			<tr class="profitLossAcc" style="display:none;">
				<td style="width : 70%; padding-right:100px;font-weight: bold;font-size:1.15em;display:block" class="textLblpl">
					<b class="hideForOther" style="float: left;"></b>
					<b class="hideForOther" style="float: left;"><span class="" style="width: 120px; padding-top: 3px;"></span></b>
					<b class="hideForOther" style="float: left;"><span class="" style="width: 25px;"></span></b>
					<b style=""></b>
					<input type="text" class="" readonly="readonly"/>
				</td>
				<td style="text-align: right; width: 15%; border-top: 1pt solid;" class="brdrBtm">
					<b><span class="drAmountpl emptyVal" style="width: 135px;  padding-right: 2px;"></span></b>
				</td>
				<td style="width : 15%; text-align: right; border-top: 1pt solid;" class="brdrBtm">
					<b><span class="crAmountpl emptyVal" style="width: 135px; padding-left: 8px;" ></span></b>
				</td>
			</tr>
			<tr class="firstSteptotalTBpl">
				<td style="width : 70%; padding-right:100px;font-weight: bold;font-size:1.15em;display:block" class="textLbl">
					<b class="hideForOther" style="float: left;"></b>
					<b class="hideForOther" style="float: left;"><span class="" style="width: 120px; padding-top: 3px;"></span></b>
					<b class="hideForOther" style="float: left;"><span class="" style="width: 25px;"></span></b>
					<b style=""></b>
					<input type="text" class="" readonly="readonly"/>
				</td>
				<td style="text-align: right; width: 15%; border-top: 1pt solid;" class="brdrBtm">
					<b><span class="drAmountTtlpl emptyVal" style="width: 135px;  padding-right: 2px;"></span></b>
				</td>
				<td style="width : 15%; text-align: right; border-top: 1pt solid;" class="brdrBtm">
					<b><span class="crAmountTtlpl emptyVal" style="width: 135px; padding-left: 8px;" ></span></b>
				</td>
			</tr>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%;" id="firstStepTBTableTotal" class="highlightTblRw">	
			<tr class="firstSteptotalTB">
				<td style="width : 70%; font-weight: bold;font-size:1.15em" class="textLbl">					
					<b class="hideForOther" style="float: left;"></b>
					<b class="hideForOther" style="float: left;"><span class="" style="width: 120px; padding-top: 3px;"></span></b>
					<b class="hideForOther" style="float: left;"><span class="" style="width: 25px;"></span></b>
					<b style=""></b>
					<input type="text" class="" readonly="readonly"/>
				</td>
				<td></td><td></td>
				<td style="text-align: right; width: 15%; border-top: 1pt solid; border-bottom: 1pt solid !important">
					<b><span class="drAmountTtl emptyVal" style="width: 135px; padding-right: 2px;"></span></b>
				</td>
				<td style="width : 15%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid !important">
					<b><span class="crAmountTtl emptyVal" style="width: 135px; padding-left: 8px;"></span></b>
				</td>
			</tr>
		</table>
		</div>
	</div>
	<div class="secondStepDetls commonHide"  style="display: none; height: 100%;">
	<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:99%; display: inline-block; overflow-y: scroll; max-height: 430px;"  
			id="secondStepDetlsTable" class="highlightTblRw">
			<tr class="excptRow">
				<td>
					<div style="float: left;"><input type="button" value="<< Back" class="secondStepDetlsBB"/></div>
					<div style="float: left; width: 90%;">
						<div class="reportNames" style="padding-left: 100px; font-weight: bold; float: left; width: 20%;">Trial Balance</div>
						<div class="rptPeriods" style="float: left;"></div>
					</div>
				</td>
				<td></td>
				<td></td><td></td><td></td><td></td>
			</tr>
			
			<tr class="excptRow">
				<td width="70%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Liabilities</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Assets</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="secondStepDblClkTB">
				<td><input type="text" class="ledgerName groups subGroups" readonly="readonly"/></td>
				<td style="text-align: right;">
					<div class="drAmount subGroupDr groupDr emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="crAmount subGroupCr groupCr emptyVal"></div>
				</td>
			</tr>
			</c:forEach>
			
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:96%;" id="secondStepDblClkTblTtl" class="highlightTblRw">
			<tr class="secondSteptotalTB">
				<td style="text-align: right; width : 70%;"><b>Total :</b><input type="text" class="" readonly="readonly"/></td>
				<td style="text-align: right; width: 15%; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="drAmountTtl emptyVal" style="width: 143px; padding-right: 2px;"></span></b>
				</td>
				<td style="width : 15%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="crAmountTtl emptyVal" style="width: 135px; padding-left: 8px;"></span></b>
				</td>
			</tr>
		</table>
	</div>
	
	<!-- Trial Balance, Profit and Loss and Balance Sheet Reports Data  End -->
	
	<!--Display Group Reports Data  Start -->
	
	<div class="groupDisplay commonHide"  style="display: none; height: 100%;margin-top: 137px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 2%; width:99%;" id="" class="">
			<tr>
				<td width="25%"><h2>List of Groups</h2>	</td>
				<!-- <td width="2%"><input type="checkbox" class="groupCheckBox" checked="checked"/></td>
				<td><b>Print Zero Balance Data </b></td> -->
			</tr>
			<tr style="height: 2%;">
				<td width="">
					<div style="float: left;" class="GRPSUBGRP"><b> Period : </b> 
						<input type="text" class="periodFrom date" style="width: 80px;"/> - 
						<input type="text" class="periodTo date" style="width: 80px;"/>
					</div>
				</td>
			</tr>
			<tr><td>
				<input type="text" id="myInput" onkeyup="$(this).myFunction();" placeholder="Search for names.." title="Type in a name" style="width: 200px; color: white; 
					background-color: #747474;"/>
			</td></tr>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="height: 80%; width:99%; display: inline-block; overflow-y: scroll; max-height: 422px;"  
			id="groupDisplayTable" class="">
			<tr><td>
				<ul id="myUL" style="border: 1px solid black; width: 200px; max-height: 345px; overflow-y: scroll;">
					<li id="PRIMARY" onclick="$(this).getGroupRelatedData();"><a href="#"><b>Primary</b></a></li>
				</ul>
			</td></tr>
		</table>
	</div>
	
	<div class="firstStepGrp commonHide" style="display: none;height: 100%;margin-top: 146px;" id="firstTwoDisplay">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 88%; width:100%; display: inline-block; overflow-y: scroll;
			max-height: 430px;" id="displayGrpTbl" class="highlightTblRw">
				<tr class="excptRow">
				<td>
					<div style="float: left;">
						<input type="button" value="<< Back" class="firstStepGrpDispl"/>
						<input type="hidden" class="groupId"/>
					</div>
					<div class=""><b style="padding-left: 10px;"></b></div>
					
				</td>
				<td colspan="2">
					<div style="float: right;" class="displayGrp"><b> Period : </b> 
						<input type="text" class="periodFromGrp dtFormat startdate" style="width: 66px;"/> - <input type="text" class="periodToGrp dtFormat enddate" style="width: 66px;"/>
					</div>					
				</td>
				<td></td>
				</tr>
			
				<tr class="excptRow">
					<td width="70%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
					<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
					<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				</tr>
				
				<c:forEach  begin="0" end="0" var="i">
				<tr class="firstStepGrpDsply">
					<td>
						<input type="text" class="groupName subGroupName" readonly="readonly" style="font-weight: bold;"/>
						<input type="hidden" class="ledgerAuto"/>
						<input type="hidden" class="ledgerId"/>
						<input type="hidden" class="accType"/>
					</td>
					<td style="text-align: right;">
						<div class="groupTtlAmountDR emptyVal" style="text-align: right;"></div>
					</td>
					<td style="text-align: right;">
						<div class="groupTtlAmountCR emptyVal" style="text-align: right;"></div>
					</td>
				</tr>
				</c:forEach>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:98.5%;" id="displayGrpTblTtl">
			<tr class="highlight">
				<td style="text-align: right; width : 70%; border-top: 1pt solid; border-bottom: 1pt solid">
					<b>Total :</b><input type="text" class="" readonly="readonly"/>
				</td>
				<td style="text-align: right; width: 15%; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="grandDrAmount emptyVal" style="width: 145px; padding-right: 2px;"></span></b>
				</td>
				<td style="width : 15%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="grandCrAmount emptyVal" style="width: 135px; padding-left: 8px;"></span></b>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="secondStepGrp commonHide" style="display: none;height: 100%;margin-top: 146px;"  id="stepTwoDisplay">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 88%; width:100%; display: inline-block; overflow-y: scroll;
			max-height: 430px;" id="displayGrpTblSec" class="highlightTblRw">
				<tr class="excptRow">
					<td colspan="3">
						<div style="float: left;">
							<input type="button" value="<< Back" class="secondStepGrpDispl"/>
							<input type="hidden" class="groupId"/>
						</div>
						<div class=""><b style="padding-left: 10px;"></b></div>
					</td>
					<td></td>
				</tr>
			
				<tr class="excptRow">
					<td width="70%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
					<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
					<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				</tr>
				
				<c:forEach  begin="0" end="0" var="i">
				<tr class="firstStepGrpDsply">
					<td>
						<input type="text" class="groupName subGroupName" readonly="readonly" style="font-weight: bold;"/>
						<input type="hidden" class="ledgerAuto"/>
						<input type="hidden" class="ledgerId"/>
						<input type="hidden" class="accType"/>
					</td>
					<td style="text-align: right;">
						<div class="groupTtlAmountDR emptyVal" style="text-align: right;"></div>
					</td>
					<td style="text-align: right;">
						<div class="groupTtlAmountCR emptyVal" style="text-align: right;"></div>
					</td>
				</tr>
				</c:forEach>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:98%;" id="displayGrpTblSecTtl">
			<tr class="highlight">
				<td style="text-align: right; width : 70%; border-top: 1pt solid; border-bottom: 1pt solid">
					<b>Total :</b><input type="text" class="" readonly="readonly"/>
				</td>
				<td style="text-align: right; width: 15%; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="grandDrAmount emptyVal" style="width: 143px; padding-right: 2px;"></span></b>
				</td>
				<td style="width : 15%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="grandCrAmount emptyVal" style="width: 135px; padding-left: 8px;"></span></b>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="thirdStepDisplyGrpDiv commonHide"  style="display: none;height: 100%;margin-top: 146px;">
		<table border="0" cellpadding="0" cellspacing="0" style=" width:100%; line-height: 10px;" id="thirdStepDisplyGrpTbl">
			<tr style="height: 20%;">
				<td colspan="4">
					<input type="hidden" class="ledgerId"/> 
					<input type="hidden" class="ledgerAuto"/> 
					<input type="hidden" class="ledgerName"/>
					<input type="hidden" class="groupId"/>
					<input type="hidden" class="accType"/>
					<div style="float: left;"><input type="button" value="<< Back" class="thirdStepDisplyGrpTblBck"/></div>
					<div style="float: right;">
						<input type="button" class="ageWise" value="Age-wise" style="display: none;"/>
						<input type="button" class="billWise" value="Bill-wise" id="ledgerBillWiseRpt"/>
					</div>
				</td>
			</tr>
			<tr style="height: 2%;">
				<td style="width:40%">
					<div style="float: left; width: 49%"><b>Year</b>
						<input type="text" value="2018" class="entryYearDispGrp"></input>
					</div>
				</td>
				<td style="width:20%"><div class="" style="float: right;"><b>Debit</b></div></td>
				<td style="width:20%"><div class="" style="float: right;"><b>Credit</b></div></td>
				<td style="width:20%"><div class="" style="float: right;"><b>Closing Balance</b></div></td>
			</tr>
			<tr><td width= "100%" colspan="4"><div class="hl"></div></td></tr>
			<tr style="height: 100%;">
			<td colspan="4">
				<table border="0" cellpadding="0" cellspacing="0" style="height: 50%; width:100%;" class="highlightTblRw">
					<tr class="openBalHideForPl">
						<td style="width:40%"><div  style="float: left; width: 49%; text-decoration: underline;">Opening Balance</div></td>
						<td style="width:20%"><div class="" style="float: right;"></div></td>
						<td style="width:20%"><div class="" style="float: right;padding-right:65px;"></div></td>
						<td style="width:20%"><div class="openingBal " style="float: right; "></div> </td>
					</tr>
					<tr class="thirdStepDisplyGrp" id="1">
						<td style="width:40%"><div style="float: left; width: 49%"><b>January</b></div></td>
						<td style="width:20%"><div class="januarydebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="januarycredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="januarycb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="thirdStepDisplyGrp" id="2">
						<td style="width:40%"><div style="float: left; width: 49%"><b>February</b></div></td>
						<td style="width:20%">	<div class="februarydebit" style="float: right;"></div></td>
						<td style="width:20%">	<div class="februarycredit" style="float: right;"></div></td>
						<td style="width:20%">	<div class="februarycb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="thirdStepDisplyGrp" id="3">
						<td style="width:40%"><div style="float: left; width: 49%"><b>March</b></div></td>
						<td style="width:20%"><div class="marchdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="marchcredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="marchcb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="thirdStepDisplyGrp" id="4">
						<td style="width:40%"><div style="float: left; width: 49%"><b>April</b></div></td>
						<td style="width:20%"><div class="aprildebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="aprilcredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="aprilcb amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="thirdStepDisplyGrp" id="5">
						<td style="width:40%"><div style="float: left; width: 49%"><b>May</b></div></td>
						<td style="width:20%"><div class="maydebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="maycredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="maycb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="thirdStepDisplyGrp" id="6">
						<td style="width:40%"><div style="float: left; width: 49%"><b>June</b></div></td>
						<td style="width:20%"><div class="junedebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="junecredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="junecb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="thirdStepDisplyGrp" id="7">
						<td style="width:40%"><div style="float: left; width: 49%"><b>July</b></div></td>
						<td style="width:20%"><div class="julydebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="julycredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="julycb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="thirdStepDisplyGrp" id="8">
						<td><div style="float: left; width: 49%"><b>August</b></div></td>
						<td style="width:20%"><div class="augustdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="augustcredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="augustcb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="thirdStepDisplyGrp" id="9">
						<td style="width:40%"><div style="float: left; width: 49%"><b>September</b></div></td>
						<td style="width:20%"><div class="septemberdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="septembercredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="septembercb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="thirdStepDisplyGrp" id="10">
						<td style="width:40%"><div style="float: left; width: 49%"><b>October</b></div></td>
						<td style="width:20%"><div class="octoberdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="octobercredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="octobercb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="thirdStepDisplyGrp" id="11">
						<td style="width:40%"><div style="float: left; width: 49%"><b>November</b></div></td>
						<td style="width:20%"><div class="novemberdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="novembercredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="novembercb amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="thirdStepDisplyGrp" id="12">
						<td style="width:40%"><div style="float: left; width: 49%"><b>December</b></div></td>
						<td style="width:20%"><div class="decemberdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="decembercredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="decembercb amtForCls" style="float: right;"></div></td>
					</tr>
					
				</table>
			</td>
			</tr>
			
			<!-- <tr style="height: 18%;"><td colspan="4" class="hl"></td></tr> -->
			
			<tr class="thirdStepDisplyGrpTotal" id="">
				<td style="width:40%;border-top: 1px solid black;border-bottom: 1px solid black;"><div  style="float: left; width: 49%"><b>Grand Total</b></div></td>
				<td style="width:20%;border-top: 1px solid black;border-bottom: 1px solid black;"><div class="debitTotal" style="float: right; font-weight: bold;"></div></td>
				<td style="width:20%;border-top: 1px solid black;border-bottom: 1px solid black;"><div class="creditTotal" style="float: right; font-weight: bold;"></div></td>
				<td style="width:20%;border-top: 1px solid black;border-bottom: 1px solid black;"><div class="closingBal" style="float: right; font-weight: bold;"></div>
					<div class="closingBalHdn" style="display: none;"></div></td>
			</tr>
			
			<!-- <tr style="height: 18%;"><td colspan="4" class="hl"></td></tr> -->
		</table>
	</div>
	
	<div class="fourthStepDisplayGrp commonHide" style="display: none; height: 100%;margin-top: 146px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 80%; width:99%; display: inline-block; overflow-y: scroll; max-height: 480px;"  
			id="fourthStepDisplayGrpTbl" class="highlightTblRw">
			<tr class="excptRow">
				<td colspan="1"><div><input type="button" value="<< Back" class="fourthStepDisplayGrpBtn"/> </div></td>
				<!-- <td style="font-weight: bold;text-align: right;font-weight:bold">Ledger :</td> -->
				<td colspan="" class="" style="font-weight: bold;">
					<div><input type="text" readonly="readonly" class="ledgerName"  style="font-weight: bold;"/></div>
					<input type="hidden" readonly="readonly" style="font-weight: bold;" class="year"/>
					<input type="hidden" readonly="readonly" style="font-weight: bold;" class="month"/>
				</td>
				<td><div><input type="button" value="Narration" class="narration narrationShowAll"/></div></td>
				<td><div><input type="text" class="narrationSearch customInpStyle" placeholder="Enter Narration"/></div></td>
				<td colspan="4">
					<div style="float: right;" class="displayGrp"><b> Period : </b> 
						<input type="text" class="periodFrom dtFormat dgDate startdate" style="width: 66px;"/> - <input type="text" class="periodTo dtFormat dgDate enddate" style="width: 66px;"/>
					</div>					
				</td>
			</tr>
			<tr class="excptRow">
				<td width="15%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Date</b></td>
				<td width="15%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher No.</b></td>
				<td width="15%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher Type</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Balance</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="fourthStepDisplayGrpDblClk narrationClick">
				<td width="15%;"><input type="text" class="transDate" readonly="readonly"/></td>
				<td width="25%;">
					<input type="text" class="transId" readonly="readonly"/>
					<input type="hidden" class="accType"/>
				</td>
				<td width="15%;"><input type="text" class="voucherName" readonly="readonly"/></td>
				<td width="15%;" style="text-align: right;"><div class="drAmount emptyVal drAmt"></div></td>
				<td width="15%;" style="text-align: right;"><div class="crAmount emptyVal crAmt"></div></td>
				<td width="15%;" style="text-align: right;"><div class="balance emptyVal closingBal"></div></td>
			</tr>
			</c:forEach>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:99%;" id="fourthStepDisplayGrpTblTtl" class="highlightTblRw">
			<tr class="">
				<!-- <td style="width : 15%; border-top:1pt solid black;"></td> -->
				<td width="37%;" style="border-top:1pt solid black;">
					<input type="text" readonly="readonly" class="textStyleNonEdit_300"/>
				</td>
				<td style="width : 15%; border-top:1pt solid black;text-align: right;font-weight: bold;font-size: 1.15em"><b>Opening Balance :</b></td>
				<td style="width : 15%; border-top:1pt solid black;"><div class="openingBalanceDR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 13%; border-top:1pt solid black;"><div class="openingBalanceCR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 13%; border-top:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
				<td style="width : 14%; border-top:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
			</tr>
			
			<tr class="" style="line-height: 100%;">
				<!-- <td width="15%;" ></td> -->
				<td width="25%;" style="">
					<input type="text" readonly="readonly" class="textStyleNonEdit_300"/>
				</td>
				<td width="18%;" style="text-align: right;font-size: 1.15em"><b>Grand Total :</b></td>
				<td width="29%;" style="text-align: right;">
					<div class="transAmountDRTotal emptyVal" style="font-weight: bold;"></div>
				</td>
				<td width="15%;" style="text-align: right;">
					<div class="transAmountCRTotal emptyVal" style="padding-left: 2px; font-weight: bold;"></div>
				</td>
				<td  width="15%;" style="text-align: right;">
					<div class="balanceTotal emptyVal" style="width: 135px; font-weight: bold;"></div>
				</td>
			</tr>
			<tr class="">
				<!-- <td style="width : 15%; border-top:1pt solid black;border-bottom:1pt solid black;"></td> -->
				<td width="25%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;">
					<input type="text" readonly="readonly" class="textStyleNonEdit_300"/>
				</td>
				<td style="width : 15%; border-top:1pt solid black;border-bottom:1pt solid black;text-align: right;font-weight: bold;font-size: 1.15em"><b>Closing Balance :</b></td>
				<td style="width : 13%; border-top:1pt solid black;border-bottom:1pt solid black;"><div class="closingBalanceDR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 12%; border-top:1pt solid black;border-bottom:1pt solid black;"><div class="closingBalanceCR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 13%; border-top:1pt solid black;border-bottom:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
				<td style="width : 14%; border-top:1pt solid black;border-bottom:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
			</tr>
		</table>
	</div>
	
	<div class="fifthStepDisplayGrp commonHide"  style="display: none;height: 100%;margin-top: 146px;">
	<table border="0" cellpadding="0" cellspacing="0" style="height: 90%; width:99%; display: inline-block; overflow-y: scroll; max-height: 430px;"  
			id="fifthStepDisplayGrpTbl" class="highlightTblRw">
			<tr class="excptRow">
				<td width="60%;">
					<div style="float: left;"><input type="button" value="<< Back" class="fifthStepDisplayGrpBckBtn"/></div>
					<div class="voucherType" style="text-align:right;font-weight: bold;"><b style="padding-right: 200px;"> : </b></div>
				</td>
				<td width="15%" ></td>						
				<td colspan="2" width="20%"></td><td style="align:right;width:15%"><div class="editBtn" style="display:none"><b style="float:right"><img src="resources/images/edit.png" style="padding-left: 25px; width: 12px; height : 15px;" border="0" title="Edit Record" id="edit"/></b></div></td>
				
			</tr>
			
			<tr class="excptRow">
				<td width="60%;" style="width:50%; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td style="width:15%;text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td style="width:15%;text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td colspan="2" style="width:15%;text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;padding-right: 40px;"><b>Balance</b></td>
				<!-- <td width="5%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"></td> -->
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="">
				<td><input type="text" class="ledgerName" readonly="readonly"/></td>
				<td style="text-align: right;">
					<div class="drAmt emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="crAmt emptyVal"></div>
				</td>
				<td style="width:15%;text-align: right;">
					<div class="cumBal emptyVal"></div>
				</td>
				<td style="text-align: right">
					<input type="text" class="cumDrCr" style="width:15px" readonly="readonly"/>
				</td>
			</tr>
			</c:forEach>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:98%;" id="fifthStepDisplayGrpTblTtl" class="highlightTblRw">
			<tr class="">
				<td style="width:57%"><b>Narration :</b><input type="text" class="ledgerNarration" readonly="readonly"/></td>
				<td style="text-align: right; width: 16%; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="transAmountDRTotal emptyVal" style="padding-right: 2px;"></span></b>
				</td>
				<td style="width:15%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="transAmountCRTotal emptyVal" style="padding-left: 2px;"></span></b>
				</td>
				<td style="width : 20%; text-align: right; border-top: 1pt solid black; border-bottom: 1pt solid black"> </td>
				<!-- <td  style="width : 5%; text-align: right; border-top: 1pt solid black; border-bottom: 1pt solid black"> </td>
				 -->
			</tr>
		</table>
	</div>
	<div class="editRecordDispGrp commonHide"  style="display: none; height: 100%;">
	<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width:99%; display: inline-block; overflow-y: scroll; max-height: 250px;"  
			id="fifthStepDisplayGrpTbledit">
			<tr class="excptRow">
				<td colspan="2">
					<div style="float: left;"><input type="button" value="<< Back" class="fifthStepDisplayGrpBckBtnEdit" id="editRecordBackBtn"/></div>
					<div class="editVoucherType" style="display:none"><b style="padding-left: 10px;"> : </b></div>
				</td>	
				<td></td>			
			</tr>
			<tr id="transDtlsHeader">
				<td width="50%;" ><b>Transaction No</b></td>
				<td width="50%" colspan="2"><b>Transaction Date</b></td>
			</tr>
			<tr id="transDtls">
				<td><input type="text" class="transId textStyle_130 doNothingCls removesVal data-holderInpEdit" readonly="readonly" style="background: #ccc;"/></td>
				<td colspan="3"><input type="text" class="textStyle_80 transDt removesVal extraDt dtFormat validateField data-holderInpEdit" style="background: #ccc;" id="transDt"/></td>
			</tr>
			<tr class="excptRow">
				<td width="55%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="20%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="10%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;padding-right: 35px;"><b>Balance</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
				<tr class="cloneRecord" id="cloneRecord${i}">
					<!-- <td><input type="text" class="ledgerName textStyle_130 doNothingCls removesVal data-holderInpEdit"  style="background: #ccc;"/></td> -->
					<td class="labelTextTrans data-holdertd"><div>
						<input type="hidden" class="ledgerAuto" id="ledgerAutoId" />
						<input type="hidden" id="trtansAuto" class="transAuto"/>
						<select name="dummyLedger" class="dropdown_Fixed200 doNothingCls removesVal data-holderInpEdit" style="background: #ccc;"> 
							<option value="">Select</option>
						</select>
					</div></td>
					<td align="right">
						<input type="hidden" name="debitBal" class="debitBalHdn"/>
						<input type="text" class="textStyle_110 dClass removesVal validateField decimal data-holderInpEdit" onblur="$(this).checkVal('dClass',$(this));" onchange="$(this).checkDrCrVal('dClass',$(this))" style="background: #ccc;text-align:right;"/>
					</td>
					<td>
						<input type="hidden" name="creditBal" class="creditBalHdn"/>
						<input type="text" class="textStyle_110 cClass removesVal validateField decimal data-holderInpEdit" onblur="$(this).checkVal('cClass',$(this));" onchange="$(this).checkDrCrVal('cClass',$(this))"style="background: #ccc;text-align:right"/>
					</td>
					<td>
						<input type="hidden" name="cummulativeBal" class="balanceAmountHdn"/>
						<input type="text" class="textStyle_110 balanceAmount removesVal validateField decimal data-holderInpEdit" style="background: #ccc;text-align:right;width:130px"/>
						<input type="text" readonly="true" class="addText textStyle_15 readonly" style="width: 15px; background: transparent; border: none;" id="drCr"/>
					</td>
				</tr>
			</c:forEach>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:99%;" id="fifthStepDisplayGrpTblTtlEdit">
			<tr class="" style ="line-height:10px;">
				<td width="55%" class=""><b>Narration :</b><input type="text" class="" readonly="readonly"/></td>
				<td style="text-align: right; width: 17%; border-top: 1pt solid; border-bottom: 1pt solid ; padding-right: 2px">
					<input type="text" style="text-align:right" readonly="readonly" class="data-holderInpEdit transAmountDRTotal textStyle_130 validateField decimal" readonly="true"/>
				</td>
				<td style="width : 13.5%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid; padding-right: 10px;">
					<input type="text" style="text-align:right" readonly="readonly" class=" transAmountCRTotal validateField textStyle_130 decimal" readonly="true"/>
				</td>
				<td style="width :20%;text-align: right; border-top: 1pt solid; border-bottom: 1pt solid"></td>
			</tr>			
			<tr>
				<td></td>
				<td></td>
				<td></td>
			    <td align="right">
				   <div id="divbtns" style="margin-right: 10px" >
						<access:accessLevel accessId="Submit">
							<a href="#"><input type="button"  title="<f:message code="label.submit"/>" id="subEntry" value="Submit"/></a>
						</access:accessLevel>
				   </div>
			  	</td>
			</tr>
		</table>
	</div>
	<!--Display Group Reports Data  End -->
	
	<!--Cost center summary Reports Data -->
	
	<div class="costCenterSummary commonHide" style="display: none; height: 100%;margin-top: 146px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width: 33%;" id="costCenterRptFirstTbl">
			<!-- <tr><td width="2%"><input type="checkbox" class="groupCheckBox" checked="checked"/><b>Print Zero Balance Data </b></td></tr> -->
			<tr style="height: 2%;">
				<td width="100%">					
					<div style="float: left;" class="CCdispaly"><b> Period : </b> 
						From<input type="text" class="periodFrom date" style="width: 80px;"/> -To <input type="text" class="periodTo date" style="width: 80px;"/>
					</div>					
					<div class="genCCdispaly" style=" float: left; padding-left:  50px;">
						<!-- <input type="hidden" class="ledgerAuto"/> -->
						<input type="button" class="genReportCostCenterSummarry" value="Generate"/>
					</div>
				</td>
			</tr>
			<tr  style="height: 2%;"><td width= "100%"><div class="hl"></div></td></tr>
			<tr style="height: 96%;"><td align="right"></td></tr>
		</table>
	</div>
	
	<div class="costCenter commonHide"  style="display: none; height: 100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 90%; width:99%; display: inline-block; overflow-y: scroll; max-height: 430px;"  
			id="firstStepCCTable" class="highlightTblRw">
			<tr class="excptRow">
				<td colspan="4">
					<div style="float: left;"><input type="button" value="<< Back" class="firstStepBackBtnCC"/></div>
					<div style="float: left; width: 90%;">
						<div class="reportNames" style="padding-left: 100px; font-weight: bold; float: left; width: 20%;text-align: right"></div>
						<div class="rptPeriods" style="float: left;margin-left:10px;font-weight: bold;"></div>
						<input type="hidden" class="ledgerAuto"/><input type="hidden" class="report"/>
					</div>
				</td>
				<td></td>
				<!-- <td></td><td></td><td></td><td></td> -->
			</tr>
			
			<tr class="excptRow">
				<td width="57%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td width="20%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Cumulative Balance</b></td>
			</tr>			
			
			<c:forEach  begin="0" end="0" var="i">
				<tr class="firstStepDblClkCC">
					<td>
						<input type="text" class="mainGrp groups subGroups" readonly="readonly"/>
						<input type="hidden" class="mainGrp"/>
						<input type="hidden" class="mainGrpId"/>
						<input type="hidden" class="mainGrpAuto"/>
					</td>
					<td style="text-align: right;">
						<div class="drAmount subGroupDr groupDr emptyVal"></div>
					</td>
					<td style="text-align: right;">
						<div class="crAmount subGroupCr groupCr emptyVal"></div>
					</td>
					<td style="text-align: right;">
						<div class="closingBal emptyVal"></div>
					</td>
				</tr>
			</c:forEach>			
		</table>
		
		<table border="0" cellpadding="0" cellspacing="0" style="width:97.5%;" id="firstStepCCTableTotal" class="highlightTblRw">	
			<tr class="firstSteptotalCC">
				<td style="text-align: right; width : 70%;">
					<!-- <b class="hideForOther" style="float: left;">Difference in Balance :</b> -->
					<!-- <b class="hideForOther" style="float: left;"><div class="diffAmount" style="width: 120px; padding-top: 3px;"></div></b>
					<b class="hideForOther" style="float: left;"><div class="diffAmountText" style="width: 25px;"></div></b> -->
					<b>Total :</b>
					<input type="text" class="" readonly="readonly"/>
				</td>
				<td style="text-align: right; width: 15%; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="drAmountTtl emptyVal" style="width: 143px; padding-right: 2px;"></span></b>
				</td>
				<td style="width : 15%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="crAmountTtl emptyVal" style="width: 135px; padding-left: 8px;"></span></b>
				</td>
				<td style="width : 15%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><div class=" " style="width: 135px; padding-left: 8px;"></div></b>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="secondStepCC commonHide"  style="display: none;height: 100%;">
		<table border="0" cellpadding="0" cellspacing="0" style=" width:99%; line-height: 10px;" id="costCenterStepTwo">
			<tr style="height: 20%;">
				<td>
					<input type="hidden" class="costCenterId"/>
					<input type="hidden" class="ledgerAutoId"/>
					<input type="hidden" class="costCenterAuto"/>
					<input type="hidden" class="costCenterName"/>
					<div style="float: left;"><input type="button" value="<< Back" class="secondStepBackBtnCC"/></div>
					<div style="float: right;"><input type="button" value="BRS" class="showCC" style="display: none;"/></div>
				</td>
			</tr>
			<tr style="height: 2%;">
				<td style="width:40%"><div style="float: left; width: 49%"><b>Year</b>
						<input type="text" value="2018" class="entryYearCC" style="background-color: #747474; color: white; width : 40px;"></input>
					</div></td>
				<td style="width:20%"><div class="" style="float: right;"><b>Debit</b></div></td>
				<td style="width:20%"><div class="" style="float: right;"><b>Credit</b></div></td>
				<td style="width:20%"><div class="" style="float: right;"><b>Closing Balance</b></div></td>
			</tr>
			<tr><td width= "100%" colspan="4"><div class="hl"></div></td></tr>
			<tr style="height: 100%;">
			<td colspan="4">
				<table border="0" cellpadding="0" cellspacing="0" style="height: 50%; width:100%;" class="highlightTblRw">
					<tr class="openBalHideForPl">
						<td style="width:40%"><div  style="float: left; width: 49%; text-decoration: underline;">Opening Balance</div></td>
						<td style="width:20%"><div class="" style="float: right;"></div></td>
						<td style="width:20%"><div class="" style="float: right;padding-right:65px;"></div></td>
						<td style="width:20%"><div class="openingBal " style="float: right; "></div> </td>
					</tr>
					<tr class="secondStepDblClkCC" id="1">
						<td style="width:40%"><div style="float: left; width: 49%"><b>January</b></div></td>
						<td style="width:20%"><div class="januarydebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="januarycredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="januarycb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCC" id="2">
						<td style="width:40%"><div style="float: left; width: 49%"><b>February</b></div></td>
						<td style="width:20%">	<div class="februarydebit" style="float: right;"></div></td>
						<td style="width:20%">	<div class="februarycredit" style="float: right;"></div></td>
						<td style="width:20%">	<div class="februarycb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCC" id="3">
						<td style="width:40%"><div style="float: left; width: 49%"><b>March</b></div></td>
						<td style="width:20%"><div class="marchdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="marchcredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="marchcb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCC" id="4">
						<td style="width:40%"><div style="float: left; width: 49%"><b>April</b></div></td>
						<td style="width:20%"><div class="aprildebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="aprilcredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="aprilcb amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCC" id="5">
						<td style="width:40%"><div style="float: left; width: 49%"><b>May</b></div></td>
						<td style="width:20%"><div class="maydebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="maycredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="maycb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCC" id="6">
						<td style="width:40%"><div style="float: left; width: 49%"><b>June</b></div></td>
						<td style="width:20%"><div class="junedebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="junecredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="junecb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCC" id="7">
						<td style="width:40%"><div style="float: left; width: 49%"><b>July</b></div></td>
						<td style="width:20%"><div class="julydebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="julycredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="julycb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCC" id="8">
						<td><div style="float: left; width: 49%"><b>August</b></div></td>
						<td style="width:20%"><div class="augustdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="augustcredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="augustcb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCC" id="9">
						<td style="width:40%"><div style="float: left; width: 49%"><b>September</b></div></td>
						<td style="width:20%"><div class="septemberdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="septembercredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="septembercb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCC" id="10">
						<td style="width:40%"><div style="float: left; width: 49%"><b>October</b></div></td>
						<td style="width:20%"><div class="octoberdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="octobercredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="octobercb  amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCC" id="11">
						<td style="width:40%"><div style="float: left; width: 49%"><b>November</b></div></td>
						<td style="width:20%"><div class="novemberdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="novembercredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="novembercb amtForCls" style="float: right;"></div></td>
					</tr>
					<tr class="secondStepDblClkCC" id="12">
						<td style="width:40%"><div style="float: left; width: 49%"><b>December</b></div></td>
						<td style="width:20%"><div class="decemberdebit" style="float: right;"></div></td>
						<td style="width:20%"><div class="decembercredit" style="float: right;"></div></td>
						<td style="width:20%"><div class="decembercb amtForCls" style="float: right;"></div></td>
					</tr>
				</table>
			</td>
			</tr>
			
			<!-- <tr style="height: 18%;"><td  colspan="4" class="hl"></td></tr> -->
			
			<tr class="secondStepCCClsBal" id="">
				<td style="width:40%;border-top: 1px solid black;border-bottom: 1px solid black;"><div  style="float: left; width: 49%"><b>Grand Total</b></div></td>
				<td style="width:20%;border-top: 1px solid black;border-bottom: 1px solid black;"><div class="debitTotal" style="float: right; font-weight: bold;"></div></td>
				<td style="width:20%;border-top: 1px solid black;border-bottom: 1px solid black;"><div class="creditTotal" style="float: right; font-weight: bold;"></div></td>
				<td style="width:20%;border-top: 1px solid black;border-bottom: 1px solid black;"><div class="closingBal" style="float: right; font-weight: bold;"></div>
					<div class="closingBalHdn" style="display: none;"></div></td>
			</tr>
			
			<!-- <tr style="height: 18%;"><td colspan="4" class="hl"></td></tr> -->
		</table>
	</div>
	
	<div class="thirdStepCC commonHide" style="display: none; height: 100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 81%; width:99%; display: inline-block; overflow-y: scroll; max-height: 480px;"  
			id="costCenterDetailTable"	class="highlightTblRw">
			<tr class="excptRow">
				<td><div><input type="button" value="<< Back" class="thirdStepCCBackBtn"/></div></td>
				<td colspan="2" style="font-weight: bold;"><div><input type="text" readonly="readonly" style="font-weight: bold;" class="costCenterId"/></div>
					<input type="hidden" readonly="readonly" style="font-weight: bold;" class="costCenterAuto"/>
					<input type="hidden" readonly="readonly" style="font-weight: bold;" class="costCenterName"/>
					<input type="hidden" readonly="readonly" style="font-weight: bold;" class="year"/>
					<input type="hidden" readonly="readonly" style="font-weight: bold;" class="month"/>
				</td>
				<td style="text-align: right;">
					<div><input type="button" value="Narration" class="narration narrationShowAll"/></div>
				</td>
				<td><div><input type="text" class="narrationSearch customInpStyle" placeholder="Enter Narration"/></div></td>
				<td colspan="2">
					<div style="float: right;" class="CCdispaly"><b> Period : </b> 
						<input type="text" class="periodFrom dtFormat ccDate startdate" style="width: 66px;"/> - <input type="text" class="periodTo dtFormat ccDate enddate" style="width: 66px;"/>
					</div>					
				</td>
			</tr>
			<tr class="excptRow">
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Transaction Date</b></td>
				<td style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Transaction No.</b></td>
				<td style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Voucher Type</b></td>
				<td style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b>Ledger Name</b></td>
				<td style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Balance</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="thirdStepDblClkCC narrationClick">
				<td width="12%;"><input type="text" class="transDate" readonly="readonly"/></td>
				<td width="11%;"><input type="text" class="transId" readonly="readonly"/>
					<input type="hidden" class="transAutoId" />
				</td>
				<td width="15%;"><input type="text" class="voucherName" readonly="readonly"/></td>
				<td width="20%;"><input type="text" class="ledgerNm" readonly="readonly"/></td>
				<td style="width : 10%; text-align: right;"><div class="drAmount emptyVal drAmt"></div></td>
				<td style="width : 15%; text-align: right;"><div class="crAmount emptyVal crAmt"></div></td>
				<td style="width : 20%; text-align: right;"><div class="balance emptyVal cumBal"></div></td>
			</tr>
			</c:forEach>
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:98%;" id="thirdStepCCtotal" class="highlightTblRw">
			
			<tr class="">
				<!-- <td style="width : 15%; border-top:1pt solid black;"></td> -->
				<td width="41%;" style="border-top:1pt solid black;">
					<input type="text" readonly="readonly" class="textStyleNonEdit_300"/>
				</td>
				<td style="width : 15%; border-top:1pt solid black;text-align: right;font-weight: bold;font-size: 1.15em"><b>Opening Balance :</b></td>
				<td style="width : 15%; border-top:1pt solid black;"><div class="openingBalanceDR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 13.5%; border-top:1pt solid black;"><div class="openingBalanceCR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 13%; border-top:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
				<td style="width : 14%; border-top:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
			</tr>
			
			
			<tr class="thirdStepCCtotal" style="line-height: 100%;">
				<!-- <td width="12%;" style=""></td> -->
				<td width="11%;" style=""><input type="text" readonly="readonly" class="textStyleNonEdit_300"/></td>
				<!-- <td style="width : 15%;"></td> -->
				<td style="width : 18%; text-align: right;font-weight: bold;font-size: 1.15em"><b>Grand Total :</b></td>
				<td style="width : 16.8%; text-align: right;">
					<div class="transAmountDRTotal emptyVal" style="font-weight: bold;"></div>
				</td>
				<td style="width : 12.8%; text-align: right;">
					<div class="transAmountCRTotal emptyVal" style="padding-left: 2px; font-weight: bold;"></div>
				</td>
				<td style="width : 20%; text-align: right;">
					<div class="" style="padding-left: 2px; font-weight: bold;"></div>
				</td>
			</tr>
			
			<tr class="">
				<!-- <td style="width : 15%; border-top:1pt solid black;border-bottom:1pt solid black;"></td> -->
				<td width="25%;" style="border-bottom:1pt solid black;  border-top:1pt solid black;">
					<input type="text" readonly="readonly" class="textStyleNonEdit_300"/>
				</td>
				<td style="width : 15%; border-top:1pt solid black;border-bottom:1pt solid black;text-align: right;font-weight: bold;font-size: 1.15em"><b>Closing Balance :</b></td>
				<td style="width : 13%; border-top:1pt solid black;border-bottom:1pt solid black;"><div class="closingBalanceDR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 12%; border-top:1pt solid black;border-bottom:1pt solid black;"><div class="closingBalanceCR emptyVal" style="text-align: right;font-weight: bold"></div></td>
				<td style="width : 13%; border-top:1pt solid black;border-bottom:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
				<td style="width : 14%; border-top:1pt solid black;border-bottom:1pt solid black;"><div class="emptyVal" style="text-align: right;"></div></td>
			</tr>
		</table>
	</div>
	
	<div class="fourthStepCC commonHide"  style="display: none;height: 100%;">
	<table border="0" cellpadding="0" cellspacing="0" style="height: 90%; width:99%; display: inline-block; overflow-y: scroll; max-height: 430px;"  
			id="ccEntryDtlsTable" class="highlightTblRw">
			<tr class="excptRow">
				<td colspan="3">
					<div style="float: left;"><input type="button" value="<< Back" class="fourthStepCCBckBtn"/></div>
					<div class="voucherType" style="text-align:right;padding-right:300px;font-weight: bold;"><b> : </b></div>
				</td>
				<!-- <td width="15%" ></td>	
				<td width="15%" ></td>	 -->
				<td colspan="1" style="align:right"><div class="editBtn" style="display:none"><b style="float:right"><img src="resources/images/edit.png" style="padding-left: 25px; width: 12px; height : 15px;" border="0" title="Edit Record" id="edit"/></b></div></td>
			</tr>
			
			<tr class="excptRow">
				<td width="50%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td colspan="2" width="20%" style="text-align: right;padding-right: 40px; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Balance</b></td>
			</tr>
			
			<c:forEach  begin="0" end="0" var="i">
			<tr class="">
				<td><input type="text" class="ledgerName" readonly="readonly"/></td>
				<td style="text-align: right;">
					<div class="drAmt emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="crAmt emptyVal"></div>
				</td>
				<td style="text-align: right;width:50%">
					<div class="cumBal emptyVal"></div>
				</td>
				<td style="text-align: left">
					<input type="text" class="cumDrCr" style="width:15px !important" readonly="readonly"/>
				</td>
			</tr>
			</c:forEach>
			
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:99%;" id="ccEntryDtlsTableTtl" class="highlightTblRw">
			<tr class="">
				<td width="51%"><b>Narration :</b><input type="text" class="ledgerNarration" readonly="readonly"/></td>
				<td style="width:12.5%;text-align: right;; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="transAmountDRTotal emptyVal" style="padding-right: 2px;"></span></b>
				</td>
				<td style="text-align: right; border-top: 1pt solid; border-bottom: 1pt solid">
					<b><span class="transAmountCRTotal emptyVal" style="width:121px; padding-left: 2px;"></span></b>
				</td>
				<td colspan="2" style="text-align: right; border-top: 1pt solid; border-bottom: 1pt solid"> </td>
				<td  style="width :21.15%;;text-align: right;text-align: right; border-top: 1pt solid; border-bottom: 1pt solid"></td>
			</tr>
		</table>
	</div>
	<div class="ccLedgAffNtAff commonHide" style="display: none; height: 100%;margin-top: 146px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width: 99%;" id="ccLedgerAffFirstTbl">
			<tr style="height: 2%;">
				<td width="100%">			
				<table>
					<!-- <tr><td width="2%" colspan="3"><input type="checkbox" class="groupCheckBox" checked="checked"/><b>Print Zero Balance Data </b></td></tr> -->
					<tr>
						<td class="" style="width: 6%;"><b>Ledgers	:</b></td>
						<td class="data-holdertd" width="20%;">
							<div>
								<select name="ledger" id="ledgerAuto" class="sundDRCR dropdown_Fixed200 ledgerList"/>
								<input type="hidden" name="ledgerId" id="ledgerId" class="data-prop"/>
								<input type="hidden" name="ledgerName" id="ledgerName" class="data-Text"/>
							</div>
						</td>
						<td>
							<div style="float: left;" class="ccDispPeriod"><b> Period : </b> 
								From<input type="text" class="periodFrom date" style="width: 80px;"/> - To<input type="text" class="periodTo date" style="width: 80px;"/>
							</div>
							<div class="" style=" float: left; padding-left:  50px;">
								<input type="button" class="genReportCCLedger" value="Generate"/>
							</div>
						</td>
					</tr>
				</table>
				</td>
			</tr>
			<tr  style="height: 2%;"><td width= "100%"><div class="hl"></div></td></tr>
			<tr style="height: 96%;">
				<td align="right">
				<div class="firstStepCCDiv commonHide"  style="display: none; height: 100%;">
					<div class="tab">
						<button id="ccEntryAffLedger" class="tablinks active" onclick="">Affected Cost Center </button>
						<button id="ccEntryNtAffLedger" class="tablinks" onclick="">Not-Affected Cost Center </button>
					</div>
					<div class="">
						<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width: 99%;" id="">
						<tr>
							<td style="width: 9%;"><b>Date</b></td>
							<td style="width: 30%;"><b>Ledger Name</b></td>
							<td style="width: 10.5%;"><b>Voucher Type</b></td>
							<td style="width: 10%;"><b>Transaction ID</b></td>
							<td style="width: 12.5%; text-align: right;"><b>Debit</b></td>
							<td style="width: 13.5%; text-align: right;"><b>Credit</b></td>
							<td style="text-align: center;"><b>Closing Balance</b></td>
						</tr>
						</table>
					</div>
					<div class="ccEntryAffLedger hideCCEntry" style="">
						<table border="0" cellpadding="0" cellspacing="0" style="border: 1px solid black; height: 100%; width: 100%; display: inline-block;
						 overflow-y: scroll; max-height: 366px; line-height: 1px;"
							id="ccEntryAffLedgerTbl" class="highlightTblRw">
						<tr class="displayCCData">
							<td style="width: 8%;"><input type="text" class="transDate dateFormate emptyVal" readonly="readonly"/></td>
							<td style="width: 30%;">
								<input type="text" class="ledgerName emptyVal" readonly="readonly"/>
								<input type="hidden" class="ledgerAuto emptyVal" />
							</td>
							<td style="width: 10%;"><input type="text" class="voucherName emptyVal" readonly="readonly"/></td>
							<td style="width: 10%;">
								<input type="text" class="transId" readonly="readonly"/>
								<input type="hidden" class="transAuto emptyVal" />
							</td>
							<td style="width: 13%;">
								<input type="text" class="decimal validateField drAmount emptyVal" readonly="readonly" style="text-align: right; width: 120px;"/>
							</td>
							<td style="width: 13%;">
								<input type="text" class="decimal validateField crAmount emptyVal" readonly="readonly"  style="text-align: right; width: 120px;"/></td>
							<td style="text-align: right;">
								<input type="text" class="decimal validateField cumBalance emptyVal" readonly="readonly" style="text-align: right; width: 90px;"/>
								<input type="text" class="cumDrCr emptyVal" readonly="readonly"  style="width: 15px;"/>
							</td>
						</tr>
						</table>
					</div>
					<div class="ccEntryNtAffLedger hideCCEntry" style="display: none;"> 
						<table border="0" cellpadding="0" cellspacing="0" style="border: 1px solid black; height: 100%; width: 100%; display: inline-block; overflow-y: scroll;
							max-height: 366px; line-height: 1px;" 
							id="ccEntryNtAffLedgerTbl" class="highlightTblRw">
						<tr class="">
							<td style="width: 8%;"><input type="text" class="transDate dateFormate emptyVal" readonly="readonly"/></td>
							<td style="width: 30%;">
								<input type="text" class="ledgerName emptyVal" readonly="readonly"/>
								<input type="hidden" class="ledgerAuto emptyVal" />
							</td>
							<td style="width: 10%;"><input type="text" class="voucherName emptyVal" readonly="readonly"/></td>
							<td style="width: 10%;">
								<input type="text" class="transId" readonly="readonly"/>
								<input type="hidden" class="transAuto emptyVal" />
							</td>
							<td style="width: 13%;">
								<input type="text" class="decimal validateField drAmount emptyVal" readonly="readonly" style="text-align: right; width: 120px;"/>
							</td>
							<td style="width: 13%;">
								<input type="text" class="decimal validateField crAmount emptyVal" readonly="readonly"  style="text-align: right; width: 120px;"/></td>
							<td style="text-align: right;">
								<input type="text" class="decimal validateField cumBalance emptyVal" readonly="readonly" style="text-align: right; width: 90px;"/>
								<input type="text" class="cumDrCr emptyVal" readonly="readonly"  style="width: 15px;"/>
							</td>
						</tr>
						</table>
					</div>
				</div>
				</td>
			</tr>
		</table>
	</div>
	<div class="costCenterEntryDetail commonHide" style="display: none;" id="costCenterEntryDetail">
		<table style="width: 100%; height: 2%;" id="" class="">
			<tr class="excptRow">
				<td colspan="4"><div style="float: left;"><input type="button" value="<< Back" class="ccBckBtn" id="ccBckBtn"/></div></td>				
			</tr>
		</table>
		<table style="width: 100%;" id="" class="">
			<tr class="excptRow">
				<td width="50%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Cost Center Name</b></td>
				<td width="15%" style="text-align: center; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: center; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
				<td colspan="2" width="20%" style="text-align: center; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Balance</b></td>			
			</tr>
		</table>
		<table style="width: 100%; height:84%;  max-height: 394px; overflow-y: scroll; line-height: 1px;" id="ccEntryDetailsTbl" class="highlightTblRw">
			<tr class="">
				<td style="width: 50%;">
					<input type="text" class="ccName emptyVal" readonly="readonly"/>
					<input type="hidden" class="ccAuto emptyVal" />
				</td>
				<td style="width: 15%;">
					<input type="text" class="decimal validateField drAmount emptyVal" readonly="readonly" style="text-align: right; width: 120px;"/>
				</td>
				<td style="width: 15%;">
					<input type="text" class="decimal validateField crAmount emptyVal" readonly="readonly"  style="text-align: right; width: 120px;"/></td>
				<td style="text-align: right;">
					<input type="text" class="decimal validateField cumBalance emptyVal" readonly="readonly" style="text-align: right; width: 90px;"/>
					<input type="text" class="cumDrCr emptyVal" readonly="readonly"  style="width: 15px;"/>
				</td>
			</tr>		
		</table>
	</div>	
	<!--Cost center summary Reports Data End-->
	
	<!-- Cost Center Break-up Report Start -->
	<div class="ccBreakUp commonHide" style="display: none; height: 100%;margin-top: 145px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 100%; width: 70%;" id="costCenterBreakUpTbl">
		<!-- 	<tr><td width="2%" colspan="3"><input type="checkbox" class="groupCheckBox" checked="checked"/><b>Print Zero Balance Data </b></td></tr> -->
			<tr style="height: 2%;">
				<td class="" style="width: 12%;"><b>Cost Center	:</b></td>
				<td class="data-holdertd" width="25%;">
					<div>
						<select name="costCenter" id="costCenterAuto" class="sundDRCR dropdown_Fixed200 costCenterList"/>
						<input type="hidden" name="costCenteId" id="costCenteId" class="data-prop"/>
					</div>
				</td>
				<td width="70%">					
					<div style="float: left;" class="CCdispaly"> 
						From<input type="text" class="periodFrom date" style="width: 80px;"/> - To<input type="text" class="periodTo date" style="width: 80px;"/>
					</div>					
					<div class="genCCdispaly" style=" float: left; padding-left:  50px;">
						<!-- <input type="hidden" class="ledgerAuto"/> -->
						<input type="button" class="genReportCCBreakUp" value="Generate"/>
					</div>
				</td>
			</tr>
			<tr  style="height: 2%;"><td colspan="3" width= "100%"><div class="hl"></div></td></tr>
			<tr style="height: 96%;"><td align="right" colspan="3"></td></tr>
		</table>
	</div>
	<div class="ccBreakUpFirstStep commonHide"  style="display: none; height: 100%;overflow-y: scroll;">
		<div style="width:100%;">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%;"   id="firstStepCCBreakUpTable" class="highlightTblRw">
			<tr class="excptRow">
				<td>
					<div style="float: left;"><input type="button" value="<< Back" class="firstStepBackBtnCCBreakUp"/></div>
					<div style="float: left; width: 90%;">
						<div class="reportNames" style="padding-left: 100px; font-weight: bold; float: left; width: 20%;"></div>
						<div class="rptPeriods" style="float: left;"></div>
					</div>
				</td>
				<td></td><td></td><td></td><td></td>
			</tr>
			
			<tr class="excptRow">
				<td width="70%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b>Particulars</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Debit</b></td>
				<td width="15%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b>Credit</b></td>
			</tr>
			<c:forEach begin="0" end="0" var="i">
				<tr class="firstStepDblClkCCBreakUp">
					<td>
						<input type="text" class="ledgerName groups subGroups" readonly="readonly"/>
						<input type="hidden" class="ledgerId"/>
						<input type="hidden" class="ledgerAuto"/>
						<input type="hidden" class="costCenterAutoId"/>
					</td>
					<td style="text-align: right;">
						<div class="drAmount subGroupDr groupDr emptyVal"></div>
					</td>
					<td style="text-align: right;">
						<div class="crAmount subGroupCr groupCr emptyVal"></div>
					</td>
				</tr>
			</c:forEach>			
		</table>
		<table border="0" cellpadding="0" cellspacing="0" style="width:98.5%;" id="firstStepCCBreakupTablTotal" class="highlightTblRw">	
			<tr class="firstSteptotalCCB">
				<td style="width : 70%; font-weight: bold;font-size:1.15em" class="textLbl">					
					<b class="hideForOther" style="float: left;">Total</b>
					<b class="hideForOther" style="float: left;"><span class="" style="width: 120px; padding-top: 3px;"></span></b>
					<b class="hideForOther" style="float: left;"><span class="" style="width: 25px;"></span></b>
					<b style=""></b>
					<input type="text" class="" readonly="readonly"/>
				</td>
				<td></td><td></td>
				<td style="text-align: right; width: 15%; border-top: 1pt solid; border-bottom: 1pt solid !important">
					<b><span class="drAmountTtl emptyVal" style="width: 135px; padding-right: 2px;"></span></b>
				</td>
				<td style="width : 15%; text-align: right; border-top: 1pt solid; border-bottom: 1pt solid !important">
					<b><span class="crAmountTtl emptyVal" style="width: 135px; padding-left: 8px;"></span></b>
				</td>
			</tr>
		</table>
		</div>
	</div>
	
	
	<!-- Cost Center Break-up Report End -->
	
	<!-- cash Flow -->
	
<div class="firstStepCashFlow CashFlowTab commonHide"  style="display: none; height: 100%;margin-top: 149px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 99%; width:99%;"style="height: 80%; width:99%; "   id="CashFlowDataTable">
			<tr valign="top">				
				<td style="width:30%" colspan="2" style="line-height: 10px;">
					<div style="float: left;" class="cashFlow"><b> Period : </b> 
					 From<input type="text" id="pf"class="periodFrom date" style="width: 80px;"/> - 
						To<input type="text" id="pt" class="periodTo date" style="width: 80px;"/> 
					</div>
				</td>
				<td colspan="2" style="width: 10%;"><input type="button" class="genCashFlowRpt" value="Generate"/></td>
				</tr>
				<tr style="height: 90%;width:100%">
				<td align="right" colspan="7">
				</td>
	        </tr>
	</table>
</div>
				
        <div class="firstStepCFDiv commonHide"  style="display: none;height: 99%;margin-top: 142px;">
		<div class="" style="height:6%">
			<table border="0" cellpadding="0" cellspacing="0" style="height: 90%; width: 100%;" id="firstStepCFentryDtls">
		         <tr style="height: 20%;" >
				      <td colspan="4">
					<div style="float: left;"><input type="button" value="<< Back" class="FirstBackBtnCf"/></div>
				   </td></tr>
						<tr  class="cashFlowTb" >
							<td style="width: 25%;border-top: 1px solid black;border-bottom: 1px solid black;"><b style="padding-right: 277px;">INFLOW</b></td>
							<!-- <td style="width: 30%;border-top: 1px solid black;border-bottom: 1px solid black;"><b></b></td> -->
							<td style="width: 25%;border-top: 1px solid black;border-bottom: 1px solid black;"><b style="padding-left: 40px;padding-right: 186px;"> AMOUNT </b></td>
							<!-- <td style="width:1%"><div class="verticalLine"></div></td> -->
							<td style="width: 25%;border-top: 1px solid black;border-bottom: 1px solid black;"><b style="padding-right: 298px;">OUTFLOW</b></td>
							<td style="width: 25%;border-top: 1px solid black;border-bottom: 1px solid black;"><b style=""> AMOUNT </b></td>
						</tr></table></div>
						<br></br>
						
				<table  border="0" cellpadding="0" cellspacing="0" style=" height: 100%; width: 100%; display: inline-block; overflow-y: scroll;
							max-height: 366px; line-height: 1px;" >
						<tr>
			<td style="padding-top: 16px;width: 671px;padding-bottom: 552px;">
			<div class="CashFlowEntryRct" style="">
			<h4 class="headingClass inputClass" style="height: 9px;">OPENING BALANCE</h4>
			<table  border="0" cellpadding="0" cellspacing="0" style="height: 99px;width: 433px;" id="CasheFlowTblRct" class="highlightTblRw">
				<tr class="firstStepCFDblRctClk  narrationClick">
						 <td style="width: 10%; ">
						      <input type="text" class="legdgerName emptyVal inputClass"  style="width: 300px;" readonly="readonly" style=" padding-right: 83px;"/>
						      <input type="hidden" class="legrID emptyVal "  readonly="readonly"/>
						  </td>
						  <td><div  class="amt emptyVal "></div></td>   </tr>
			      </table><br></br><br></br>
			      
			<table  border="0" cellpadding="0" cellspacing="0" style="height: 712px;width: 408px;" id="CasheFlowTblRctTran" class="highlightTblRw">
			
						<tr class="firstStepCFDblRctClk  narrationClick">
						      <td style="width: 10%; ">
						      <input type="text" class="legdgerName emptyVal "  style="width: 300px;" readonly="readonly" style=" padding-right: 83px;"/>
						      <input type="hidden" class="legrID emptyVal "  readonly="readonly"/>
						      </td>
						      <td><div class="amt emptyVal " style="font-weight: bold "></div></td>   
						</tr>
						</table></div></td>
						
						  <td style="width:1%"><div class="verticalLine"></div></td> 
						
		<td ><div class="CashFlowEntry" >
				<table  border="0" cellpadding="0" cellspacing="0" style="height:  1278px;"  id="CasheFlowTbl" class="highlightTblRw">
						<tr class="firstStepCFDblClk  narrationClick">
							<td style="width: 30% ;">
								<input type="text" style="width: 300px;" class="legrerName emptyVal" readonly="readonly"/>
								<input type="hidden" class="legrID emptyVal inputClass"  readonly="readonly"/>
							</td>
							 <td><div  style=" padding-right:94px" class="amt emptyVal"></div></td>
						</tr>
					 </table>
			      <h4 class="headingClass inputClass" style="height: 9px; padding-top:20px;">CLOSING BALANCE</h4>
				<table  border="0" cellpadding="0" cellspacing="0" style="height: 100%;"  id="CasheFlowTblClosing" class="highlightTblRw">
					<tr class="firstStepCFDblClk  narrationClick">
						<td style="width: 30%; ">
							<input type="text"  style="width: 300px;"  class="legrerName emptyVal inputClass" readonly="readonly"/>
							<input type="hidden" class="legrID emptyVal"  readonly="readonly"/>
						</td>
						<td ><div   class="amt emptyVal " style=" padding-right:94px;font-weight: bold "></div></td>
					</tr></table></div></td></tr></table>
					
	          <table border="0" cellpadding="0" cellspacing="0" style="width:98%;"  class="highlightTblRw" id="totalAmntTabl">
			<tr class="">
				<td style="width:64%;border-bottom: 1px solid black;border-top: 1px solid black ;"><b>Total :</b><input type="text" class="" readonly="readonly"/></td>
				<td style="width:50%;border-bottom: 1px solid black;border-top: 1px solid black;padding-right: 497px ;"><div class="TotalRct" style="float: left; font-weight: bold;"></div></td>
				<td style="width:45%;border-bottom: 1px solid black;border-top: 1px solid black;padding-right: 75px;"><div class="TotalPymt" style="float: right; font-weight: bold;"></div></td>
				<td > </td>
			</tr>
		</table>
		</div>  
			
	 <div class="secondStepCF commonHide"  style="display: none;height: 100%;margin-top: 146px;">
		<table border="0" cellpadding="0" cellspacing="0" style=" width:99%; line-height: 10px;" id="monthTb" >
		<tr style="height: 20%;" >
				<td colspan="4">
					<input type="hidden" class="legerId"/>
					<div style="float: left;"><input type="button" value="<< Back" class="secondStepBackBtnCF"/></div>
					<!-- <div style="float: right;"><input type="button" value="BRS" class="showBRS" style="display: none;"/></div> -->
				</td>
			</tr>
			<tr style="height: 2%;">
			    <td style="width:20%"><div  ><b>Months</b></div></td>
				<td style="width:20%"><div  ><b style=" padding-right: 0px; padding-left: 86px;">Debit</b></div></td>
				<td style="width:20%"><div  ><b style="padding-left: 72px;">Credit</b></div></td>
				<td style="width:20%"><div class="" ><b style="padding-left: 10px;">Opening Balance</b></div></td>
				<td style="width:20%"><div class="" ><b style="padding-right: 0px;padding-left: 19px;">Closing Balance</b></div></td>
			</tr>
			<tr><td colspan="5" width= "100%"><div class="hl"></div></td></tr>
			<tr style="height: 100%;">
			<td colspan="5">
				<table border="0" cellpadding="0" cellspacing="0" style="height: 50%; width:100%;" class="highlightTblRw" id="cashFlowStepTwoLedgers">
				 <tr class="secondStepDblClkCF" id="">
				        <td ><input type="hidden" class="month " /></td>
						<td style="width:20%"><input type="text" class="months emptyVal inputClass" readonly="readonly"/></td>
						<td style="width:20%"><div class="drAmt" ></div></td>
						<td style="width:20%"><div class="crAmt" ></div></td>
						<td style="width:20%"><div class="opningBal" ></div></td>
						<td style="width:20% "><div  class="closingBal"></div></td>
					</tr> 
				</table> 
			</td>
			</tr>	
			<tr style="height: 100%;">
			<td colspan="5">
				<table border="0" cellpadding="0" cellspacing="0" style="height: 50%; width:100%;" class="highlightTblRw" id="cashFlowStepTwoLedgerspymt">
				<tr class="secondStepDblClkCFPymnt" id="">
				        <td ><input type="hidden" class="month " /></td>
						<td style="width:20%"><input type="text" class="months emptyVal inputClass" readonly="readonly"/></td>
						<td style="width:20%"><div class="drAmt" ></div></td>
						<td style="width:20%"><div class="crAmt" ></div></td>
						<td style="width:20%"><div class="opningBal" ></div></td>
						<td style="width:20%"><div class="closingBal"></div></td>
					</tr>
				</table> 
			</td>
			</tr>
			
			<tr style="height: 100%;">
			<td colspan="5">
			<table border="0" cellpadding="0" cellspacing="0" style="width:98%;"  class="highlightTblRw" id="monthtotalAmntTabl">
			<tr class="">
				<td style="width:64%"><b>Total :</b><input type="text" class="" readonly="readonly"/></td>
				<td style="width:20%;border-bottom: 1px solid black;border-top: 1px solid black ;padding-right: 212px;"><div class="totaldebit" style="float: left; font-weight: bold;"></div></td>
				<td style="width:20%;border-bottom: 1px solid black;border-top: 1px solid black;padding-right: 26px;"><div class="totalcredit" style="float: left; font-weight: bold;"></div></td>
				<td style="width:20%;border-bottom: 1px solid black;border-top: 1px solid black ;padding-left: 56px;"><div class="totalOpingBal" style="float: left; font-weight: bold;"></div></td>
				<td style="width:20%;border-bottom: 1px solid black;border-top: 1px solid black;padding-right: 80px;padding-left: 115px"><div class="totalClosingBal" style="float: left; font-weight: bold;"></div></td>
				<td > </td>
			</tr>
		</table>
		</td>
		</tr>
			</table>
	</div> 

	
<div class="FirstStepLedger commonHide" style="display: none; height: 100%;margin-top: 146px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 98%; width:99%; display: inline-block; overflow-y: scroll; max-height: 700px;"  
			id="LedgerEntryTableCF" class="highlightTblRw">
			<tr style="height: 20%;" >
				<td colspan="4">
					<!-- <input type="hidden" class="legerId"/> -->
					<div style="float: left;"><input type="button" value="<< Back" class="thiredStepBackBtnCF"/></div>
					<!-- <div style="float: right;"><input type="button" value="BRS" class="showBRS" style="display: none;"/></div> -->
				</td>
			</tr>
			<tr class="excptRow">
				<td style="border-bottom:1pt solid black; border-top:1pt solid black;"><b style="padding-left: 16px;padding-right: 162px;">Date</b></td>
				<td style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b style="padding-right: 130px;">Transation No.</b></td>
				<td style="border-bottom:1pt solid black;  border-top:1pt solid black;"><b style=" padding-left: 1px;padding-right: 7px;">Transation Type</b></td>
				<td style=" border-bottom:1pt solid black; border-top:1pt solid black;"><b style="padding-left: 180px;padding-right: 103px;" >Debit</b></td>
				<td style="width : 20%; border-bottom:1pt solid black; border-top:1pt solid black;"><b style="padding-left: 68px;">Credit</b></td>
				
						
			</tr>
		
		<tr style="height: 100%;">
			<td colspan="5">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 98%; width:100%;" class="highlightTblRw" id="cashFlowStepThiredLedgers">
				<tr class="thiredStepDblClkCFRcpt" id="">
						<!-- <td style="width:20%"><input type="text" class="transDate emptyVal" readonly="readonly"/></td> -->
						<td><input type="text" class="transDate" readonly="readonly"/></td>
						<td style="width:20%"><input type="text" class="tranId emptyVal" readonly="readonly"/></td>
						<td style="width:20%"><input type="text" class="tranDesc emptyVal" readonly="readonly"/></td>
						<td style="width:20%"><div class="drAmt" ></div></td>
						<td style="width:20%"><div class="crAmt"></div></td>
					</tr>
				</table> </td></tr>
	         <tr style="height: 100%;">
			<td colspan="5">
	          <table border="0" cellpadding="0" cellspacing="0" style="height: 98%; width:100%;" class="highlightTblRw" id="cashFlowStepThiredLedgersPymnt">
				<tr class="thiredStepDblClkCFPymt" id="">
						<td style="width:20%"><input type="text" class="transDate emptyVal" readonly="readonly"/></td>
						<td style="width:20%"><input type="text" class="tranId emptyVal" readonly="readonly"/></td>
						<td style="width:20%"><input type="text" class="tranDesc emptyVal" readonly="readonly"/></td>
						<td style="width: 20%;"><div style="width: 86px;" class="drAmt" ></div></td>
						<td style="width: 20%;"><div class="crAmt"></div></td>
					</tr>
				</table></td></tr> 
		</table>
	</div>
		<div class="LegerTransationDetails commonHide" style="display: none; height: 100%;margin-top: 147px;">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 81%; width:99%; display: inline-block; overflow-y: scroll; max-height: 700px;"  
			id="LedgerTransEnty" class="highlightTblRw">
			<tr style="height: 20%;" >
				<td colspan="4">
					<!-- <input type="hidden" class="legerId"/> -->
					<div style="float: left;"><input type="button" value="<< Back" class="fourthStepBackBtnCF"/></div>
					<!-- <div style="float: right;"><input type="button" value="BRS" class="showBRS" style="display: none;"/></div> -->
				</td>
			</tr>
			<tr class="excptRow">
				<td width="25%;" style="border-bottom:1pt solid black; border-top:1pt solid black;"><b style="padding-right: 0px;">Particulars</b></td>
				<td width="25%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b style="padding-left: 0px;padding-right: 24px;">Debit</b></td>
				<td width="25%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;"><b style="padding-left: 204px;padding-right: 220px;">Credit</b></td>
				<td colspan="2" width="25%" style="text-align: right; border-bottom:1pt solid black; border-top:1pt solid black;padding-right:55px;"><b style="padding-right: 40px;">Balance</b></td>
			</tr>
		<tr style="height: 100%;">
			<td colspan="5">
		<table border="0" cellpadding="0" cellspacing="0" style="height: 50%; width:100%;" class="highlightTblRw" id="FourthcashFlowStepLedgers">
				<tr class="" id="">
				<td><input type="text" class="ledName" readonly="readonly"/></td>
				<td style="text-align: right;">
					<div class="drAmt emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="crAmt emptyVal"></div>
				</td>
				<td style="text-align: right;">
					<div class="cumBal emptyVal"></div>
				</td>
				<td style="text-align: left">
					<input type="text" class="cumDrCr" style="width:15px" readonly="readonly"/>
				</td>
					</tr>
				</table> 
				</td></tr> 
		</table>
	</div>
	
	<!-- end cash Flow -->
	
	
	<!-- Accounts Chart Report Start -->
	
	<div class="ACCOUNTSCHART commonHide" style="display: none; height: 100%;margin-top: 155px;">
		<table border="0" cellpadding="0" cellspacing="0" style="width:100%; display: inline-block; overflow-y: scroll;
			max-height: 430px;" id="groupLedgTblId" class="highlightTblRw">
			    <tr class="excptRow">	
					<td style="width:15%;border-bottom:1pt solid black; border-top:1pt solid black;"><b>Group</b></td>
					<td style="width:10%;border-bottom:1pt solid black; border-top:1pt solid black;"><b>Subgroup</b></td>
					<td style="width:13%;border-bottom:1pt solid black; border-top:1pt solid black;"><b>Subgroup</b></td>
					<td style="width:13%;border-bottom:1pt solid black; border-top:1pt solid black;"><b>Ledger</b></td>
				</tr>
				<tr>
					<td class="mainGroup"></td>
					<td class="subGroup1"></td>
					<td class="subGroup2"></td>
					<td class="ledgrName"></td>
				</tr>
		</table>
	</div> 
	
	<!-- Accounts Chart Report End -->
	
</td>
</tr>
</table>
</div>
</body>
</html>
