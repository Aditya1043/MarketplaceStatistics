<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Statistics: Graphs and Charts</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.1.1/jquery-confirm.min.css">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.1.1/jquery-confirm.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.4.0/dist/chartjs-plugin-datalabels.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>	
	
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/temp.css">
</head>
<body  id="page-top">
	
  <!-- Page Wrapper -->
  <div id="wrapper">

	<jsp:include page="parts/SideNav.jsp"/>
    
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

		<jsp:include page="parts/header.jsp"/>

        <!-- Begin Page Content -->
       <div class="container-fluid">
	            <div class="box effect1">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Usage Units / Country</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myChart4"></canvas>
                  </div>
                </div>
          </div>
	</div>
	</div>
</body>

<script>
	!function(s){"use strict";s("#sidebarToggle, #sidebarToggleTop").on("click",function(e){s("body").toggleClass("sidebar-toggled"),s(".sidebar").toggleClass("toggled"),s(".sidebar").hasClass("toggled")&&s(".sidebar .collapse").collapse("hide")}),s(window).resize(function(){s(window).width()<768&&s(".sidebar .collapse").collapse("hide"),s(window).width()<480&&!s(".sidebar").hasClass("toggled")&&(s("body").addClass("sidebar-toggled"),s(".sidebar").addClass("toggled"),s(".sidebar .collapse").collapse("hide"))}),s("body.fixed-nav .sidebar").on("mousewheel DOMMouseScroll wheel",function(e){if(768<s(window).width()){var o=e.originalEvent,l=o.wheelDelta||-o.detail;this.scrollTop+=30*(l<0?1:-1),e.preventDefault()}}),s(document).on("scroll",function(){100<s(this).scrollTop()?s(".scroll-to-top").fadeIn():s(".scroll-to-top").fadeOut()}),s(document).on("click","a.scroll-to-top",function(e){var o=s(this);s("html, body").stop().animate({scrollTop:s(o.attr("href")).offset().top},1e3,"easeInOutExpo"),e.preventDefault()})}(jQuery);
	var startDate = "";
	var endDate = "";
	var chart4;
	$(document).ready(function () {
		setDate();
		refreshChart("All");
	});
	
	function setDate()  {
	    var start = moment().subtract(365, 'days');
	    var end =moment().subtract(1, 'days');
	    
	    var max = moment().subtract(1, 'days');
	    var start1 = new Date("11/2/2014");
	    var min = moment(start1.valueOf());

	    function cb(start, end) {
	        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
	        startDate = start.format('DD-MM-YYYY');
		    endDate = end.format('DD-MM-YYYY');
	    }

	    $('#reportrange').daterangepicker({
	        startDate: start,
	        endDate: end,
	        maxDate : max,
	        minDate : min,
	        minYear : 2019,
	        ranges: {
	           'Today': [moment(), moment()],
	           'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	           'Last 7 Days': [moment().subtract(6, 'days'), moment()],
	           'Last 30 Days': [moment().subtract(29, 'days'), moment()],
	           'This Month': [moment().startOf('month'), moment().endOf('month')],
	           'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	        }
	    }, cb);

	    startDate = start.format('DD-MM-YYYY');
	    endDate = end.format('DD-MM-YYYY');
	    
	    cb(start, end);
	};
	
	$('#reportrange').on('apply.daterangepicker', function(ev, picker) {
		chart4.destroy();
		product = document.getElementById("products");
		product.selectedIndex = 0;
		refreshChart("All");
	});
	
	function UsageCountryDetails(product){
		$.ajax({
	        type: "GET",
	        contentType: "application/json",
	        url: "api/v1/azure/country?toTime="+startDate+"&fromTime="+endDate+"&product="+product,
	        dataType: 'json',
	        cache: false,
	        timeout: 600000,
	        success: function (data1) {
	        	if(typeof chart4 !== "undefined") {
	    			chart4.destroy();
	    		}
	        	var labels = data1.map(function(e) {
        		   return e.product;
        		});
        		var data = data1.map(function(e) {
        		   return e.countSub;
        		});;
    			var ctx = document.getElementById('myChart4').getContext('2d');
    			ctx.canvas.parentNode.style.height = "400px";
    			var config = {
   					   type: 'pie',
   					   data: {
   					      labels: labels,
   					      datasets: [{
   					    	  
   					         label: 'Usage Units / Country',
   					         data: data,
   					         backgroundColor: ['rgb(255, 218, 179)','rgb(255, 119, 51)','rgb(179, 60, 0)','rgb(240, 160, 31)',
   					        	 'rgb(255, 85, 0)','rgb(255, 238, 230)','rgb(255, 150, 102)','rgb(255, 128, 0)','rgb(230, 115, 0)','rgb(255, 218, 179)','rgb(255, 119, 51)','rgb(179, 60, 0)','rgb(240, 160, 31)',
  					        	 'rgb(255, 85, 0)','rgb(255, 238, 230)','rgb(255, 150, 102)','rgb(255, 128, 0)','rgb(230, 115, 0)','rgb(255, 218, 179)','rgb(255, 119, 51)','rgb(179, 60, 0)','rgb(240, 160, 31)',
  					        	 'rgb(255, 85, 0)','rgb(255, 238, 230)','rgb(255, 150, 102)','rgb(255, 128, 0)','rgb(230, 115, 0)']		    					      }]
   					   },
   					   options: {
   						   title: {
  						            display: true,
  						            text: 'Usage Units / Country',
					             fontSize: 14

  						        },
						        plugins: {
						            datalabels: {
						                display: false
						            }
						        },
   						   legend: {
   						    	display: true
   						    },
   				            responsive: true,
   				            maintainAspectRatio: false
   				       }
    			};
    			chart4 = new Chart(ctx, config);
	        }
	    });
	}
	function refreshChart(product){
		UsageCountryDetails(product);
	}
	
</script>
</html>