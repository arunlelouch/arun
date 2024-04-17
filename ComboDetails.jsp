<%@include file="TagLibraries.jsp"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Insurance</title>
<script type="text/javascript">
 $(document).ready(function() {
	 
	 var form_URL=$('#formURLHidden').val();
	 $.fn.validfunction=function(formId,btnID)
		{
			$(this).validFields(formId,form_URL,btnID);

		}
	 
	 $('#tableFieldId').keyup(function(){
	        $(this).val($(this).val().toUpperCase());
	    });
	 
	/*  $('#comboformId').validate({
	        ignore: '.ignore, .select2-input',
	        focusInvalid: false,
	        rules: {
	            'comboTableDO.tableField': {
	                required: true
	            },
	            'comboTableDO.comboField': {
	                required: true
	            },
	        },
	        // Errors //

	        errorPlacement: function errorPlacement(error, element) {
	            var $parent = $(element).parents('.form-group');

	            // Do not duplicate errors
	            if ($parent.find('.jquery-validation-error').length) {
	                return;
	            }

	            $parent.append(
	                error.addClass('jquery-validation-error small form-text invalid-feedback')
	            );
	        },
	        highlight: function(element) {
	            var $el = $(element);
	            var $parent = $el.parents('.form-group');

	            $el.addClass('is-invalid');
	        },
	        unhighlight: function(element) {
	            $(element).parents('.form-group').find('.is-invalid').removeClass('is-invalid');
	        }
	    }); */
 }); 
 
 $.fn.DuplicateComboCheck=function(){
		
		var $this = $(this);
		var tableField=$('#tableFieldId').val();
		var comboField=$('#comboFieldId').val();
	
		$.ajax({
		type : "POST",
		url : "duplicateComboCheck.html",
		data :({'tableField':tableField,'comboField':comboField}),
		dataType : 'json',
		success : function(response) {
		if( response == true )
		{
			swal("Duplicate!", "Alredy This Data Present!", "error");
			$('#tableFieldId').val("");
			$('#comboFieldId').val("");
		}	
		}
		});
		}
 
</script>
<script type="text/javascript">
     function DropDownTextToBox(objDropdown, strTextboxId) {
        document.getElementById(strTextboxId).value = objDropdown.options[objDropdown.selectedIndex].value;
        DropDownIndexClear(objDropdown.id);
        document.getElementById(strTextboxId).focus();
    }
    function DropDownIndexClear(strDropdownId) {
        if (document.getElementById(strDropdownId) != null) {
          document.getElementById(strDropdownId).selectedIndex = -1;
        }
    }
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
									<div class="card" >
										<div class="card-header" >
											<h5>Combo-Details</h5>
										</div>
										<div class="card-block">
													<input type="hidden" value="${url}" id="formURLHidden" />
													<form:form method="post" modelAttribute="comboTblMO"
														id="comboformId">
														<div class="row">
															<form:hidden path="comboTableDO.Id" />
															<div class="form-group col-md-4">
																<label>Table Field<span style="color: red">*</span></label>
																<form:input list="tableFieldList"
																	path="comboTableDO.tableField" type="text"
																	id="tableFieldId"
																	onchange="$(this).DuplicateComboCheck();"
																	class="form-control validateClass" maxlength="30"/>
																<datalist id="tableFieldList">
																	<c:forEach items="${tableFieldUniqueList}" var="var01">
																		<option value="${var01.tableField}"></option>
																	</c:forEach>
																</datalist>
															</div>
															<div class="form-group col-md-4">
																<label>Combo Field<span style="color: red">*</span></label>
																<form:input path="comboTableDO.comboField" type="text"
																	id="comboFieldId" class="form-control validateClass"
																	onchange="$(this).DuplicateComboCheck();" maxlength="6"/>
															</div>
															<div class="form-group col-md-4">
																<label>Active</label>
																<form:select class="form-control"
																	path="comboTableDO.active">
																	<c:forEach items="${comboTblMO.getComboActive()}"
																		var="var01">
																		<form:option value="${var01.comboField}" maxlength="1">${var01.text}</form:option>
																	</c:forEach>
																</form:select>
															</div>
														</div>
														<div class="row">
															<div class="form-group col-md-4">
																<label>Description</label>
																<form:input path="comboTableDO.text" type="text"
																	id="descriptionId" class="form-control" />
															</div>
															<div class="form-group col-md-4">
																<label>Display Order</label>
																<form:input path="comboTableDO.comboOrder" type="text"
																	id="dusplayOrderId" class="form-control number" />
															</div>
															<div class="form-group col-md-4">
																<label>Default Option</label>
																<form:select class="form-control"
																	path="comboTableDO.defaultValue">
																	<c:forEach items="${comboTblMO.getComboActive()}"
																		var="var01">
																		<form:option value="${var01.comboField}" maxlength="1">${var01.text}</form:option>
																	</c:forEach>
																</form:select>
															</div>
														</div>
														<div class="row" style="float: right;">

															<button class="btn btn-success btn-sm" type="button"
																onclick="$(this).validfunction('comboformId','btnId');"
																id="btnId">
																<span class="spinner-grow spinner-grow-sm"
																	id="loadindGif" style="display: none;"></span> <b
																	id="btnTextId">Submit</b>
															</button>

															<a href="ComboSearch.html" class="btn btn-danger btn-sm"
																role="button">Cancel</a>
														</div>
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
