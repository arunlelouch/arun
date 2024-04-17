<%@include file="TagLibraries.jsp"%>
<%@include file="DataTableImport.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
 var subColumns = new Array();
$(document).ready( function () {
	var columns = new Array();
	/* columns.push({'data':'companyDO.Id', 'type': 'Integer', 'visible': 'false'}); */
	columns.push({'data':'CompanyId', 'type': 'Integer', 'visible': 'false'});
	columns.push({'data':'branchId', 'type': 'string', 'title': 'Branch Id'});
	columns.push({'data':'branchName', 'type': 'string', 'title': 'Branch Name'});
	/* columns.push({'data':'CompanyId', 'type': 'Integer', 'title': 'Company Id'}); */
	columns.push({'data':'managerName', 'type': 'string', 'title': 'Branch Manager Name'});
	columns.push({'data':'active', 'type': 'string', 'title': 'Active'});
	
	columns.push({'data': 'Id', 'type': 'image', 'access': 'Edit', 'title':'Edit', 'url': './LocationEdit.html?action=edit&lid='});
	columns.push({'data': 'Id', 'type': 'image', 'access': 'Delete', 'title':'Delete', 'url': './LocationDelete.html?action=delete&lid=&branchId=', 'props': ['Id', 'branchId']});
	$(this).mainGridTable(columns, 'BranchMasterViewDO', 'branchId');
	
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
									<div class="card">
										<div class="card-header">
											<h5>Branch Master Search</h5>
										</div>
										<div class="card-block">
											<div class="table-responsive">
												<input type="search" id="txt_searchall" class="form-control col-sm-2 float-right input-sm" placeholder="Enter Branch Name to Search">
												<button class="btn btn-success float-right btn-sm" id="dtSearchBtn"
													onclick="$(this).dataTblReset('searchId')">
													<i class="feather icon-refresh-cw"></i>Reset
												</button>
												<a href="./LocationCreate.html?action=create">
													<button class="btn btn-success float-right btn-sm">
														<i class="feather icon-file-minus"></i>Create
													</button>
												</a>
												<table id="key-act-button"
													class="table table-bordered table-striped table-condensed"
													style="width: 100%">
													<thead class="thead-dark">
													</thead>
												</table>
												<table class="searchTable" id="searchId"
													style="display: none;">
													<tr>
														<td><input type="text" id="branchName"
															class="textStyle_180 userId dt_input" /></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="card" id="subGridCardId" style="display: none;">
										<div class="card-header">
											<h5>User-Roles</h5>
										</div>

										<div class="card-block">
											<div class="table-responsive">
												<table id="subTable_id"
													class="table table-bordered table-striped table-condensed"
													style="width: 100%">
													<thead class="thead-dark">
													</thead>
												</table>
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
	</div>
	<script type="text/javascript">
    
    if($('#successMsg').val()!="" ) { var msg=$('#successMsg').val();  swal("",msg, "success");   }
	else if($('#errorMessage').val()!=""){    var msg=$('#errorMessage').val();  swal("",msg, "error");  }
    
    $('#txt_searchall').on( 'keyup', function (){
        var inputVal=$('#txt_searchall').val();
             $('#branchName').val(inputVal);
             $(this).dataTblSearch();   	
    });
</script>

</body>
</html>
