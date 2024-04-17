<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>!window.jQueryMessageSource && document.write('<script type="text/javascript" src="resources/Javascript/CommonMessageSource.js"><\/script>');</script>
<script type="text/javascript">jQueryMessageSource.comnVald_msg3="<f:message code="comnVald_msg3"></f:message>";</script>
</head>
<body>
<f:message code="label.alertMessage" var="label_alertMessage"/>
 <div id="alertDialog" title="${label_alertMessage}"   style="display: none">
       <div class="ui-dialog-content ui-widget-content" style="text-align: center; width: auto;"> 
            <!-- <p id="lblMessage"> 
               <span class="ui-icon ui-icon-alert" style="float: left; margin: 0 7px 20px 0"></span> 
                <label id="lblMessage" >
                </label>
          </p> -->
          <div id="textMessage" style="word-spacing:normal;"> </div>
          
         </div>
          <div style="text-align: right;">
           <a href="#" ><input type="button"  onclick="$(this).closeAlert()" value="OK" /></a>
  </div>  </div>
  <f:message code="UIDatePattern" var="dateFormat"/>
  <input type ="hidden" id="format" value="${dateFormat}">
</body>
</html>