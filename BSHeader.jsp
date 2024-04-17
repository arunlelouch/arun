<%@ page language="java" contentType="text/html; charset=ISO-8859-1"	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><!-- Meta -->
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
 <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
 <meta http-equiv="X-UA-Compatible" content="IE=edge" />
 <meta name="description" content="Datta Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
 <meta name="keywords" content="admin templates, bootstrap admin templates, bootstrap 4, dashboard, dashboard templets, sass admin templets, html admin templates, responsive, bootstrap admin templates free download,premium bootstrap admin templates, datta able, datta able bootstrap admin template">
 <meta name="author" content="Codedthemes" />
<!-- Css -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->  
    <link rel="icon" href="./resources/assets/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="./resources/assets/fonts/fontawesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="./resources/assets/plugins/animation/css/animate.min.css">
    <link rel="stylesheet" href="./resources/assets/plugins/prism/css/prism.min.css">
    <link rel="stylesheet" href="./resources/assets/css/newstyle.css">
    
    <style> 
	      .featherUpd {line-height:5!important}
	       @media(min-width: 1281px) { #pnav{} }
	       .notify_colr {color: blue !important;}
	        liHover:hover { background-color: yellow;!important}
    </style>
</head>
<body>

<input type="hidden" id="userDashBoardRoleId" value="${sessionScope.userROLE}"></input>
<input type="hidden" id="baseCurr" value="${sessionScope.baseCurr}"/>
<input type="hidden" id="baseCurrName" value="${sessionScope.baseCurrName}"/>

  <nav class="pcoded-navbar theme-horizontal menu-light icon-colored" id="pnav">
   <div class="navbar-wrapper">
   </div>
  </nav> 
	<header class="navbar pcoded-header navbar-expand-lg navbar-light header-blue brand-primary">
		<!-- <div class="m-header">
            <span class="b-title"><a href="home.html"><h3 style="color: white">COMMODITIES</h3></a></span>
        </div> -->
         <div class="m-header">
            <a class="mobile-menu" id="mobile-collapse1" href="#!"><span></span></a>
            <a href="index.html" class="b-brand">
                <!-- <div class="b-bg">
                    <i class="feather icon-trending-up"></i>
                </div> -->
                 <span class="b-title"><a href="home.html"><h3 style="color: white">COMMODITIES</h3></a></span>
                <!-- <img class="img-fluid horizontal-dasktop" src="assets/images/logo-dark.png" alt="Theme-Logo" />
                <img class="img-fluid horizontal-mobile" src="assets/images/logo.png" alt="Theme-Logo" /> -->
            </a>
        </div>
        <a class="mobile-menu" id="mobile-header" href="#!">
            <i class="feather icon-more-horizontal"></i>
        </a>
        <div class="collapse navbar-collapse" style="height: inherit">
            <ul class="navbar-nav ml-auto">
                <li>
                	<i class="fas fa-building"></i> <span><b>${sessionScope.compName}</b></span>
                </li>
               <li>
                	<i class="fas fa-user"></i> <span><b>${sessionScope.userName}</b></span>
                </li> 
                <li>
                    <div class="dropdown drp-user">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="icon feather featherUpd icon-settings"></i>
                            <!-- <i class="icon feather icon-settings"></i> -->
                        </a>
                        <div class="dropdown-menu dropdown-menu-right profile-notification">
                            <div class="pro-head">
                        		<img src="resources/assets/images/user/avatar-1.jpg" class="img-radius" alt="User-Profile-Image">
                                <span><b style="font-size:medium;">${sessionScope.userName}</b></span>
                                <a href="${pageContext.request.contextPath}/j_spring_security_logout?isLogout=true" onclick="$(this).clearStorage();" class="dud-logout" title="Logout">
                                    <i class="feather icon-log-out"></i>
                                </a>
                            </div>
                            <ul class="pro-body">
				                <li>
									<input type="hidden" value="home.html" id="url"/>
									<a href="${pageContext.request.contextPath}/j_spring_security_logout?isLogout=true" onclick="$(this).clearStorage();" class="dropdown-item">
										<i class="feather icon-lock"></i> <!--  auth-icon -->
										<f:message code="label.logout1"/>
									</a> 
								</li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </header>
    <f:message code="UIDatePattern" var="dateFormat"/>
  	<input type ="hidden" id="format" value="${dateFormat}">
  	
  	<script src="./resources/assets/js/vendor-all.min.js"></script>
    <script src="./resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="./resources/assets/js/pcoded.min.js"></script>
    <!-- prism Js -->
    <script src="./resources/assets/plugins/prism/js/prism.min.js"></script>

    <script src="./resources/assets/js/horizontal-menu.js"></script>
    <script  language="javascript" src="./resources/Javascript/jquery-1.12.4.js"></script>
    
    <script type="text/javascript">
        // Collapse menu
        (function() {
            if ($('#layout-sidenav').hasClass('sidenav-horizontal') || window.layoutHelpers.isSmallScreen()) {
                return;
            }
            try {
                window.layoutHelpers.setCollapsed(
                    localStorage.getItem('layoutCollapsed') === 'true',
                    false
                );
            } catch (e) {}
        })();
        $(function() {
            // Initialize sidenav
            $('#layout-sidenav').each(function() {
                new SideNav(this, {
                    orientation: $(this).hasClass('sidenav-horizontal') ? 'horizontal' : 'vertical'
                });
            });

            // Initialize sidenav togglers
            $('body').on('click', '.layout-sidenav-toggle', function(e) {
                e.preventDefault();
                window.layoutHelpers.toggleCollapsed();
                if (!window.layoutHelpers.isSmallScreen()) {
                    try {
                        localStorage.setItem('layoutCollapsed', String(window.layoutHelpers.isCollapsed()));
                    } catch (e) {}
                }
            });
        });
        $(document).ready(function() {
            $("#pcoded").pcodedmenu({
                themelayout: 'horizontal',
                MenuTrigger: 'hover',
                SubMenuTrigger: 'hover',
            });
        });
    </script>
</body>
</html>
