<%@include file="TagLibraries.jsp"%>
<%@include file="DataTableImport.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
 var subColumns = new Array();
 var titles =  {
 	};
 		 
 
$(document).ready( function () {
	var columns = new Array(); 
	columns.push({'data':'companyId', 'type': 'string', 'title': 'Company Id'});
	columns.push({'data':'companyName', 'type': 'string', 'title': 'Company Name'});
	columns.push({'data': 'Id', 'type': 'image','access': 'Edit','title':'Edit', 'url': './CompanyEdit.html?action=edit&id='});
	columns.push({'data': 'Id', 'type': 'image', 'access': 'Delete', 'title':'Delete', 'url': './CompanyDelete.html?action=delete&&companyID=&id=','props':['companyId','Id']});
	$(this).mainGridTable(columns, 'CompanyDO', 'companyId');
	
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
											<h5>Company Search</h5>
										</div>
										<div class="card-block">
											<div class="table-responsive">
												<input type="search" id="txt_searchall" class="form-control col-sm-2 float-right input-sm" placeholder="Enter User ID to Search">
												<button class="btn btn-success float-right btn-sm" id="dtSearchBtn"
													onclick="$(this).dataTblReset('searchId')">
													<i class="feather icon-refresh-cw"></i>Reset
												</button>
												<a href="./CompanyCreate.html?action=create">
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
														<td><input type="text" id="companyId"
															class="textStyle_180 userId dt_input" /></td>
													</tr>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="card" id="subGridCardId" style="display: none;">
										<div class="card-header" style="margin-top: 11px;">
											<h3 id="" style="color: #2687b6;">User-Roles</h3>
											<div class="card-header-right">
												<div class="btn-group card-option">
													<button type="button" class="btn dropdown-toggle btn-icon"
														data-toggle="dropdown" aria-haspopup="true"
														aria-expanded="false">
														<i class="feather icon-more-horizontal"></i>
													</button>
													<ul
														class="list-unstyled card-option dropdown-menu dropdown-menu-right"
														x-placement="bottom-end"
														style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(45px, 45px, 0px);">
														<li class="dropdown-item full-card"><a href="#!"><span
																style=""><i class="feather icon-maximize"></i>
																	maximize</span><span style="display: none;"><i
																	class="feather icon-minimize"></i> Restore</span></a></li>
														<li class="dropdown-item minimize-card"><a href="#!"><span><i
																	class="feather icon-minus"></i> collapse</span><span
																style="display: none"><i
																	class="feather icon-plus"></i> expand</span></a></li>
													</ul>
												</div>
											</div>
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
             $('#companyId').val(inputVal);
             $(this).dataTblSearch();   	
    });
</script>

</body>
</html>
