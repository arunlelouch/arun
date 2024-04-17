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
	columns.push({'data':'compId', 'type': 'Integer', 'visible': 'false'});
	columns.push({'data':'companyName', 'type': 'string', 'title': 'Company Name'});
	 columns.push({'data':'bankId', 'type': 'string', 'title': 'Bank Id'});
	columns.push({'data':'bankName', 'type': 'string', 'title': 'Bank Name'}); 
	columns.push({'data':'branchId', 'type': 'string', 'title': 'Branch Id'});
	columns.push({'data':'branchName', 'type': 'string', 'title': 'Branch Name'});
	columns.push({'data':'accountNum', 'type': 'string', 'title': 'Account Number'});
	columns.push({'data': 'bankID', 'type': 'image', 'access': 'Edit', 'title':'Edit', 'url': './BankMasterEdit.html?action=edit&id='});
	columns.push({'data': 'bankID', 'type': 'image', 'access': 'Delete', 'title':'Delete', 'url': './BankMasterDelete.html?searchOption=true&action=delete&&bankId=&id=','props':['bankId','bankID']});
	$(this).mainGridTable(columns, 'BankSearchViewDO', 'bankID');
	
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
											<h5>Bank Master Info</h5>
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
											         <input type="search" id="txt_searchall" class="form-control col-sm-2 float-right" placeholder="Enter Bank Name to Search">
                                                     <button class="btn btn-success float-right btn-sm" id="dtSearchBtn" onclick="$(this).dataTblReset('searchId')"><i class="feather icon-refresh-cw"></i>Reset</button>
													<a href="BankMasterCreate.html" class="btn btn-success float-right btn-sm" role="button"><i class="feather icon-file-minus"></i>Create</a>
                                                     <table id="key-act-button" class="table-bordered table-condensed display table nowrap table-striped table-hover" style="width: 100%">
	                                                	<thead class="thead-dark">
	                                                   </thead>
	                                                   </table> 
                                            </div>
											     <table class="searchTable" id="searchId" style="display:none;"><tr><td><input type="text" id="bankName"  class="dt_input"/></td> </tr> </table>
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
	             $('#bankName').val(inputVal);
	             $(this).dataTblSearch();   	
	    });
		
	    
	</script>
</body>
</html>