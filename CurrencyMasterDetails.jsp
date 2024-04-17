<%@include file="TagLibraries.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script type="text/javascript">
$(document).ready(function() {
	jQueryMessageSource.currMaster_msg1 = "<f:message code="currMaster_msg1"></f:message>";
	jQueryMessageSource.currMaster_msg2 = "<f:message code="currMaster_msg2"></f:message>";
	jQueryMessageSource.currMaster_msg3 = "<f:message code="currMaster_msg3"></f:message>";
		
	var form_URL = $('#formURLHidden').val();
	$.fn.validfunction = function(formId, btnID) {
		$(this).validFields(formId, form_URL, btnID);
	}
	
$.fn.name = function(){
		if($(".currencyName").val()=''){
		if($.isNumeric($(".currencyName").val()))
			{
			$(".currencyName").val("");
			swal("","Alphabet only allowes for Name","warning");
			}
		else{
			
			
			//alert("Numbers only allowes for Phone Number")
		}
		}
	}
	
	$.fn.separatorChange = function(checkId) 
	{ 
		if($(this).val() == $('#'+checkId).val())
		{
			$(this).find('option:selected').prop('selected',false);
			
			if($(this).find('option:first').val() == $('#'+checkId).val())
				$(this).find('option:eq(1)').prop('selected',true);
			else
				$(this).find('option:first').prop('selected',true);
			
			$(this).infoAlert(CommonMessageSource.getMessage("currMaster_msg3",[$(this).data('title'),$('#'+checkId).data('title')]));
		}
	};
			
	$.fn.currencySubmitValidation = function() 
	{
		var res = true;
		var decPosval = parseInt($('#decpid').val());
		if((isNaN(decPosval)) || (decPosval <= 0) || (decPosval >= 5))
		{
			//$(this).infoAlert($('#decpid').attr('title')+' should be between 1 & 4');
			$(this).infoAlert(CommonMessageSource.getMessage("currMaster_msg1",[$('#decpid').attr('title')]));
			res = false;
		}				
				
		if($('#numSepId').val() == $('#decSepId').val())
		{
			//$(this).infoAlert($('#numSepId').data('title')+" & "+$('#decSepId').data('title') +" should not be same.");
			$(this).infoAlert("currMaster_msg3",[$('#numSepId').data('title'),$('#decSepId').data('title')]);
			res = false;	
		}
		return res;
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
									<div class="card-header" ><h5>Currency Master</h5></div>
									<div class="card-block">
												<input type="hidden" value="${url}" id="formURLHidden" />
												<form:form modelAttribute="currencyMO" id="curMasterFormId" method="POST">
													<div class="row">
														<div class="form-group col-sm-3">
															<label>Currency ID<span style="color: red">*</span></label>
															<form:input path="currencyDO.currencyId" class="form-control input-sm validateClass" onkeyup="$(this).upperCase()"/>
														</div>
														<div class="form-group col-sm-3">
															<label>Currency Name<span style="color: red">*</span></label>
															<form:input path="currencyDO.currencyName" class="form-control input-sm validateClass currencyName" onblur="$(this).name();"/>
														</div>
														<div class="form-group col-sm-3">
															<label>Decimal Position</label>
															<form:input path="currencyDO.decPost" class="form-control input-sm decPost number" />
														</div>
														<div class="form-group col-sm-3">
															<label>Currency Symbol</label>
															<form:input path="currencyDO.currencySymbol" class="form-control input-sm"/>
														</div>
													</div>
													<div class="row">
														<div class="form-group col-sm-3">
															<label>Decimal Name</label>
															<form:input path="currencyDO.decName" class="form-control input-sm"/>
														</div>
														<div class="form-group col-sm-3">
															<label>Currency System</label>
															<form:select path="currencyDO.curSys" class="form-control">
											                    <c:forEach items="${currencyMO.getComboCurrency()}" var="var01">
											                    <form:option value="${var01.comboField}">${var01.text}</form:option>
											                    </c:forEach>
											                </form:select>
											                <form:hidden path="currencyDO.id" />
														</div>
														<div class="form-group col-sm-3">
															<label>Rounding Off</label>
															<form:input path="currencyDO.roundingOff" class="form-control input-sm"/>
														</div>
														<div class="form-group col-sm-3">
															<label>Number Separated By</label>
															<form:select path="currencyDO.separatedBy" data-title='"${numSeparatedBy}"' class="form-control numSep" id="numSepId" onchange="$(this).separatorChange('decSepId');">
											                    <c:forEach items="${currencyMO.getComboNumSysSep()}" var="var01">
											                	    <form:option value="${var01.comboField}">${var01.text}</form:option>
											                    </c:forEach>
											                </form:select>
														</div>
													</div>
													<div class="row">
														<div class="form-group col-sm-3">
															<label>Decimal Separated By</label>
															<form:select path="currencyDO.decimalSeparatedBy" data-title='"${decSeparatedBY}"' onchange="$(this).separatorChange('numSepId');" id="decSepId" class="form-control decSep">
											                    <c:forEach items="${currencyMO.getComboDecSep()}" var="var01">
											                    	<form:option value="${var01.comboField}">${var01.text}</form:option>
											                    </c:forEach>
											                </form:select>
														</div>
													</div>
													<div class="row" style="float: right;">
														<a href="./CurrencyMasterSearch.html" class="btn btn-danger btn-sm" role="button">Cancel</a>
														<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('curMasterFormId','btnId');" id="btnId">
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