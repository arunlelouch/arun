<%@include file="TagLibraries.jsp"%>
<%@include file="DataTableImport.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="resources/Javascript/Analysis.js"></script>
<meta charset="ISO-8859-1">
<script type="text/javascript">
	$(document).ready(function() {
	
		var columns = new Array();
		columns.push({ 'data' : 'analysisId', 'type' : 'string','title' : 'Analysis Id'});
		columns.push({ 'data' : 'truckNo','type' : 'string','title' : 'Truck No'});
		columns.push({'data' : 'supplierName','type' : 'string','title' : 'SupplierName'});
		columns.push({'data' : 'date','type' : 'date','title' : 'Date'});
		columns.push({'data' : 'total','type' : 'decimal','title' : 'Total'});
		columns.push({'data' : 'region','type' : 'string','title' : 'Region'});
		
		columns.push({'data' : 'analysis_Id','type' : 'image','title' : 'Edit','access' : 'Edit','url' : './AnalysisEdit.html?action=edit&id=','props' : [ 'analysis_Id' ]});
		columns.push({'data' : 'analysis_Id','type' : 'image','title' : 'Delete','access' : 'Delete','url' : './AnalysisDelete.html?action=delete&id=','props' : [ 'analysis_Id' ]});
		$(this).mainGridTable(columns, 'AnalysisViewDO', 'analysis_Id');
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
											<h5>Analysis Info</h5>
										</div>
										<div class="card-block">
											<div class="table-responsive">
												<input type="search" id="txt_searchall"
													class="form-control col-sm-2 float-right"
													placeholder="Enter Analysis ID to Search"
													onkeyup="$(this).upperCase()">
												<button class="btn btn-success float-right btn-sm"
													id="dtSearchBtn" onclick="$(this).dataTblReset('searchId')">
													<i class="feather icon-refresh-cw"></i>Reset
												</button>
												<a href="./AnalysisCreate.html?action=create"
													class="btn btn-success float-right btn-sm" role="button"><i
													class="feather icon-file-minus"></i>Create</a>
												<table id="key-act-button"
													class="table table-bordered table-striped table-condensed"
													style="width: 100%">
													<thead class="thead-dark">
													</thead>
												</table>
											</div>
											 <table class="searchTable" id="searchId"
												style="display: none;">
												<tr>
													<td><input type="text" id="analysisId"
														class="textStyle_180 tableField dt_input" /></td>
												</tr>
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
	<script type="text/javascript">
		if ($('#successMsg').val() != "") {
			var msg = $('#successMsg').val();
			swal("", msg, "success");
		} else if ($('#errorMessage').val() != "") {
			var msg = $('#errorMsg').val();
			swal("", msg, "error");
		}

		$('#txt_searchall').on('keyup', function() {
			var inputVal = $('#txt_searchall').val();
			$('#analysisId').val(inputVal);
			$(this).dataTblSearch();
		});
	</script>
</body>
</html>