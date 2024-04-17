<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ include file="TagLibraries.jsp" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style >
	.homePageLink:hover {  text-decoration: underline;  }
</style>
</head>
<body>
<div id="divmaincontainer">
<div class="wrapper">
<div class="warpper-top">
<div class="top-sh1"><h2>${headerMessage}</h2></div>
<div class="banner-bg1">
<div class="warpper-mid">
<div class="descData">
<p align="center"><img src="resources/images/sadImage.png" width="200" height="200" /></p>
</div>
<div style="display: none;">
<input type="hidden" id="errorPageHiddenMsg" value="${hiddenMessage}" />
</div>
<div class="descDataIn">
<div align="center"><h3>${message}</h3></div>
<br /><br />
<p id="homePageID" align="center" style="font-size: 30px;margin-top:-8px;"><f:message code="label.returnTo" />
<a href="./home.html" style="font-size: 30px;color: #0F95CA;" class="homePageLink" > <f:message code="label.homePage" /></a></p>
<br />
</div>
</div>
</div>
<div>
</div>
</div>
</div>
</div>
</body>
</html>