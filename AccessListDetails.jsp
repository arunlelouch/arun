<%@include file="TagLibraries.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">
 $(document).ready(function() {
	 
	 var form_URL=$('#formURLHidden').val();
	 $.fn.validfunction=function(formId,btnID)
		{
			$(this).validFields(formId,form_URL,btnID);

		}
   }); 
 
</script>
</head>
<body>
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
											<h3 id="headerTxtId">Access List</h3>
										</div>
										<div class="card-block">
											<input type="hidden" value="${url}" id="formURLHidden" />
											<form:form method="post" modelAttribute="accessListMO" id="AccessListform">
												<div class="row">
													<form:input path="accesslistDO.Id" type="hidden"></form:input>
													<div class="form-group col-md-4">
														<label>Access Number<span style="color: red">*</span></label>
														<form:input path="accesslistDO.accessnum" id="accessNum" class="form-control number validateClass" />
													</div>
													<div class="form-group col-md-4">
														<label>Access Id<span style="color: red">*</span></label>
														<form:input path="accesslistDO.accessid" type="text"
															id="accessListID" class="form-control validateClass" />
													</div>
													<div class="form-group col-md-4">
														<label>Access Name<span style="color: red">*</span></label>
														<form:input path="accesslistDO.accessdescrip"
															type="text" id="accDescId"
															class="form-control validateClass" />
													</div>
												</div>
												<div class="row" style="float: right;">
												<a href="./AccessListSearch.html" class="btn btn-danger btn-sm" role="button">Cancel</a>
												<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('AccessListform','btnId');" id="btnId">
													<span class="spinner-grow spinner-grow-sm" id="loadindGif" style="display: none;"></span>
													<b id="btnTextId">Submit</b>
												</button>
											</div>
												<!-- <div class="row" style="float: right;">
													<button class="btn btn-success btn-sm" id="btnId" onclick="$(this).validfunction('AccessListform','btnId');">
													<span class="spinner-grow spinner-grow-sm"  type="button" id="loadindGif" style="display: none;"></span> <b id="btnTextId">Submit</b>
													</button>
													<a href="./AccessListSearch.html" class="btn btn-danger btn-sm">Cancel</a>
												</div> -->
											</form:form>
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
</body>
</html>
