<%@include file="TagLibraries.jsp"%>
<%@include file="DataTableImport.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript">
$(document).ready( function () {
	var columns = new Array();
	columns.push({'data':'countryId', 'type': 'string', 'title': 'Country ID'});
	columns.push({'data':'countryName', 'type': 'string', 'title': 'Country  Name'});
	columns.push({'data':'countryCode', 'type': 'string', 'title': 'Country Code'});
	columns.push({'data':'currencyDO.currencyName', 'type': 'string', 'title': 'Currency'});
	columns.push({'data':'continentDO.continentName', 'type': 'string', 'title': 'Continent'});
	columns.push({'data': 'Id', 'type': 'image', 'access': 'Edit', 'title':'Edit','url': './CountryMasterEdit.html?action=edit&id='});
//	columns.push({'data': 'Id', 'type': 'image', 'access': 'Delete','title':'Delete', 'url': './CountryDetailsDelete.html?action=delete&id='});
	$(this).mainGridTable(columns, 'CountryDO', 'Id');
	
	$(this).dataTblReset('searchId');
});
</script>
</head>
<body>
	<input type="hidden" value="${errorMessage}" id="errorMessage" />
    <input type="hidden" value="${successMessage}" id="successMsg" />
	<div class="pcoded-main-container">
		<div class="pcoded-wrapper">
			<div class="pcoded-content">
				<div class="pcoded-inner-content">
					<div class="main-body">
						<div class="page-wrapper">
							<div class="row">
								<div class="col-sm-12">
									<div class="card" style="">
										<div class="card-header">
											<h5>Country Master Info</h5>
										</div>
										<div class="card-block">
											<div class="table-responsive" id="dataSerachHideId" style="display:none">
		                                      <br>  <table class="searchTable table table-striped" id="searchid"  >  
										            <tr>  
										                  <td><input type="text" id="companyName" /></td> 
		                                             </tr>
		                                       </table>
                                                 <button class="btn btn-success float-right" type="button" value="Search" id="dtSearchBtnHide" onclick="$(this).dataTblSearch();"><i class="feather icon-search"></i>SEARCH</button>   
                                            </div> 
											<div class="table-responsive">
											         <input type="search" id="txt_searchall" class="form-control col-sm-2 float-right" placeholder="Enter Country Id to Search">
                                                     <button class="btn btn-success float-right btn-sm" id="dtSearchBtn" onclick="$(this).dataTblReset('searchId')"><i class="feather icon-refresh-cw"></i>Reset</button>
													<a href="CountryCreate.html" class="btn btn-success float-right btn-sm" role="button"><i class="feather icon-file-minus"></i>Create</a>
                                                     <table id="key-act-button" class="table-bordered table-condensed display table nowrap table-striped table-hover" style="width: 100%">
	                                                	<thead class="thead-dark">
	                                                   </thead>
	                                                   </table> 
                                            </div>
											     <table class="searchTable" id="searchId" style="display:none;"><tr><td><input type="text" id="countryId"  class="dt_input"/></td> </tr> </table>
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
	<script type="text/javascript">
    
	    if($('#successMsg').val()!="" ) { var msg=$('#successMsg').val();  swal("",msg,"success");   }
		else if($('#errorMessage').val()!=""){    var msg=$('#errorMsg').val();  swal("",msg, "error");  }
	    
	    $('#txt_searchall').on( 'keyup', function (){
	        var inputVal=$('#txt_searchall').val();
	             $('#countryId').val(inputVal);
	             $(this).dataTblSearch();   	
	    });
		
	    
	</script>
</body>
</html>





