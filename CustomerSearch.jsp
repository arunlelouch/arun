<%@include file="TagLibraries.jsp"%>
<%@include file="DataTableImport.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript">
var columns = new Array(); 
$(document).ready( function () {
	columns.push({'data':'intId', 'type': 'string', 'title': 'Int Id'});
	columns.push({'data':'name', 'type': 'string', 'title': 'Name'});
  	columns.push({'data':'gender', 'type': 'string', 'title': 'Gender'});
	columns.push({'data':'phone', 'type': 'string', 'title': 'Phone Number'});
	columns.push({'data':'email', 'type': 'string', 'title': 'E-mail Address'});
	columns.push({'data': 'Id', 'type': 'image', 'title': 'Edit', 'access': 'Edit', 'url': './CustomerEdit.html?action=edit&id='});
	columns.push({'data': 'Id', 'type': 'image', 'access': 'Delete','title': 'Delete', 'url': './CustomerDelete.html?action=delete&id='});
	$(this).mainGridTable(columns, 'CustomerDO', 'Id');
	
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
											<h5>Customer Search</h5>
										</div>
										<div class="card-block">
											<div class="table-responsive">
											         <input type="search" id="txt_searchall" class="form-control col-sm-2 float-right" placeholder="Enter Name to Search">
                                                     <button class="btn btn-success float-right btn-sm" id="dtSearchBtn" onclick="$(this).dataTblReset('searchId')"><i class="feather icon-refresh-cw"></i>Reset</button>
													<a href="CustomerCreate.html" class="btn btn-success float-right btn-sm" role="button"><i class="feather icon-file-minus"></i>Create</a>
                                                     <table id="key-act-button" class="table table-bordered table-striped table-condensed" style="width: 100%">
	                                                	<thead class="thead-dark">
	                                                   </thead>
	                                                   </table> 
                                            </div>
											     <table class="searchTable" id="searchId" style="display:none;"><tr><td><input type="text" id="name"  class="textStyle_180 tableField dt_input"/></td> </tr> </table>
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
	             $('#name').val(inputVal);
	             $(this).dataTblSearch();   	
	    });
		
	    
	</script>
</body>
</html>