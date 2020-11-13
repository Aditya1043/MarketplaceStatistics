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

		<div class="row" >
                <div class="col-sm-12 chart-container" style="position: relative; padding-bottom:5px;">
		
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total Usage Hours</div>
                      <div id="numberOfHours" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
          </div>
		</div>
	
		   <div class="box effect1">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Number of hours an Informatica Product was deployed</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myChart2"></canvas>
                  </div>
                </div>
          </div>
	</div>
</body>

<script>
	!function(t){"use strict";t("#sidebarToggle, #sidebarToggleTop").on("click",function(o){t("body").toggleClass("sidebar-toggled"),t(".sidebar").toggleClass("toggled"),t(".sidebar").hasClass("toggled")&&t(".sidebar .collapse").collapse("hide")}),t(window).resize(function(){t(window).width()<768&&t(".sidebar .collapse").collapse("hide")}),t("body.fixed-nav .sidebar").on("mousewheel DOMMouseScroll wheel",function(o){if(768<t(window).width()){var e=o.originalEvent,l=e.wheelDelta||-e.detail;this.scrollTop+=30*(l<0?1:-1),o.preventDefault()}}),t(document).on("scroll",function(){100<t(this).scrollTop()?t(".scroll-to-top").fadeIn():t(".scroll-to-top").fadeOut()}),t(document).on("click","a.scroll-to-top",function(o){var e=t(this);t("html, body").stop().animate({scrollTop:t(e.attr("href")).offset().top},1e3,"easeInOutExpo"),o.preventDefault()})}(jQuery);
	var startDate = "";
	var endDate = "";
	var chart2;
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
	        minYear : 2014,
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
		chart2.destroy();
		product = document.getElementById("products");
		product.selectedIndex = 0;
		refreshChart("All");
	});
	
	function customerDetails(product){
		
	    $.ajax({
	        type: "GET",
	        contentType: "application/json",
	        url: "api/v1/customerDetails?toTime="+startDate+"&fromTime="+endDate+"&product="+product,
	        dataType: 'json',
	        cache: false,
	        timeout: 600000,
	        success: function (data1) {
	        	if(typeof chart2 !== "undefined") {
	    			chart2.destroy();
	    		}
	        	var labels = data1.map(function(e) {
        		   return e.product;
        		});
        		var data = data1.map(function(e) {
        		   return e.countSub;
        		});;
    			var ctx = document.getElementById('myChart2').getContext('2d');
    			ctx.canvas.parentNode.style.height = "400px";
    			var config = {
    					   type: 'bar',
    					   data: {
    					      labels: labels,
    					      datasets: [{
    					         label: 'Number of hours an Informatica Product was deployed',
    					         data: data,
    					         backgroundColor: ['rgb(255, 218, 179)','rgb(255, 119, 51)','rgb(179, 60, 0)','rgb(240, 160, 31)',
    					        	 'rgb(255, 85, 0)','rgb(255, 238, 230)','rgb(255, 150, 102)','rgb(255, 128, 0)','rgb(230, 115, 0)']		    					      }]
    					   },
    					   options: {
    						   legend: {
    						    	display: false
    						    },
    						    title: {
   						            display: true,
   						            text: 'Number of hours an Informatica Product was deployed',
						             fontSize: 14

   						        },
    						   scales: { 
    							   xAxes: [{
    					                ticks: {
    					                    autoSkip: false
    					                },
    					                barThickness: 40,
    					                scaleLabel: {
    							             display: true,
    							             labelString: 'Product',
    							             fontSize: 14
    							           }
    					            }],
    							   yAxes: [{
    							      ticks: {
    							             beginAtZero: true
    							           },
    							      scaleLabel: {
    							             display: true,
    							             labelString: 'Hours',
    							             fontSize: 14
    							           }
    							  }]
    							 },
    				            maintainAspectRatio: false,
    				            responsive: true
    				            }
    					};
    			
    			chart2 = new Chart(ctx, config);
	        }
	    });
	}

	function refreshChart(product){
	   $.ajax({
	        type: "GET",
	        contentType: "application/json",
	        url: "api/v1/countHours?product="+product+"&toTime="+startDate+"&fromTime="+endDate,
	        dataType: 'json',
	        cache: false,
	        timeout: 600000,
	        success: function (data1) {

	        	document.getElementById("numberOfHours").innerHTML = data1;
	        }
	    });
		customerDetails(product);
	}
	
</script>
</html>