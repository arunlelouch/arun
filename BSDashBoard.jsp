<%@ include file="TagLibraries.jsp"%>
<%@ include file="TagLibraries_Search.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<link type="text/css" rel="stylesheet"
	href="resources/Css/Dashboard.css" />
<script type="text/javascript" src="resources/Javascript/Dashboard.js"></script>
<!-- <script lang="javascript" src="resources/Javascript/workflow/OrderDesk.js"></script> -->
<script type="text/javascript"
	src="./resources/Javascript/adminDshbrd.js"></script>
<script type="text/javascript" src="resources/Javascript/jssor.js"></script>
<script type="text/javascript"
	src="resources/Javascript/jssor.slider.js"></script>

<script>
	google.charts.load('current', {
		packages : [ 'corechart' ]
	});
	jQueryMessageSource.january = "<f:message code="january"></f:message>";
	jQueryMessageSource.february = "<f:message code="february"></f:message>";
	jQueryMessageSource.march = "<f:message code="march"></f:message>";
	jQueryMessageSource.april = "<f:message code="april"></f:message>";
	jQueryMessageSource.may = "<f:message code="may"></f:message>";
	jQueryMessageSource.june = "<f:message code="june"></f:message>";
	jQueryMessageSource.july = "<f:message code="july"></f:message>";
	jQueryMessageSource.august = "<f:message code="august"></f:message>";
	jQueryMessageSource.september = "<f:message code="september"></f:message>";
	jQueryMessageSource.october = "<f:message code="october"></f:message>";
	jQueryMessageSource.november = "<f:message code="november"></f:message>";
	jQueryMessageSource.december = "<f:message code="december"></f:message>";
</script>
<script>
	$(document).ready(function() {

		$(".datepicker ").datepicker({
			changeMonth : true,
			changeYear : true,
			showOn : 'both',
			buttonText : 'Show Date',
			buttonImageOnly : true,
			buttonImage : '../../images/calendicon.jpg'
		});

	});

	$(document).on('click', '.tabs', function() {
		$('.activeTab').removeClass('activeTab');
		$(this).addClass('activeTab');
		$('.commonCls').hide();
		$('.' + $(this).attr('id')).show();
	});

	$(document).on('click', '.tskCnt', function() {
		$('#' + $(this).data('id')).click();
	});

	$.fn.openDropdown = function(val) {
		if ($('.open-dropdown').is(':visible')) {
			$('.open-dropdown').hide();
			$('.currenDropdown').removeClass('currenDropdown');
		} else {
			$(this).addClass('currenDropdown');
			var top = $(this).height() + val;
			$('.open-dropdown').css({
				'display' : 'block',
				'top' : top + 'px',
				'left' : '1090px'
			})
		}
	}

	$.fn.openActionDialog = function() {
		$('.open-dropdown').hide();
		$('#commActionDialog').dialog({
			'title' : 'Update Communication Details',
			'width' : '750px',
			'buttons' : [ {
				'text' : 'Submit',
				'click' : function() {
					$(this).dialog('close');
				}
			}, {
				'text' : 'Close',
				'click' : function() {
					$(this).dialog('close');
				}
			} ]
		});
	}

	$.fn.openViewActionDialog = function() {
		$('.open-dropdown').hide();
		$('#viewActionDialog').dialog({
			'title' : 'Task Details',
			'width' : '1224px',
			'buttons' : [ {
				'text' : 'Close',
				'click' : function() {
					$(this).dialog('close');
				}
			} ]
		});
	}

	$(document).mouseup(function(e) {
		var container = $('.open-dropdown');

		if (!container.is(e.target) && container.has(e.target).length === 0) {
			container.hide();
			$('.currenDropdown').removeClass('currenDropdown');
		}
	});
</script>

</head>
<body>
	
</body>
</html>