<%@include file="TagLibraries.jsp"%>
<%@include file="DataTableImport.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Insurance</title>
<script type="text/javascript">
	var columns = new Array();
	$(document).ready(function() {
		columns.push({'data' : 'accessid','type' : 'string','title' : 'Access Id'});
		columns.push({'data' : 'accessdescrip','type' : 'string','title' : 'Access Description'});
		columns.push({'data' : 'Id','type' : 'image','title' : 'Edit','access' : 'Edit','url' : './AccessListedit.html?action=edit&id='});
		$(this).mainGridTable(columns, 'AccessListDO', 'accessid');
		
		$(this).dataTblReset('searchId');
	});

	$(document).ready(function() {

		if ($('#successMsg').val() != "") {
			var msg = $('#successMsg').val();
			swal("", msg, "success");
		} else if ($('#errorMessage').val() != "") {
			var msg = $('#errorMessage').val();
			swal("", msg, "error");
		}

		$('#txt_searchall').on('keyup', function() {
			var inputVal = $('#txt_searchall').val();
			$('#accessid').val(inputVal);
			$(this).dataTblSearch();
		});
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
							<!-- [ Main Content ] start -->
							<div class="row">
								<div class="col-sm-12">
									<div class="card" style="">
										<div class="card-header">
											<h5>Access List Info</h5>
										</div>
										<div class="card-block">
											<div class="table-responsive">
												<input type="search" id="txt_searchall"
													class="form-control col-sm-2 float-right"
													placeholder="Enter ID or Description to Search">
												<button class="btn btn-success float-right" id="dtSearchBtn"
													onclick="$(this).dataTblReset('searchId')">
													<i class="feather icon-refresh-cw"></i>Reset
												</button>
												<a href="AccessListCreate.html"
													class="btn btn-success float-right" role="button"><i
													class="feather icon-file-minus"></i>Create</a>
												<table id="key-act-button"
													class="table table-bordered table-striped table-condensed"
													style="width: 100%">
													<thead class="thead-dark">
													</thead>
												</table>
											</div>
									<!-- 		<table id="key-act-button"
												class="display table nowrap table-striped table-hover"
												style="width: 100%"></table> -->
											<table class="searchTable" id="searchId"
												style="display: none;">
												<tr>
													<td><input type="text" id="accessid" class="textStyle_180 accessid dt_input" /></td>
													<td><input type="text" id="access_descrip" class="dt_input access_descrip"/></td>
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
    
    if($('#successMsg').val()!="" ) { var msg=$('#successMsg').val();  swal("",msg,"success");   }
	else if($('#errorMessage').val()!=""){    var msg=$('#errorMsg').val();  swal("",msg, "error");  }
    
    $('#txt_searchall').on( 'keyup', function (){
        var inputVal=$('#txt_searchall').val();
             $('#accessid').val(inputVal);
             $("#access_descrip").val(inputVal);
             $(this).dataTblSearch();   	
    });
	
    
    </script>
</body>
</html>
