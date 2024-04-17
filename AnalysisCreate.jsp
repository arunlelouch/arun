<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Analysis</title>
<!-- 
<link href="resources/Css/jquery-ui_date.css" rel="stylesheet"
	type="text/css" />
<link href="resources/Css/chegus-infotech-style-Hie.css"
	rel="stylesheet" type="text/css" /> -->

<script lang="javascript"
	src="resources/Javascript/DragDropFileUpload.js"></script>
<link type="text/css" rel="stylesheet"
	href="resources/Css/DragDropFileUpload.css" />
<script type="text/javascript" src="./resources/Javascript/Analysis.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var form_URL = $('#formURLHidden').val();
		$.fn.validfunction = function(formId, btnID) {
			$(this).validFields(formId, form_URL, btnID);
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
											<h5>Analysis</h5>
										</div>
										<div class="card-block">
											<input type="hidden" value="${url}" id="formURLHidden" />
											<form:form modelAttribute="analysisMO" id="AnalysisFormId"
												method="POST" enctype="multipart/form-data">
												<div class="brachMain" id="branchMainId">
													<div class="row">
														<div class="col-sm-4">
															<label>AnalysisID</label>
															<form:hidden path="analysisDO.id" />
															<form:input path="analysisDO.analysisId" type="text"
																readonly="true" class="form-control" id="analysisId" />
														</div>
														<div class="col-sm-4">
															<label>Region</label>
															<form:input path="analysisDO.region" class="form-control"
																id="region" maxlength="50" />
														</div>

														<div class="col-sm-4">
															<label>Date</label>
															<%-- <form:input path="analysisDO.date"
																class="form-control date" id="analysisDateId"
																autocomplete="off" placeholder="dd-mm-yyyy" /> --%>
																<form:input path="analysisDO.date" class="form-control input-sm dateYearNon" 
																id="analysisDateId" placeholder="dd-mm-yyyy" />
														</div>

														<div class="col-sm-4">
															<label>Truck Number</label>
															<form:select path="analysisDO.truckNo"
																class="form-control  input-sm" id="trucknoId">
																<form:option value="">Select</form:option>
																<c:forEach items="${analysisMO.getTruckList()}"
																	var="var">
																	<form:option value="${var.truckNo}">${var.truckNo}</form:option>
																</c:forEach>
															</form:select>
														</div>


														<div class="col-sm-4">
															<label>Supplier Name <span style="color: red">*</span></label>
															<form:select path="analysisDO.intrmDO.Id"
																class="form-control validateClass input-sm"
																id="supplierNameId"
																onchange="$(this).getSupplierCode();">
																<form:option value="">Select</form:option>
																<c:forEach items="${analysisMO.getSupplierList()}"
																	var="var01">
																	<form:option value="${var01.id}"
																		data-spcode="${var01.intId}">${var01.name}</form:option>
																</c:forEach>
															</form:select>
														</div>


														<%-- 
													<div class="col-sm-4">
														<label>Supplier Code</label>
														<form:input path="analysisDO.abc" class="form-control"
															id="supplrCodeId" readonly="true" />
													</div>
 --%>

														<div class="col-sm-4">
															<label>Bodreau</label>
															<form:input path="analysisDO.bodreau"
																class="form-control" id="bodreauId" autocomplete="off"
																maxlength="50" />
														</div>

														<div class="col-sm-4">
															<label>No of Bags</label>
															<form:input path="analysisDO.noofbags"
																class="form-control number" autocomplete="off"
																id="noofbagsId" />
														</div>


														<div class="col-sm-4">
															<label>Moisture</label>
															<form:input path="analysisDO.moisture"
																class="form-control decimal validateField"
																autocomplete="off" id="moistureId" />
														</div>

														<div class="col-sm-4">
															<label>NutCount</label>
															<form:input path="analysisDO.nutcount"
																class="form-control number" autocomplete="off"
																id="nutcountId" />
														</div>

														<div class="col-sm-4">
															<label>Out-Turn</label>
															<form:input path="analysisDO.outturn"
																class="form-control decimal validateField"
																autocomplete="off" id="outturnId" />
														</div>

														<div class="col-sm-4">
															<label>Good-Kernals</label>
															<form:input path="analysisDO.goodkrnls"
																class="form-control decimal validateField"
																autocomplete="off" id="goodkrnalsId" />
														</div>

														<div class="col-sm-4">
															<label>Immeture</label>
															<form:input path="analysisDO.immeture"
																class="form-control decimal validateField"
																autocomplete="off" id="immetureId" />
														</div>

														<div class="col-sm-4">
															<label>Spotted</label>
															<form:input path="analysisDO.spotted"
																class="form-control decimal validateField"
																autocomplete="off" id="spottedId" />
														</div>

														<div class="col-sm-4">
															<label>Total</label>
															<form:input path="analysisDO.total"
																class="form-control decimal validateField"
																autocomplete="off" id="totalId" />
														</div>

														<div class="col-sm-4">
															<label>Voids</label>
															<form:input path="analysisDO.voids"
																class="form-control decimal validateField"
																autocomplete="off" id="voidsId" />
														</div>

														<div class="col-sm-4">
															<label>Brown</label>
															<form:input path="analysisDO.brown"
																class="form-control decimal validateField"
																autocomplete="off" id="brownsId" />
														</div>

														<div class="col-sm-4">
															<label>Oil</label>
															<form:input path="analysisDO.oil"
																class="form-control decimal validateField"
																autocomplete="off" id="oilId" />
														</div>

														<div class="col-sm-4">
															<label>Observation</label>
															<form:input path="analysisDO.observation"
																class="form-control" autocomplete="off" id="obsId"
																maxlength="255" />
														</div>

														<div class="col-sm-4">
															<label>Analyser Name</label>
															<form:select path="analysisDO.intrmDOs.Id"
																class="form-control  input-sm" id="">
																<form:option value="">Select</form:option>
																<c:forEach items="${analysisMO.getAnalyserList()}"
																	var="obj">
																	<form:option value="${obj.id}">${obj.name}</form:option>
																</c:forEach>
															</form:select>
														</div>
													</div>

													<br>


													<div class="col-sm-3">
														<label>Upload Document</label>
													</div>
													
													
													<div class="col-sm-3">
																	<div class="form-group" id="selectFileDivId">
                                                                     <!--  <label for="exampleFormControlFile1">Example file input</label> -->
                                                                     <a href="javascript:void();" style="text-decoration: underline;" id="fileTxt" onclick="$(this).selectFile();">
																  		<c:choose>
																  			<c:when test="${analysisMO.analysisDO.rptpath != null}">
																  				${analysisMO.analysisDO.rptpath}
																  			</c:when>
																  			<c:otherwise>
																		  		No file uploaded
																  			</c:otherwise>
																  		</c:choose>
																  		</a>
																	  	<%-- <c:if test="${analysisMO.analysisDO.rptpath != null}">
																		  	&nbsp;&nbsp;&nbsp;<a id="downloadIdFile" href="#" onclick="$(this).downloadIdentityFile();"><img src="./resources/Images/download.png" title="Download" alt="download" style="width: 15px; height: 15px;"/></a>
																	  	</c:if>  --%>
																  		<!-- <input  name="bbb" type="hidden" value="IDENTITYPERSN" id="attachmentType" > --> 
																	  	<form:hidden path="analysisDO.rptpath" id="idFileName" class="fileName"/>
																<%-- 	  	<input type="file" name="identityTypeFilesPerson[${i}]"  class="form-control-file PERSN_file" id="exampleFormControlFile1" 
																	  	 onchange="$(this).setFileName();"/> --%>
																	  	<input type="file" name="identityTypeFilesPerson" id="idFile"	class="PERSN_file" style="display: none;" onchange="$(this).setFileName();"/>
                                                                     </div>
																	</div>

													<!-- <div class="file-field">
														<div class="btn btn-primary btn-sm float-left">
															<span>Choose files</span> <input type="file" multiple>
														</div>
														<div class="file-path-wrapper">
															<input class="file-path validate" type="text"
																placeholder="Upload one or more files">
														</div> -->
														
														

														<!-- <div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
														</div>
														<div class="custom-file">
															<input type="file" class="custom-file-input"
																id="inputGroupFile01"
																aria-describedby="inputGroupFileAddon01"> <label
																class="custom-file-label" for="inputGroupFile01">Choose
																file</label>
														</div>
													</div> -->
													

														<div class="row" style="float: right;">
															<a href="./AnalysisSearch.html"
																class="btn btn-danger btn-sm" role="button">Cancel</a>
															<button class="btn btn-success btn-sm" type="button"
																onclick="$(this).validfunction('AnalysisFormId','btnId');"
																id="btnId">
																<span class="spinner-grow spinner-grow-sm"
																	id="loadindGif" style="display: none;"></span> <b
																	id="btnTextId">Submit</b>
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