<%@include file="TagLibraries.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
								<div class="card">
									<div class="card-header"><h5>Please Select Bank for Entries</h5></div>
									<div class="card-body">
										<c:forEach items="${bankDos}" var="i" varStatus="sts">
											<c:if test="${sts.index %2 == 0}"><div class="row"></c:if>
											<div class="col-md-6">
												<div class="row">
													<a href="#">${i.bankName}</a>
												</div>
												<c:forEach items="${i.getBranchDOs()}" var="j">
													<div class="row">
														<div class="col-sm-1"></div>
														<div class="col-sm-11"><a href="#"><c:set value="${j.branchName}" var="br"></c:set>
															<c:forEach items="${j.getAccountDOs()}" var="k">
																<a href="./DBRCreate.html?action=create&bank=${i.bankName}&branch=${br}&accNo=${k.accNo}&lid=${k.extFldone}">${br}- A/C No : &nbsp;${k.accNo}</a><br>
															</c:forEach></a>
														</div>
													</div>
												</c:forEach> 
											</div>
											<c:if test="${sts.index % 2 ne 0}"></div></c:if>
										</c:forEach>
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