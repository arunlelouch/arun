<%@include file="TagLibraries.jsp"%>
<%@include file="DataTableImport.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript">
$(document).ready( function () {
	var columns = new Array(); 
	columns.push({'data':'currencyId', 'type': 'string', 'title': 'Currency ID'});
	columns.push({'data':'currencyName', 'type': 'string', 'title': 'Currency Name'});
	columns.push({'data':'currencySymbol', 'type': 'string', 'title': 'Symbol'});
	columns.push({'data': 'Id', 'type': 'image', 'access': 'Edit', 'title':'Edit','url': './Currencyedit.html?action=edit&id='});
	columns.push({'data': 'Id', 'type': 'image', 'access': 'Delete','title':'Delete', 'url': './CurrencyDelete.html?searchOption=true&action=delete&id=&curid', 'props':['Id','currencyId']});
	$(this).mainGridTable(columns, 'CurrencyDO', 'Id');
	
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
											<h5>Currency Master</h5>
										</div>
										<div class="card-block">
											<div class="table-responsive">
											         <input type="search" id="txt_searchall" class="form-control col-sm-2 float-right" placeholder="Enter Currency ID to Search">
                                                     <button class="btn btn-success float-right btn-sm" id="dtSearchBtn" onclick="$(this).dataTblReset('searchId')"><i class="feather icon-refresh-cw"></i>Reset</button>
												<a href="CurrencyMasterCreate.html" class="btn btn-success float-right btn-sm" role="button"><i class="feather icon-file-minus"></i>Create</a>
                                                     <table id="key-act-button" class="table table-bordered table-striped table-condensed" style="width: 100%">
	                                                	<thead class="thead-dark">
	                                                   </thead>
	                                                   </table> 
                                            </div>
											     <table class="searchTable" id="searchId" style="display:none;"><tr><td><input type="text" id="currencyId"  class="textStyle_180 tableField dt_input"/></td> </tr> </table>
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
	             $('#currencyId').val(inputVal);
	             $(this).dataTblSearch();   	
	    });
		
	    
	</script>
</body>
</html>