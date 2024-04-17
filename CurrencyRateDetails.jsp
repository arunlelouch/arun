<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
								<div class="card">
									<div class="card-header" ><h5>Currency Rate Create</h5></div>
									<div class="card-block">
												<input type="hidden" value="${url}" id="formURLHidden" />
												<form:form modelAttribute="currencyMo" id="curRateFormId" method="POST">
													<div class="row">
														<div class="form-group col-sm-3">
															<label>From Currency<span style="color: red">*</span></label>
															<form:hidden path="exchangeRateDO.id" />
															<form:hidden path="" id ="fromCurrency"/>
													        <form:select path="exchangeRateDO.fromCurrencyDO.id"  id ="frmcurency" disabled="${editBoolean}" class="form-control validateClass" >
												             	<option value=""><f:message code="label.select"/></option>
												                <c:forEach items="${currencyMo.getCurrencyNameList()}" var="list">
												                      <form:option value= "${list.id}" >${list.currencyName} </form:option>
												                </c:forEach>
												             </form:select>
														</div>
														<div class="form-group col-sm-3">
															<label>To Currency<span style="color: red">*</span></label>
															 <form:select path="exchangeRateDO.toCurrencyDO.id" id ="tocurency" disabled="${editBoolean}" class="form-control validateClass">
												                 <option value=""><f:message code="label.select"/></option>
												                   <c:forEach items="${currencyMo.getCurrencyNameList()}" var="list1">
												                          <form:option value= "${list1.id}">${list1.currencyName} </form:option>
												                    </c:forEach>
												             </form:select>
														</div>
														<div class="form-group col-sm-3">
															<label>Frequency</label>
															<form:select path="exchangeRateDO.frequency" class="form-control" size="1">
																<c:forEach items="${currencyMo.getComboFrequency()}" var="var01">
																	<form:option value="${var01.comboField}">${var01.text}</form:option>
																</c:forEach>
												              </form:select>
														</div>
														<div class="form-group col-sm-3">
															<label>Active</label>
															<form:select path="exchangeRateDO.active" class="form-control">
																<c:forEach items="${currencyMo.getComboActive()}" var="var01">
																		<form:option value="${var01.comboField}">${var01.text}</form:option>
																</c:forEach>
													         </form:select>
														</div>
													</div>
													<div class="row">
														<div class="form-group col-sm-3">
															<label>Start Date</label>
															<form:input path="exchangeRateDO.startDate" class="form-control input-sm date"/>
														</div>
														<div class="form-group col-sm-3">
															<label>End Date</label>
															<form:input path="exchangeRateDO.endDate" class="form-control input-sm date"/>
														</div>
														<div class="form-group col-sm-3">
															<label>Currency Rate</label>
															<form:input path="exchangeRateDO.currencyRate" class="form-control input-sm decimal validateField"/>
														</div>
													</div>
													<div class="row" style="float: right;">
														<a href="./CurrencyRateSearch.html" class="btn btn-danger btn-sm" role="button">Cancel</a>
														<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('curRateFormId','btnId');" id="btnId">
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