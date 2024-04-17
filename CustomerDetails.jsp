<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="./resources/Javascript/Customer.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.0/xlsx.full.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var form_URL = $('#formURLHidden').val();
	$.fn.validfunction = function(formId, btnID) {
		$(this).validFields(formId, form_URL, btnID);
	}
	
	$(document).on('click', '.dynamicAddition', function(event) {
		event.preventDefault();
		$(this).newAddition();
	}, { passive: false });

	$.fn.newAddition = function(){
	var main= $(this).closest('div.brachMain');
	var clond = $(main).find(".subBlock:last").clone();
	var lastId = $(main).find(".subBlock:last").attr('id');
	if($("#"+lastId).closest('div').find('.req_DIV').find(':input.req').val() != ''){
		clond.attr("id",function() { 
			var part = lastId.match(/(\D+)(\d+)$/); 
			return (part[1] +(++part[2]));
		});
		
		$(clond).find('input, hidden, select, textarea, checkbox').each(function() {
			if($(this).hasClass("dynamicInputId"))
		    {	
				var lbFor ;
				$(this).attr('id',function() { 
					var parts = this.id.match(/(\D+)(\d+)$/); 	
					lbFor = parts[1] +(++parts[2]);
					return (lbFor);
				});
				$(this).next('label').attr('for',lbFor);
		    }
			if($(this).hasClass('dynamicSelId')){
				$(this).attr('id',function() { 
					var parts = this.id.match(/(\D+)(\d+)$/); 	
					return (parts[1] +(++parts[2]));
				});
			}
			$(this).attr('name',function()
			 { 
				if(this.name != "files" && ! $(this).hasClass('doNothingInp'))
				 {
					 var parts = this.name.match(/(\D+)(\d+)(\D+)$/); 
					 return (parts[1] +(++parts[2])+parts[3]);
				 }
			 });
			
			if($(this).get(0).tagName == "INPUT")
			{ 
				if(!$(this).hasClass("hiddenClass"))
				{ 
					$(this).val("");					 
					if($(this).hasClass("readonly"))
						$(this).prop("readonly",true);
					else
						$(this).prop("readonly",false);
				}
			}
			else if($(this).get(0).tagName=="SELECT")
			{	  
				$(this).find("option").removeAttr('selected');
				$(this).find("option").each(function() { 
					if($(this).is(':enabled'))
					{ 
						$(this).prop('selected',true);
						return false;
					}
				});						 
			}
			else if($(this).get(0).tagName=="TEXTAREA")
			{
				$(this).val("");
			}
		});
		clond.insertAfter("#"+lastId);
//		updateIndexes(main);
		}else{
			swal("","Please fill the Required Field","warning");
		}
	}

		$(document).on('click', '.dynamicDelete', function(event) {
			event.preventDefault();
		    var subBlock = $(this).closest('.subBlock');
		    var branchMain = subBlock.closest('.brachMain');
		
		    if (branchMain.find('.subBlock').length > 1) {
		        subBlock.remove();
		    }
		    else {
		        subBlock.find("input[type=text], input[type=hidden], select, textarea").val("");
		    }
		
		    updateIndexes(branchMain);
		});

		function updateIndexes(branchMain) {
		    branchMain.find('.subBlock').each(function(index) {
		        $(this).find('input, select').each(function() {
		            var name = $(this).attr('name');
		            if (name) {
		                // Update index in the input name attribute
		                $(this).attr('name', name.replace(/\[\d+\]/, '[' + index + ']'));
		            }
		        });
		    });
		}

		$('#fileInput').on('change', function (event) {
		    var file = event.target.files[0];
		    var reader = new FileReader();

		    reader.onload = function (e) {
		        var data = new Uint8Array(e.target.result);
		        var workbook = XLSX.read(data, { type: 'array' });
		        var communicationSheet = workbook.Sheets[workbook.SheetNames[0]];
		        var jsonData = XLSX.utils.sheet_to_json(communicationSheet, { header: 1 });

		        var headers = jsonData.shift();
		        var numColumns = headers.length;

		        $('.dynamicRows').remove();

		        $.ajax({
		        	type: 'GET',
		            url: 'branches',		            
		            dataType: 'json',
		            success: function (branches) {
		            	
		            	var branchList = branches;

		            	jsonData.forEach(function (row, i) {
		            	    var newRow = $('<div class="subBlock dynamicRows" id="subBlkId' + i + '">');
		            	    var rowHtml = '<div class="row">';

		            	    rowHtml += '<div class="req_DIV col-sm-2"><input type="hidden" name="addressDOs[' + i + '].id"/><input type="text" name="addressDOs[' + i + '].addressOne" class="form-control req" value="' + row[0] + '"></div>';
		            	    rowHtml += '<div class="col-sm-2"><input type="text" name="addressDOs[' + i + '].addressTwo" class="form-control" value="' + row[1] + '"></div>';

		            	    // Add the branch dropdown HTML
		            	    var branchDropdownHtml = '<select name="addressDOs[' + i + '].branchDO.id" class="form-control">';
						    branchList.forEach(function (branch) {
						        var selected = (branch.branchName === row[2]) ? 'selected' : '';
						        var optionHtml = '<option value="' + branch.id + '" ' + selected + '>' + branch.branchName + '</option>';
						        branchDropdownHtml += optionHtml;
						    });
						    branchDropdownHtml += '</select>';
						    rowHtml += '<div class="col-sm-2">' + branchDropdownHtml + '</div>';

		            	    rowHtml += '<div class="col-sm-2"><input type="text" name="addressDOs[' + i + '].city" class="form-control" value="' + row[3] + '"></div>';
		            	    rowHtml += '<div class="col-sm-2"><input type="text" name="addressDOs[' + i + '].state" class="form-control" value="' + row[4] + '"></div>';
		            	    rowHtml += '<div class="col-sm-2"><a href="#" class="btn dynamicDelete"><i class="feather icon-minus-circle float-right"></i></a></div>';
		            	    rowHtml += '</div>'; 

		            	    newRow.append(rowHtml);

		            	    $('.dynamicRowsContainer').append(newRow);
		            	});


		            }
		        });
		    };

		    reader.readAsArrayBuffer(file);
		});

		 

	    $('#resetButton').on('click', function() {
	        $('#fileInput').val(''); 
	        $('#dynamicRows').empty();
	    });
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
									<div class="card-header" ><h5>Customer Details</h5>
									</div>
									<div class="card-block">
										<input type="hidden" value="${url}" id="formURLHidden" />
                                        <form:form id="customerform" method="POST" action="${url}" modelAttribute="customerDO">
										  <div class="brachMain" id="branchMainId">
											<div class="row">
												<div class="col-sm-4"><label>Customer Id</label>
                                                    <form:hidden path="id" />
												    <form:input type="text" path="intId" readonly="true" class="form-control" id="customerId"/>
												</div>
												<div class="col-sm-4"><label>Customer Name<span style="color: red">*</span></label>						   
												    <form:input  path="name" class="form-control input-sm" />
												</div>
                                                <div class="col-sm-4"><label>Gender</label>						   
												    <form:select path="gender" class="form-control input-sm">
                                                        <form:option value="">Select Gender</form:option>
                                                        <form:option value="Male">Male</form:option>
                                                        <form:option value="Female">Female</form:option>
                                                    </form:select>
												</div>
                                                <div class="col-sm-4"><label>Phone Number</label>						   
												    <form:input  path="phone" class="form-control input-sm"  />
												</div>
                                                <div class="col-sm-4"><label>Email</label>						   
												    <form:input  path="email" class="form-control input-sm email validateField" />
												</div>
											</div>
											<br>
											<div class="row">
										    <div class="col-sm-12">
										        <div class="card">
										            <div class="card-header"><h5>Communication Details</h5> 
										            	&nbsp;&nbsp;<button style="border: none; font-family: sans-serif; border-radius: 10%;background-color:rgb(0, 157, 255);color: white; float: right;" id="resetButton" type="reset">reset</button>&nbsp;&nbsp;
										            	&nbsp;&nbsp;<input style="float: right;" type="file" id="fileInput">
										            	</div>
										            <div class="card-body dynamicRowsContainer">
										            	
										                <div class="row">
										                    <div class="col-sm-2"><label>Address 1<span style="color: red">*</span></label></div>
										                    <div class="col-sm-2"><label>Address 2</label></div>
										                    <div class="col-sm-2"><label>Branch</label></div>
										                    <div class="col-sm-2"><label>City</label></div>
										                    <div class="col-sm-2"><label>State</label></div>
										                    <div class="col-sm-12 text-right">
										                        <a href="javascript:void();" class="btn btn-sm btn-primary" id="dynamicAddition" onclick="$(this).newAddition();">Add</a>
										                    </div>
										                </div>
										                <c:forEach begin="0" end="${customerDO.addressDOs.size() == 0 ? 0 : customerDO.addressDOs.size() - 1}" var="i">
										                    <div class="subBlock dynamicRows" id="subBlkId${i}">
										                        <div class="row">
										                            <div class="req_DIV col-sm-2">
										                            	<form:hidden path="addressDOs[${i}].id"/>
										                                <form:input path="addressDOs[${i}].addressOne" class="form-control validateClass req" id="addressOne"/>
										                            </div>
										                            <div class="col-sm-2">
										                                <form:input path="addressDOs[${i}].addressTwo" class="form-control" id="addressTwo"/>
										                            </div>
										                            <div class="col-sm-2">
										                                <form:select path="addressDOs[${i}].branchDO.id" id="branchDO" onchange="$(this).checkDuplicate1()" class="form-control">
										                                    <form:option value="">Select</form:option>
										                                    <c:forEach items="${branchDO}" var="var01">
										                                        <form:option value="${var01.id}">${var01.branchName}</form:option>
										                                    </c:forEach>
										                                </form:select>
										                            </div>
										                            <div class="col-sm-2">
										                                <form:input path="addressDOs[${i}].city" class="form-control" id="city"/>
										                            </div>
										                            <div class="col-sm-2">
										                                <form:input path="addressDOs[${i}].state" class="form-control" id="state"/>
										                            </div>
										                            <div class="col-sm-2">
										                                <a href="#" id="dynamicDel" class="btn dynamicDelete"><i class="feather icon-minus-circle float-right"></i></a>
										                            </div>
										                        </div>
										                    </div>
										                </c:forEach>
										            </div>
										        </div>
										    </div>
										</div>

											<div class="row" style="float: right;">
											<a href="./CustomerSearch.html" class="btn btn-danger btn-sm" role="button">Cancel</a>
											<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('customerform','btnId');" id="btnId">
												<span class="spinner-grow spinner-grow-sm" id="loadindGif" style="display: none;"></span>
												<b id="btnTextId">Submit</b>
											</button>
										</div>
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