<%-- <%@include file="TagLibraries.jsp"%>
<%@include file="DataTableImport.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
$(document).ready( function () {
	var pathNames = new Array();
	pathNames.push("countryDO.countryId");
	pathNames.push("countryDO.countryName");
	pathNames.push("countryDO.countryCode");
	pathNames.push("countryDO.currencyDO.Id");
	
	$.fn.editRow = function(val){
		var options = $("#currency").find('option');
		$(this).addClass('imgBlur');
		var $row = $(this).closest('tr');
		var $tds = $row.find("td").not(':nth-last-child(-n+3)');
		$row.find("td input#btnId").removeClass("imgBlur");
		$.each($tds,function(k,v){
			var txt = $(this).text();
			if(k==3){
				$(this).html("").append('<select name="'+pathNames[k]+'" class="form-control currencyData"></select>');
				$('.currencyData').find('option').remove().end().append(options).val('');
				var val = $('.currencyData').find('option[data-name="'+txt+'"]').val();
				$('.currencyData').find('option[value="'+txt+'"]').prop('selected',true);
			}
			else $(this).html("").append('<input name="'+pathNames[k]+'" value="'+txt+'" class="form-control"/>');
		});
		$row.find('td:first').append('<input name="countryDO.Id" type="hidden" value="'+val.Id+'"/>');
	}
	
	$.fn.saveData = function(val){
		var form_URL = $('#formURLHidden').val();
		if(val != '' && val != null && val != 'undefined'){
			form_URL = form_URL+'?action=Edit';
		}else{
			form_URL = form_URL+'?action=create';
		}
		$(this).validFields('countryFormId', form_URL, 'btnId');
	}
	
	$.fn.closeRow = function(){
		$('table#key-act-button > tbody > tr:first').remove();
	}
	
	$.fn.addCountry = function(){
		var options = $("#currency").find('option');
		$('<tr><td><input type="hidden" name="countryDO.Id"/><input name="countryDO.countryId" class="form-control" onkeyup="$(this).upperCase();" maxlength="12" autocomplete="off"/></td>'
		+'<td><input name="countryDO.countryName" class="form-control" autocomplete="off"/></td>'
		+'<td><input name="countryDO.countryCode" class="form-control" onkeyup="$(this).upperCase();" maxlength="12" autocomplete="off"/></td>'
		+'<td><select name="countryDO.currencyDO.Id" class="form-control currencyData"><option value="">Select</option></select></td>'
		+'<td><input type="button" class="btn btn-primary btn-sm" value="Save" id="btnId" onclick="$(this).saveData()" /></td>'
		+'<td><input type="button" class="btn btn-danger btn-sm" value="Cancel" id="btnId" onclick="$(this).closeRow()" /></td>'
		+'</tr>').insertBefore('table#key-act-button > tbody > tr:first');
		$('.currencyData').find('option').remove().end().append(options).val('');
	}
	
	var columns = new Array(); 
	columns.push({'data':'countryId', 'type': 'string', 'title': 'Country ID'});
	columns.push({'data':'countryName', 'type': 'string', 'title': 'Country Name'});
	columns.push({'data':'countryCode', 'type': 'string', 'title': 'Country Code'});
	columns.push({'data':'currencyDO.currencyName', 'type': 'string', 'title': 'Currency'});
	columns.push({'data': 'Id', 'type': 'button', 'access': 'saveAs', 'value':'Save', 'id':'btnId', 'title':'Save','onclick': '$(this).saveData()', 'props':['Id']});
	columns.push({'data': 'Id', 'type': 'button', 'access': 'Edit', 'value':'Update', 'title':'Edit','onclick': '$(this).editRow()', 'props':['Id']});
	columns.push({'data': 'Id', 'type': 'image', 'access': 'Delete', 'title':'Delete', 'url': './CountryDelete.html?searchOption=true&action=delete&id='}); 
	$(this).mainGridTable(columns, 'CountryDO', 'Id');
});
</script>
</head>
<body>
	<input type="hidden" value="${errorMessage}" id="errorMessage" />
    <input type="hidden" value="${successMessage}" id="successMsg" />
	<div class="pcoded-main-container">
		<div class="pcoded-wrapper">
			<div class="pcoded-content">
				<div class="pcoded-inner-content">
					<div class="main-body">
						<div class="page-wrapper">
							<div class="row">
								<div class="col-sm-12">
									<div class="card" style="">
										<div class="card-header">
											<h5>Country Info</h5>
										</div>
										<div class="card-block">
											<input type="hidden" value="./CountryCreateOrUpdate.html" id="formURLHidden" />
											<form:form  modelAttribute="countryMO" id="countryFormId" method="POST">
											<div class="table-responsive">
										         <input type="search"  id="txt_searchall" class="form-control col-sm-2 float-right" placeholder="Enter Country Name to Search" >
                                                    <button class="btn btn-success float-right btn-sm" id="dtSearchBtn" onclick="$(this).dataTblReset('searchId')"><i class="feather icon-refresh-cw"></i>Reset</button>
                                                    <input type="button" class="btn btn-primary float-right btn-sm " onclick="$(this).addCountry()" value="Add">
                                                    <table id="key-act-button" class="table table-bordered table-striped table-condensed" style="width: 100%">
                                                	<thead class="thead-dark">
                                                   </thead>
                                                   </table> 
                                            </div>
											     <table class="searchTable" id="searchId" style="display:none;"><tr><td><input type="text" id="countryName"  class="textStyle_180 tableField dt_input"/></td> </tr> </table>
											<select id="currency" style="display: none">
												<c:forEach items="${countryMO.getCurrencyDOsList()}" var="i">
													<option data-name=${i.currencyName} value="${i.id}">${i.currencyName}</option>
												</c:forEach>
											</select> 
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
	<script type="text/javascript">
	    if($('#successMsg').val()!="" ) { var msg=$('#successMsg').val();  swal("",msg,"success");   }
		else if($('#errorMessage').val()!=""){    var msg=$('#errorMsg').val();  swal("",msg, "error");  }
	    
	    $('#txt_searchall').on( 'keyup', function (){
	        var inputVal=$('#txt_searchall').val();
	             $('#countryName').val(inputVal);
	             $(this).dataTblSearch();   	
	    });
	</script>
</body>
</html> --%>