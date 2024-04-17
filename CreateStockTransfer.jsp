<%@include file="TagLibraries.jsp"%>
<%@ include file="TagLibraries_Search.jsp" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html>
<html>
<head>
<title>Stock Transfer</title>
     <link href="Resources/Css/jquery-ui_date.css" rel="stylesheet" type="text/css" />
    <link href="Resources/Css/chegus-infotech-style-Hie.css" rel="stylesheet" type="text/css" /> 
    <script type="text/javascript" src="resources/Javascript/StockTransfer.js"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	var form_URL = $("#formURLHidden").val();
    	$.fn.validfunction = function(formId, btnID)
    	{
    		$(this).validFields(formId,form_URL  , btnID);
    	};
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
									<div class="card" style="">
										<div class="card-header">
											<h5>Stock Transfer</h5>
											<div class="card-header-right">
												<a href="./StockTransfersSearch.html"
													class="btn btn-primary btn-sm" role="button">Search</a>
											</div>
											</div>
											<div class="card-block">
												<input type="hidden" value="${url}" id="formURLHidden" />
												<form:form action="./${url}" modelAttribute="stockTransferMO" enctype="multipart/form-data" id="stockForm"
													method="POST" >
													<!-- <div class="brachMain" id="branchMainId"> -->
														<div class="row">
															<div class="col-sm-3">
																<label>StockTransfer Id</label>
																<form:hidden path="stockTransferDO.id" />
																<form:input path="stockTransferDO.stockTransferId" class="form-control " readonly="true"
																	onkeyup="$(this).upperCase()" id="stockTransferId" />
															</div>

															<div class="col-sm-3 date">
																<label>Date<span style="color: red">*</span></label>
																<form:input  path="stockTransferDO.sdate" class="form-control validateClass dateYearNon" placeholder="dd-mm-yyyy" />
															</div>

															<div class="col-sm-3">
																<label>Commodity<span style="color: red">*</span></label>
																<form:select path="StockTransferDO.comodity"
																	class="form-control validateClass ">
																	<form:option value="">
																		<f:message code="label.select" />
																	</form:option>
																	<c:forEach items="${stockTransferMO.getComodityList()}" var="var01">
																		<form:option value="${var01.comboField}">${var01.text}</form:option>
																	</c:forEach>
																</form:select>
															</div>
														</div>
														<div class="row">
															<div class="col-sm-3"> <label>From<span style="color: red">*</span></label>
																<form:select path="stockTransferDO.fromBranchDO.id"
																	class="form-control validateClass input-sm" id="fromID">
																	<form:option value="">
																		<f:message code="label.select" />
																	</form:option>
																	<c:forEach items="${stockTransferMO.getWarehouseList()}"
																		var="obj1">
																		<form:option value="${obj1.id}">${obj1.wareHouseName}</form:option>
																	</c:forEach>
																</form:select>
															</div>
															<div class="col-sm-3">
																<label>To<span style="color: red">*</span></label>
																<form:select path="stockTransferDO.toBranchDO.id" class="form-control validateClass" id="toId">
																	<form:option value="">
																		<f:message code="label.select" />
																	</form:option>
																	<c:forEach items="${stockTransferMO.getWarehouseList()}"
																		var="obj1">
																		<form:option value="${obj1.id}">${obj1.wareHouseName}</form:option>
																	</c:forEach>
																</form:select>
															</div>

															<div class="col-sm-3">
																<label>Waybill Number</label>
																<form:input path="stockTransferDO.waybillno" class="form-control" />
															</div>

															<div class="col-sm-3">
																<label>Truck Number<span style="color: red">*</span></label>
																<form:input path="stockTransferDO.truckDetailsDO.truckNo" class="form-control validateClass "  />
															</div>

														</div>
														<div class="row">
														
														<div class="col-sm-3"><label>Name of the Escort<span style="color: red">*</span></label>
																<form:input path="stockTransferDO.escortName" class="form-control validateClass"/>
														</div>
														<div class="col-sm-3"><label>Contact Number</label>
																<form:input path="stockTransferDO.escortCntNo" class="form-control "/>
														</div>
														
														<div class="col-md-2"><label> ID Number</label>
																<form:input path="stockTransferDO.escortIdNum" class="form-control "/>
														</div>
														<div class="col-sm-1">
																<label>ID Proof</label>
																
				                                                <div class="dynamicSubAdd">
																<a href="#" style="text-decoration: underline;" id="fileTxt1" onclick="$(this).selectFile1();">
																	  		<c:choose>
																	  			<c:when test="${stockTransferMO.stockTransferDO.path1 != null}">
																	  				        ${stockTransferMO.stockTransferDO.path1}
																	  			</c:when>
																	  			<c:otherwise>
																			  		&nbsp;&nbsp;&nbsp;No file uploaded
																	  			</c:otherwise>
																	  		</c:choose>
																	  	</a>
																	  	<c:if test="${stockTransferMO.stockTransferDO.path1 != null}">
																		  	&nbsp;&nbsp;&nbsp;<a id="downloadIdFile1" href="#" onclick="$(this).downloadIdentityFile1();"><img src="Resources/Images/download.png" title="Download" alt="download" style="width: 15px; height: 15px;"/></a>
																	  	</c:if>
																	  	<input name="ccc" type="hidden" value="Doc1" id="attachmentType1" >
																	  	<form:hidden path="stockTransferDO.path1" id="idFileName1" class="fileName"/>
																	  	<form:input type="file" path="mesurementFileDocument" name="mesurementFileDocument" id="idFile1" style="display: none;" onchange="$(this).setFileName1();"/>
																	  	 &nbsp;&nbsp;&nbsp;<%-- <div class="fieldText deleteRowicon deleteicon" onclick="$(this).clearImage();"  title="<f:message code="label.delete"/>" ></div> --%>
																
																</div> 
                                                
											           </div>
														
														<%-- <div class="form-group col-sm-3">
																<label>ID Number</label>
																
																<div class="input-group">
																<form:input
																	path="stockTransferDO.escortIdNum"
																	class="form-control  validateField" style="width: 116px;" />&nbsp;&nbsp;
                                                                     
                                                                   <div class="form-group dynamicSubAdd">
																       <a href="javascript:void();" style="text-decoration: underline;" id="fileTxt1" onclick="$(this).selectFile1();">
																  		<c:choose>
																  			<c:when test="${stockTransferMO.stockTransferDO.path1 != null}">
																  				${stockTransferMO.stockTransferDO.path1}
																  			</c:when>
																  			<c:otherwise>
																		  		No file uploaded
																  			</c:otherwise>
																  		</c:choose>
																  		</a>
																  		
																  		<c:if test="${stockTransferMO.stockTransferDO.path1 != null}">
																		  	&nbsp;&nbsp;&nbsp;<a id="downloadIdFile" href="#" onclick="$(this).downloadIdentityFile();">
																		  	<img src="Resources/Images/download.png" title="Download" alt="download" style="width: 15px; height: 15px;"/></a>
																	  	</c:if>
																	  
																  		<form:hidden path="stockTransferDO.path1" id="idFileName1" class="fileName"/>
																
																	  	<input type="file" name="stktrFileDoc" class="form-control" id="idFile1"	
																	  	style="display: none;" onchange="$(this).setFileName1();"/>
																
																      </div>  
																      
																      
																      
																      
																      
																      
																</div>


															</div> --%>
															
														<div class="col-sm-3">
														<label>Transporter/Agent<span style="color: red">*</span></label>
														<form:select path="stockTransferDO.intrmDO.id" class="form-control  validateClass" >
																	<form:option value="">
																		<f:message code="label.select" />
																	</form:option>
																	<c:forEach items="${stockTransferMO.getTransAgent()}"
																		var="obj1">
																		<form:option data-eid="${obj1.intId}" value="${obj1.id}">${obj1.name}</form:option>
																	</c:forEach>
														</form:select>
															
														</div>
														
														</div>
														
														<div class="row">
														
														<div class="col-sm-3"><label>Name of the Driver<span style="color: red">*</span></label>
																<form:input path="stockTransferDO.driverName" class="form-control validateClass"/>
														</div>
														<div class="col-sm-3"><label>Contact Number</label>
																<form:input path="stockTransferDO.driverCntNo" class="form-control "/>
														</div>
														<div class="col-md-2"><label> ID Number</label>
																<form:input path="stockTransferDO.driverIdNum" class="form-control "/>
														</div>
														
														<div class="col-sm-1">
																<label>ID Proof</label>
																
				                                               <div class="dynamicSubAdd">
																<a href="#" style="text-decoration: underline;" id="fileTxt2" onclick="$(this).selectFile2();">
																	  		<c:choose>
																	  			<c:when test="${stockTransferMO.stockTransferDO.path2 != null}">
																	  				        ${stockTransferMO.stockTransferDO.path2}
																	  			</c:when>
																	  			<c:otherwise>
																			  		&nbsp;&nbsp;&nbsp;No file uploaded
																	  			</c:otherwise>
																	  		</c:choose>
																	  	</a>
																	  	<c:if test="${stockTransferMO.stockTransferDO.path2 != null}">
																		  	&nbsp;&nbsp;&nbsp;<a id="downloadIdFile2" href="#" onclick="$(this).downloadIdentityFile2();">
																		  	<img src="Resources/Images/download.png" title="Download" alt="download" style="width: 15px; height: 15px;"/></a>
																	  	</c:if>
																	  	<input name="ccc" type="hidden" value="Doc2" id="attachmentType2" >
																	  	<form:hidden path="stockTransferDO.path2" id="idFileName2" class="fileName"/>
																	  	<input type="file" name="otherDtlsFileDocument" id="idFile2" style="display: none;" onchange="$(this).setFileName2();"/>
																	  	 &nbsp;&nbsp;&nbsp;
																	  	<%--  <div class="fieldText deleteRowicon deleteicon" onclick="$(this).clearImage();"  title="<f:message code="label.delete"/>" ></div> --%>
																
																</div>
                                                
											           </div>
														
														
														<%-- <div class="form-group col-sm-3">
																<label>ID Number</label>
																
																<div class="input-group">
																<form:input
																	path="stockTransferDO.driverIdNum"
																	class="form-control validateField" style="width: 116px;" />&nbsp;&nbsp;
                                                                     
                                                                     <div class="form-group dynamicSubAdd" >
																       <a href="javascript:void();" style="text-decoration: underline;" id="fileTxt2" onclick="$(this).selectFile2();">
																  		<c:choose>
																  			<c:when test="${stockTransferMO.stockTransferDO.path2 != null}">
																  				${stockTransferMO.stockTransferDO.path2}
																  			</c:when>
																  			<c:otherwise>
																		  		No file uploaded
																  			</c:otherwise>
																  		</c:choose>
																  		</a>
																  		<c:if test="${stockTransferMO.stockTransferDO.path2 != null}">
																		  	&nbsp;&nbsp;&nbsp;<a id="downloadIdFile1" href="#" onclick="$(this).downloadIdentityFile1();">
																		  	<img src="Resources/Images/download.png" title="Download" alt="download" style="width: 15px; height: 15px;"/></a>
																	  	</c:if>
																	  
																  		<form:hidden path="stockTransferDO.path2" id="idFileName2" class="fileName"/>
																
																	  	<input type="file" name="stktrFileDoc2" id="idFile2" class="form-control" style="display: none;" onchange="$(this).setFileName2();"/>
																
																      </div>
																</div>


															</div> --%>
														
														
														<div class="col-sm-3">
														<label>Transporter/Agent<span style="color: red">*</span></label>
														<form:select path="stockTransferDO.driverIntrmDO.id" class="form-control validateClass ">
																	<form:option value="">
																		<f:message code="label.select" />
																	</form:option>
																	<c:forEach items="${stockTransferMO.getTransAgent()}"
																		var="obj2">
																		<form:option data-eid="${obj2.intId}" value="${obj2.id}">${obj2.name}</form:option>
																	</c:forEach>
																</form:select>
															
														</div>
														
														</div>
														
														
														<div class="row">
															<div class="form-group col-sm-3">
																<label>Truck Weight with Stocks</label>
																<div class="input-group">
																<form:input
																	path="stockTransferDO.truckDetailsDO.trkwtsocks"
																	class="form-control decimal validateField" style="width: 80px;"
																	id="trkwtsocksid" title="Truck Weight with Stocks"
																	onchange="myFunction()" />&nbsp;&nbsp;

																<form:select
																	path="stockTransferDO.truckDetailsDO.trkwtsocksUnit"
																	id="trkwtsocksUnit"
																	class="form-control  "
																	style="width: 80px;" onchange="myFunction()">
																	<form:option value="">
																		<f:message code="label.select" />
																	</form:option>
																	<form:option value="kg">Kg's</form:option>
																	<form:option value="ton">Tons's</form:option>
																</form:select>
																</div>


															</div>

															<div class="form-group col-sm-3">
																<label>Truck Tare weight</label>
																<div class="input-group">
																<form:input
																	path="stockTransferDO.truckDetailsDO.trktarewt"
																	class="form-control decimal validateField" style="width: 116px;"
																	id="trktarewtid" title="Truck Tare weight"
																	onchange="myFunction()" />&nbsp;&nbsp;

																<form:select
																	path="stockTransferDO.truckDetailsDO.trktarewtUnit"
																	class="form-control "
																	style="width: 80px;" id="trktarewtUnit"
																	onchange="myFunction()">
																	<form:option value="">
																		<f:message code="label.select" />
																	</form:option>
																	<form:option value="kg">Kg's</form:option>
																	<form:option value="ton">Tons's</form:option>
																</form:select>
																</div>


															</div>

															<div class="col-sm-3">
																<label>Gross Weight</label>
																<div class="input-group">
																<form:input path="stockTransferDO.truckDetailsDO.rcnwt"
																	type="text" class="form-control decimal validateField"
																	readonly="true" style="width: 100px;"
																	id="rcnGrossWeight" />
																<strong>Kg's/Tons's</strong>
																</div>
															</div>

														</div>

														<div class="row">
															<div class="col-sm-3">
																<label>No of Bags</label>
																<form:input
																	path="stockTransferDO.truckDetailsDO.noofBags"
																	class="form-control " 
																	id="noofBagsid" title="No of Bags"
																	onchange="myFunction()" />
															</div>

															<div class="form-group col-sm-3">
																<label>Bag Tare Weight</label>
																<div class="input-group">
																<form:input
																	path="stockTransferDO.truckDetailsDO.bagtarewt"
																	class="form-control decimal validateField" style="width: 116px;"
																	id="bagtarewtid" title="Bag Tare Weight"
																	onchange="myFunction()" />&nbsp;&nbsp;

																<form:select
																	path="stockTransferDO.truckDetailsDO.bagtarewtUnit"
																	class="form-control"
																	style="width: 80px;" id="wtUnitid"
																	onchange="myFunction()">
																	<form:option value="">
																		<f:message code="label.select" />
																	</form:option>
																	<form:option value="kg">Kg's</form:option>
																	<form:option value="ton">Tons's</form:option>
																</form:select>
																</div>
                                                               </div>
                                                               
                                                               <div class="col-sm-3">
																<label>Net Weight</label>
																<div class="input-group">
																<form:input path="stockTransferDO.netwt" type="number" class="form-control decimal validateField"
																	readonly="true" style="width: 100px;" id="netWeight"/><strong>Kg's/Tons's</strong>
															</div>
															</div>



														</div>
														<div class="row" style="float: right;">
															<a href="./StockTransfersSearch.html"
																class="btn btn-danger btn-sm" role="button">Cancel</a>
															<button class="btn btn-success btn-sm" type="button" onclick="$(this).validfunction('stockForm','btnId');" id="btnId">
																<span class="spinner-grow spinner-grow-sm"
																	id="loadindGif" style="display: none;"></span> <b
																	id="btnTextId">Submit</b>
															</button>
														</div>
													<div id="createEscortId">
												   <div  id="escortDetailsPageId">
												  
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
	<!-- </div> -->

</body>
</html>
