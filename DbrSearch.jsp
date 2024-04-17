<%@include file="TagLibraries.jsp"%>
<%@include file="DataTableImport.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript">

$(document).ready( function () {
	
	$('#txt_searchall').on( 'keyup', function (){
        var inputVal=$('#txt_searchall').val();
             $('#dbrId').val(inputVal);
             $(this).dataTblSearch();   	
    });
	
	var pageURL = $(location).attr("href");
	
	 if(!pageURL.includes("alert")){
		 if($('#succMsg').val()!='')
			 {
			alert($('#succMsg').val());
			 }
			 var url =pageURL+"alert";
			window.location.href = url;
		}
	 
	  if((pageURL.includes("errorMessage"))&&(!pageURL.includes("alert"))){
			alert($('#errorMsg').val());
			 var url =pageURL+"alert";
			window.location.href = url;
		} 

	var columns = new Array();
	 columns.push({'data':'compId', 'type': 'Integer', 'visible': 'false'});
	 columns.push({'data':'companyName','type':'string', 'title': 'Company Name'});  
	columns.push({'data':'dbrId', 'type': 'string', 'title': 'DBR ID'});
	columns.push({'data':'bank', 'type': 'string', 'title': 'Bank'});
	columns.push({'data':'branch', 'type': 'string', 'title': 'Branch'});
	columns.push({'data':'account', 'type': 'string', 'title': 'Account'});
	columns.push({'data':'status', 'type': 'string', 'title': 'Status'});
	columns.push({'data':'totalRecipts', 'type': 'decimal', 'title': 'Total Receipts'});
	columns.push({'data':'totalPaymnts', 'type': 'decimal', 'title': 'Total Payments'});
	columns.push({'data': 'dbr_Id', 'type': 'image', 'access': 'Edit', 'title':'Edit','url': './DBREdit.html?action=edit&id='});
	columns.push({'data': 'dbr_Id', 'type': 'image', 'access': 'Delete','title':'Delete', 'url': './DBRDelete.html?searchOption=true&action=delete&id='});
	$(this).mainGridTable(columns, 'DBRViewDO', 'dbr_Id');
	
	$(this).dataTblReset('searchId');
});
</script>
</head>
<body>

 <input type="hidden" value="${errorMessage}" id="errorMsg" />
    <input type="hidden" id="succMsg"  value="${successMessage}" /> 
	<%-- <input type="hidden" value="${errorMessage}" id="errorMessage" />
    <input type="hidden" value="${successMessage}" id="successMsg" /> --%>
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
											<h5>DBR Info</h5>
										</div>
										<%-- <c:if test="${not empty successMessage }"><tr><td align="center"><ul><li class="success" id="successMsg" style="color:green">${successMessage}</li></ul></td></tr></c:if>
	                                    <c:if test="${not empty errorMessage }"><tr><td align="center"><ul><li class="errorBlock" id="errorMessage" style="color:red">${errorMessage}</li></ul></td></tr></c:if> --%>
										<div class="card-block">
											<div class="table-responsive">
											         <input type="search" id="txt_searchall" class="form-control col-sm-2 float-right" placeholder="Enter DBR Id to Search">
                                                     <button class="btn btn-success float-right btn-sm" id="dtSearchBtn" onclick="$(this).dataTblReset('searchId')"><i class="feather icon-refresh-cw"></i>Reset</button>
													<a href="DBRHome.html" class="btn btn-success float-right btn-sm" role="button"><i class="feather icon-file-minus"></i>Create</a>
                                                     <table id="key-act-button" class="table table-bordered table-striped table-condensed" style="width: 100%">
	                                                	<thead class="thead-dark">
	                                                   </thead>
	                                                   </table> 
                                            </div>
											     <table class="searchTable" id="searchId" style="display:none;"><tr><td><input type="text" id="dbrId"  class="textStyle_180 tableField dt_input"/></td> </tr> </table>
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
	    
	    
		
	    
	</script>
</body>
</html>