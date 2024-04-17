<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Spring3 MVC Tiles Plug-in</title>
<link type="text/css" rel="stylesheet" href="resources/Css/chegus-infotech-style.css" />
<link type="text/css" rel="stylesheet" href="resources/Css/jquery.calculator.css" />
<script language="javascript" src="resources/Javascript/jquery.plugin.js" type="text/javascript"></script>
<script language="javascript" src="resources/Javascript/jquery.plugin.js" type="text/javascript"></script>
<script language="javascript" src="resources/Javascript/jquery.calculator.js" type="text/javascript"></script>

<script>
$(function () {
	$.calculator.setDefaults();
	$('#basicCalculator').calculator();
	
});
</script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0"  class="container" align="center">
	<tr><td class="whitespacedvdr"></td></tr>
	<tr>
		<td align="center" class="footer">
			<f:message code="label.cal" var="label_cal"/>
			<span class="footertxt"><f:message code="label.imuraliMsg"/></span>
			<div style="float:right; margin-right:20px;">
				<div class="dilog"></div>
				<!-- <img alt="Chat" src="resources/images/chat.png" id="chatIcon" style="cursor: pointer;" title="Chat Box"> -->
				<input id="basicCalculator" type="image" src="resources/images/calc.png"  width="18px" height="19px" title="${label_cal}">
			</div>
		</td>
	</tr>
</table>
</body>
</html> --%>