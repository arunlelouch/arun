<%@include file="TagLibraries.jsp"%>
<%@include file="DataTableImport.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <script type="text/javascript">
 var titles =  {
	tableField : "Table Field",
	comboField : "Combo Field",
	description : "Description",
	active : "Active",
	displayOrder : "Display Order",
	defaultOption : "Default Option"
};
 $(document).ready( function () {
	var columns = new Array(); $subDataTbl = '';
	columns.push({'data':'tableField', 'type': 'string', 'title': titles.tableField});
	columns.push({'data':'comboField', 'type': 'string', 'title': titles.comboField});
	columns.push({'data':'text', 'type': 'string', 'title': titles.description});
	columns.push({'data':'active', 'type': 'string', 'title': titles.active});
	columns.push({'data':'comboOrder', 'type': 'string', 'title': titles.displayOrder});
	columns.push({'data':'defaultValue', 'type': 'string', 'title': titles.defaultOption});
	columns.push({'data': 'Id', 'type': 'image', 'access': 'Edit',  'title':'Edit','url': './ComboTableEdit.html?action=edit&comboId='});
	$(this).mainGridTable(columns, 'ComboTableDO', 'tableField$comboField');
	
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
											<h5>Combo Info</h5>
										</div>
										<div class="card-block">
											<div class="table-responsive">
											         <input type="search" id="txt_searchall" class="form-control col-sm-2 float-right" placeholder="Enter table field to Search">
                                                     <button class="btn btn-success float-right btn-sm" id="dtSearchBtn" onclick="$(this).dataTblReset('searchId')"><i class="feather icon-refresh-cw"></i>Reset</button>
												<a href="ComboCreate.html" class="btn btn-success float-right btn-sm" role="button"><i class="feather icon-file-minus"></i>Create</a>
                                                     <table id="key-act-button" class="table table-bordered table-striped table-condensed" style="width: 100%">
	                                                <thead class="thead-dark">
	                                                   </thead>
	                                                   </table> 
                                            </div>
											     <table class="searchTable" id="searchId" style="display:none;"><tr><td><input type="text" id="tableField"  class="textStyle_180 tableField dt_input"/></td> </tr> </table>
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
	             $('#tableField').val(inputVal);
	             $(this).dataTblSearch();   	
	    });
		
	    
	    </script>
</body>
</html>