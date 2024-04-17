<%@ include file="TagLibraries.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<c:forEach items="${modulesDoMap.keySet()}" var="moduleid">
  <c:if test="${modulesDoMap.get(moduleid).getModuleId()==moduleID}">
  	<c:set value="${modulesDoMap.get(moduleid).getModuleName()}" var="moduleName" />
	<c:set value="${modulesDoMap.get(moduleid).getOrder()}" var="moduleAutoID" />
  </c:if>
</c:forEach>
<c:set var="featureMap" value="${featureDoMap.get(moduleAutoID)}"></c:set>
    <div class="pcoded-main-container">
        <div class="pcoded-wrapper">
            <div class="pcoded-content">
                <div class="pcoded-inner-content">
                    <div class="main-body">
                        <div class="page-wrapper">
                        	<div class="card">
                        	<div class="card-header"><h5>${moduleID}</h5></div>
                        	<div class="card-body">
                            <div class="row">
                            	<c:forEach begin="0" end="${featureMap.size()}" var="i">
									<c:if test="${featureMap[i]!=null}">
										<div class="col-sm-2">
                       						<a href="./commonRequest.html?invoke=${userFeatures.get(featureMap[i].getFeatureId())}Create.html&moduleName=${moduleID}&featureName=${featureMap[i].getFeatureId()}" id="${featureMap[i].getFeatureId()}" class="btn btn-sm" target="_self">
                       						<img src="./resources/images/${featureMap[i].getExtFld2()}" height="50px"/>
                       						</a>
                       						<c:if test="${featureMap[i].getDisplayName() != 'Account Setup' && featureMap[i].getDisplayName() != 'Group-Ledger Configuration'}"><a href="./commonRequest.html?invoke=${userFeatures.get(featureMap[i].getFeatureId())}Search.html&moduleName=${moduleID}&featureName=${featureMap[i].getFeatureId()}" id="${featureMap[i].getFeatureId()}" class="btn btn-sm" target="_self">
                       						<img src="./resources/images/search.png" height="20px"/></a></c:if>
                       						<a href="./commonRequest.html?invoke=${userFeatures.get(featureMap[i].getFeatureId())}Create.html&moduleName=${moduleID}&featureName=${featureMap[i].getFeatureId()}" id="${featureMap[i].getFeatureId()}" class="btn btn-sm" target="_self"><figcaption>${featureMap[i].getDisplayName()}</figcaption></a>
                        				</div>
									</c:if>
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
</body>
</html>