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
	columns.push({'data':'fromcurrency', 'type': 'string', 'title': 'From Currency'});
	columns.push({'data':'toCurrency', 'type': 'string', 'title': 'To Currency'});
	columns.push({'data':'frequency', 'type': 'string', 'title': 'Frequency'});
	columns.push({'data':'startDt', 'type': 'date', 'title': 'Start Date'});
	columns.push({'data':'endDt', 'type': 'date', 'title': 'End Date'});
	columns.push({'data':'currencyRate', 'type': 'float', 'title': 'Rate'});
	columns.push({'data':'active', 'type': 'string', 'title': 'Active'});
	
	columns.push({'data': 'Id', 'type': 'image', 'access': 'Edit','title':'Edit', 'url': './CurrencyRateView.html?action=edit&currencyRateId='});
	columns.push({'data': 'Id', 'type': 'image', 'access': 'Delete','title':'Delete', 'url': './currencyRateDelete.html?searchOption=true&action=delete&currencyRateId='});
	$(this).mainGridTable(columns, 'ExchangeViewDO', 'Id');
	
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
											<h5>Currency Rate Info</h5>
										</div>
										<div class="card-block">
											<div class="table-responsive">
											         <input type="search" id="txt_searchall" class="form-control col-sm-2 float-right" placeholder="Enter From Currency to Search">
                                                     <button class="btn btn-success float-right btn-sm" id="dtSearchBtn" onclick="$(this).dataTblReset('searchId')"><i class="feather icon-refresh-cw"></i>Reset</button>
												<a href="CurrencyRateCreate.html" class="btn btn-success float-right btn-sm" role="button"><i class="feather icon-file-minus"></i>Create</a>
                                                     <table id="key-act-button" class="table table-bordered table-striped table-condensed" style="width: 100%">
	                                                	<thead class="thead-dark">
	                                                   </thead>
	                                                   </table> 
                                            </div>
											     <table class="searchTable" id="searchId" style="display:none;"><tr><td><input type="text" id="fromcurrency"  class="textStyle_180 tableField dt_input"/></td> </tr> </table>
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
		else if($('#errorMessage').val()!=""){    var msg=$('#errorMessage').val();  swal("",msg, "error");  }
	    
	    $('#txt_searchall').on( 'keyup', function (){
	        var inputVal=$('#txt_searchall').val();
	             $('#fromcurrency').val(inputVal);
	             $(this).dataTblSearch();   	
	    });
		
	    
	</script>
</body>
</html>