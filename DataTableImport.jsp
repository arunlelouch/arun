<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- <link type="text/css" rel="stylesheet" href="./resources/Css/buttons.dataTables.min.css" media="screen, projection" /> -->
    <link rel="stylesheet" href="./resources/Css/extraStyleSheet.css">
      <link rel="stylesheet" href="./resources/assets/plugins/data-tables/css/datatables.min.css">
    <link rel="stylesheet" href="./resources/assets/css/newstyle.css">
<script type="text/javascript">
	jQueryMessageSource.dt_emptyTable="No data available in table";
	jQueryMessageSource.dt_info="Showing _START_ to _END_ of _TOTAL_ entries";  //<f:message code="dt_info"></f:message>
	jQueryMessageSource.dt_infoEmpty="Showing 0 to 0 of 0 entries";
	jQueryMessageSource.dt_lengthMenu="Show _MENU_ entries";
	jQueryMessageSource.dt_loadingRecords="Loading...";
	jQueryMessageSource.dt_processing="Processing...";
	jQueryMessageSource.dt_zeroRecords="No matching records found";
	jQueryMessageSource.dt_first="First";
	jQueryMessageSource.dt_last="Last";
	jQueryMessageSource.dt_next="Next";
	jQueryMessageSource.dt_previous="Previous";
	jQueryMessageSource.dt_edit="Edit";
	jQueryMessageSource.dt_clone="Clone";
	jQueryMessageSource.dt_delete="Delete";
	jQueryMessageSource.dt_viewAll="View All";
	jQueryMessageSource.dt_view="View";
	jQueryMessageSource.dt_downl="Download Report";
	jQueryMessageSource.dt_add="add";
	jQueryMessageSource.dt_forcePass="Force Password Change";
</script>

	<script type="text/javascript" src="./resources/Javascript/datatable/jquery.dataTables.min.js"></script>  	
	<script type="text/javascript" src="./resources/Javascript/datatable/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="./resources/Javascript/datatable/jszip.min.js"></script>
	<script type="text/javascript" src="./resources/Javascript/datatable/pdfmake.min.js"></script>
	<script type="text/javascript" src="./resources/Javascript/datatable/vfs_fonts.js"></script>
	<script type="text/javascript" src="./resources/Javascript/datatable/buttons.html5.min.js"></script>
	<script type="text/javascript" src="./resources/Javascript/datatable/buttons.print.min.js"></script>  
	
	<script>!window.jQuery && document.write('<script type="text/javascript" src="./resources/Javascript/jquery-1.12.4.js"><\/script>');</script>
		<script type="text/javascript" src="./resources/Javascript/jquery-ui.min.js"></script>	
		<script type="text/javascript" src="./resources/Javascript/jquery.validate.js"></script>    
	    <script type="text/javascript" src="./resources/Javascript/CommonMessageSource.js"></script>
	    <script type="text/javascript" src="./resources/Javascript/commonFunctions.js"></script>
	 	<script type="text/javascript" src="./resources/Javascript/commonValidations.js"></script>
	     <script type="text/javascript" src="./resources/Javascript/idletimer.js"></script>
	      <script type="text/javascript" src="./resources/Javascript/timeout.js"></script>
	
	<script type="text/javascript" src="./resources/Javascript/datatable/jquery.dataTables.min.js"></script>  	
	<script type="text/javascript" src="./resources/Javascript/datatable/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="./resources/Javascript/datatable/jszip.min.js"></script>
	<script type="text/javascript" src="./resources/Javascript/datatable/pdfmake.min.js"></script>
	<script type="text/javascript" src="./resources/Javascript/datatable/vfs_fonts.js"></script>
	<script type="text/javascript" src="./resources/Javascript/datatable/buttons.html5.min.js"></script>
	<script type="text/javascript" src="./resources/Javascript/datatable/buttons.print.min.js"></script>  
	
	 <script type="text/javascript" src="./resources/Javascript/datatable/CommonDataTablefunctions.js"></script>
	 <!-- sweet alert Js -->
    <script src="./resources/assets/plugins/sweetalert/js/sweetalert.min.js"></script>
    <script src="./resources/assets/js/pages/ac-alert.js"></script>
	<style>
		button {font-size: 100%; margin: 0; vertical-align: baseline; *vertical-align: middle;}
		button {line-height: normal; *overflow: visible;}
		button {cursor: pointer; -webkit-appearance: button;}
		
		button {
		  -webkit-border-radius: 4px;
		  -moz-border-radius: 4px;
		  border-radius: 4px;
		  border: 1px solid #cccccc;
		  border-width: 1px;
		  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
		  -webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5), inset 0 1px 1px rgba(0, 0, 0, 0.1);
		  -moz-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5), inset 0 1px 1px rgba(0, 0, 0, 0.1);
		  box-shadow: 0 1px 0 rgba(255, 255, 255, 0.5), inset 0 1px 1px rgba(0, 0, 0, 0.1);
		  cursor: pointer;
		  color: #333333;
		  display: inline-block;
		  font-size: 14px;
		  line-height: normal;
		  padding: 5px 10px;
		  text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75);
		}
		
		.button:hover, button:hover {
		  text-decoration: none;
		  background-position: 0 -15px;
		} 
		
		.button:focus, button:focus {
		  -webkit-box-shadow: 0 0px 2px rgba(0, 0, 0, 0.4);
		  -moz-box-shadow: 0 0px 2px rgba(0, 0, 0, 0.4);
		  box-shadow: 0 0px 2px rgba(0, 0, 0, 0.4);
		  outline: none;
		} 
	</style>

</head>
<body>
<audio src="./resources/Images/censor-beep-01.mp3" id="beepAudioID"> </audio>
	<div style="display: none"><input type="button" value="Search" id="dtSearchBtn" onclick="$(this).dataTblSearch();"></div>
</body>
</html>