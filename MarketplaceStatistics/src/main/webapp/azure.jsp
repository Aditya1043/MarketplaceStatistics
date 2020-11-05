<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>Azure Statistics: Graphs and Charts</title>
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
	<style>
		body{
	  		background: #e1ecf2;
		}
		a {
			color: inherit;
		}
		
		.effect1 {
			-webkit-box-shadow: 0 10px 6px -6px #777;
			-moz-box-shadow: 0 10px 6px -6px #777;
			box-shadow: 0 10px 6px -6px #777;
		}
		
		select {
			width: 150px;
			height: 30px;
			color: black;
		}
		
		select option {
			color: black;
		}
		
		select option:first-child {
			color: black;
		}
		.a:hover {
		  background-color: none;
		}
		button {
		    background-color: Transparent;
		    background-repeat:no-repeat;
		    border: none;
		    cursor:pointer;
		    overflow: hidden;
		    outline:none;
		    color:none;
		      padding: 12px 30px;
		   
		     text-align:center;
		}
		
		.button:hover {
		    background-color: none;
		}
		body {
		  font-family: "Lato", sans-serif;
		}
		
		.sidenav {
		  height: 100%;
		  width: 0;
		  margin-top:50px;
		  position: fixed;
		  z-index: 1;
		  top: 0;
		  left: 0;
		  background-color: #111;
		  overflow-x: hidden;
		  transition: 0.5s;
		  padding-top: 60px;
		}
		
		.sidenav a {
		  padding: 8px 8px 8px 32px;
		  text-decoration: none;
		  font-size: 25px;
		  color: #818181;
		  display: block;
		  transition: 0.3s;
		}
		
		.sidenav a:hover {
		  color: #f1f1f1;
		}
		
		.sidenav .closebtn {
		  position: absolute;
		  top: 0;
		  right: 25px;
		  font-size: 36px;
		  margin-left: 50px;
		}
		
		.padd {
			padding-top: 12px;
		    padding-right: 50px;
		    padding-bottom: 10px;
		    padding-left: 100px;
		}
		
		.pad {
			padding-top: 17px;
		}

		#main {
		  transition: margin-left .5s;
		  padding: 16px;
		  margin-top:50px;
		}
		
		@media screen and (max-height: 450px) {
		  .sidenav {padding-top: 15px;}
		  .sidenav a {font-size: 18px;}
		}
	</style>
	<link rel="stylesheet" href="css/temp.css">
</head>

<body  id="page-top">
	
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Dash Board</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
     <!-- Nav Item - AWS Collapse Menu -->
     <div class="sidebar-heading">
        Amazon Web Service
      </div>
     
      <li class="nav-item">
        <a class="nav-link" href="aws.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Main AWS Dashboard</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="first.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Monthly New Subscribers</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="second.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Hours of Deployment</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="third.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Subscribers per Product</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="fourth.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Usage units/Country</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="fifth.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Deployment hours per customer</span></a>
      </li>
      
      <!-- Divider -->
      <hr class="sidebar-divider">
  
       <!-- Nav Item - Azure Collapse Menu -->
       
             <!-- Nav Item - Dashboard -->
     <!-- Nav Item - AWS Collapse Menu -->
     <div class="sidebar-heading">
        Azure
      </div>
     
      <li class="nav-item">
        <a class="nav-link" href="azure.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>Main Azure Dashboard</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="firstaz.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Monthly New Subscribers</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="secondaz.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Usage Trends</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="thirdaz.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Usage Units/Country</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="fourthaz.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Usage Units/Product</span></a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="fifthaz.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Visits per Country</span></a>
      </li>
      
      <!-- Divider -->
      <hr class="sidebar-divider">
       
     
      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
            
            
            
<div class="nav navbar-nav navbar-center pad" style="position: relative">
				<div id="reportrange"
					style="background: #fff; cursor: pointer;">
					<i class="fa fa-calendar"></i>&nbsp; 
					<span></span> <i class="fa fa-caret-down"></i>
				</div>
			</div>
            
            <div class="nav navbar-nav navbar-right padd" style="position: relative">
			<span style="color:white">Products : </span><select id="products" onchange="refreshAllCharts(this.value)" style="border: #8dcca9; background-color: #f0f1f2;">
					<option>All</option>
					<option>BDM</option>
					<option>EDC</option>
					<option>DQ</option>
					<option>IICS</option>
					<option>PowerCenter</option>
				</select>  
			</div>
        

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">
            
            <div class="row">
			<div class="col-sm-6 chart-container" style="position: relative; padding-bottom:5px;">
		
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total No. of Subscribers</div>
                      <div id="numberOfSubsribers" class="h5 mb-0 font-weight-bold text-gray-800">0</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
          </div>
                
                <div class="col-sm-6 chart-container" style="position: relative; padding-bottom:5px;">
		
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
      <!--     <div class="box effect1">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">No. of Customers per Country</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <div id="myAreaChart1" style="position: relative; padding-bottom:5px;"></div>
                  </div>
                </div>
          </div>	-->

            <div class="row">
                <div class="col-sm-6 chart-container" style="position: relative; padding-bottom:5px;  padding-top: 50px">
				<div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Monthly new Subscribers</h6>
                  	<input id="chartTypeChkBox" type="checkbox" data-toggle="toggle" data-on="Cumulative" data-off="Monthly">
                </div>
                <div class="card-body">
                  <div class="chart-area">
                  		
                        <canvas id="myChart1"></canvas>
                  </div>
                </div>
              </div>
					
				</div>
			
            <div class="col-sm-6 chart-container" style="position: relative; padding-bottom:5px; padding-top: 50px">
				<div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Usage Trends</h6>
                </div>
                <div class="card-body">
                  <div class="chart-bar">
                    <canvas id="myChart2"></canvas>
                  </div>
                </div>
              </div>
                </div>
                </div>
            
            <div class="row">
			<div class="col-sm-6 chart-container" style="position: relative; padding-bottom:5px;">
				<div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Usage per product</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myChart3"></canvas>
                  </div>
                  </div>
              </div>	
                </div>
                
                <div class="col-sm-6 chart-container" style="position: relative; padding-bottom:5px;">
				<div class="card shadow mb-4">
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
			
             <div class="box effect1">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">Visits / Country</h6>
                </div>
                <div class="card-body">
                  <div class="chart-area">
                    <canvas id="myChart5"></canvas>
                  </div>
                </div>
          </div>
            
            <!-- /.container-fluid -->
        </div>
        <!-- End of Main Content -->
      </div>
        <!-- End of Content Wrapper -->
    </div>
     <!-- End of Page Wrapper -->
  </div>
 

  <!-- Scroll to Top Button
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>-->
</body>

<script>
	!function(t){"use strict";t("#sidebarToggle, #sidebarToggleTop").on("click",function(o){t("body").toggleClass("sidebar-toggled"),t(".sidebar").toggleClass("toggled"),t(".sidebar").hasClass("toggled")&&t(".sidebar .collapse").collapse("hide")}),t(window).resize(function(){t(window).width()<768&&t(".sidebar .collapse").collapse("hide")}),t("body.fixed-nav .sidebar").on("mousewheel DOMMouseScroll wheel",function(o){if(768<t(window).width()){var e=o.originalEvent,l=e.wheelDelta||-e.detail;this.scrollTop+=30*(l<0?1:-1),o.preventDefault()}}),t(document).on("scroll",function(){100<t(this).scrollTop()?t(".scroll-to-top").fadeIn():t(".scroll-to-top").fadeOut()}),t(document).on("click","a.scroll-to-top",function(o){var e=t(this);t("html, body").stop().animate({scrollTop:t(e.attr("href")).offset().top},1e3,"easeInOutExpo"),o.preventDefault()})}(jQuery);
	/*function openNav() {
	  document.getElementById("mySidenav").style.width = "250px";
	  document.getElementById("main").style.marginLeft = "250px";
	}

	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	  document.getElementById("main").style.marginLeft= "0";
	}*/
	var startDate = "";
	var endDate = "";
	var chart1;
	var chart2;
	var chart3;
	var chart4;
	var chart5;
	$(document).ready(function () {
		setDate();
		refreshAllCharts("All");
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
		chart1.destroy();
		chart2.destroy();
		chart3.destroy();
		chart4.destroy();
		chart5.destroy();
		product = document.getElementById("products");
		product.selectedIndex = 0;
		refreshAllCharts("All");
	});
	
	$('#chartTypeChkBox').change(function(){
		customerDetailsByDate();
	});
	
	function customerDetailsByDate(){	
		if (document.getElementById("chartTypeChkBox").checked) {
			customerDetailsByDateType2();
		}
		else {
			customerDetailsByDateType1();
		}
	}
	
	function customerDetailsByDateType1(){	  
		  $.ajax({
		        type: "GET",
		        contentType: "application/json",
		        url: "api/v1/azure/customerDetailsByDate?toTime="+startDate+"&fromTime="+endDate,
		        dataType: 'json',
		        cache: false,
		        timeout: 600000,
		        success: function (data1) {
		        	if(typeof chart1 !== "undefined") {
		    			chart1.destroy();
		    		}  	
		        	function newDateMoment(date) {
					  return moment(date).format('MMMM YYYY');
					}
		        	var labels = data1.map(function(e) {
		        		var dt = newDateMoment(e.product);
		        		return dt;
		        	});
	        		var data = data1.map(function(e) {
	        		   return e.countSub;
	        		});

	    			var ctx = document.getElementById('myChart1').getContext('2d');
	    			ctx.canvas.parentNode.style.height = "400px";
	    			
	    			var config = {
	    					   type: 'bar',
	    					   data: {
	    					      labels: labels,
	    					      datasets: [{
	    					         label: 'Subscribers',
	    					         data: data,
	    					         fill: false,
	    					         backgroundColor: ['rgb(255, 218, 179)','rgb(255, 119, 51)','rgb(179, 60, 0)','rgb(240, 160, 31)',
	    					        	 'rgb(255, 85, 0)','rgb(255, 238, 230)','rgb(255, 150, 102)','rgb(255, 128, 0)','rgb(230, 115, 0)']		    					      }]
	    					   },
	    					   options: {
	    						   legend: {
	    						    	display: false
	    						    },
	    						    title: {
    						            display: true,
    						            text: 'Monthly New Subscribers for Informatica products',
							             fontSize: 14

    						        },
	    						   scales: { 
	    							   xAxes: [{
	    					                type: 'time',
	    					                offset: true,
	    					                time: {
	    					                    unit: 'month',
	    					                    displayFormats: { month: 'MMMM YYYY' },
	    				                        parser: 'MMMM YYYY'
	    					                },
	    					                barThickness: 20,
	    					                scaleLabel: {
	    							             display: true,
	    							             labelString: 'Month',
	    							             fontSize: 14
	    							           }
	    					            }],
	    							   yAxes: [{
	    							      ticks: {
	    							             beginAtZero: true
	    							           },
	    							      scaleLabel: {
	    							             display: true,
	    							             labelString: 'Subscribers',
	    							             fontSize: 14
	    							           }
	    							  }]
	    							 },
	    				            maintainAspectRatio: false,
	    				            responsive: true
	    				            }
	    					};		
	    			chart1 = new Chart(ctx, config);
		        }
		    });

	}
	
	function customerDetailsByDateType2(){		
		$.ajax({
	        type: "GET",
	        contentType: "application/json",
	        url: "api/v1/azure/customerDetailsByDate?toTime="+startDate+"&fromTime="+endDate,
	        dataType: 'json',
	        cache: false,
	        timeout: 600000,
	        success: function (data1) {
	        	if(typeof chart1 !== "undefined") {
	    			chart1.destroy();
	    		}
	        	function newDateMoment(date) {
				  	return moment(date).format('MMMM YYYY');
				}
	        	var labels = data1.map(function(e) {       
        			var dt = newDateMoment(e.product);
        		    return dt;
        		});       
        		var data2 = data1.map(function(e) {
		       		return e.countSub;
        		});

        		var data= [];
        		var subSum=0;
        		for (i=0; i<data2.length; i++)
        		{
        			subSum = subSum + data2[i];
        			data.push(subSum);
        		}
        		
    			var ctx = document.getElementById('myChart1').getContext('2d');
    			ctx.canvas.parentNode.style.height = "400px";
    			
    			var config = {
   					   type: 'line',
   					   data: {
   					      labels: labels,
   					      datasets: [{
   					         label: 'Subscribers',
   					         data: data,
   					         borderColor: ['rgb(255, 218, 179)'],
   					         fill: 'start'
   					      }]
   					   },
   					   options: {
   						   legend: {
   						    	display: false
   						    },
   						    title: {
						            display: true,
						            text: 'Subscribers for Informatica products',
					             fontSize: 14

						        },
   						   scales: { 
   							   xAxes: [{
   					                type: 'time',
   					                offset: true,
   					                time: {
   					                    unit: 'month',
   					                    displayFormats: { month: 'MMMM YYYY' },
   				                        parser: 'MMMM YYYY'
   					                },
   					                barThickness: 20,
   					                scaleLabel: {
   							             display: true,
   							             labelString: 'Month',
   							             fontSize: 14
   							           }
   					            }],
   							   yAxes: [{
   							      ticks: {
   							             beginAtZero: true
   							           },
   							      scaleLabel: {
   							             display: true,
   							             labelString: 'Subscribers',
   							             fontSize: 14
   							           }
   							  }]
   							 },
   				            maintainAspectRatio: false,
   				            responsive: true
   				    	}
    				};		
    			chart1 = new Chart(ctx, config);
	        }
	    });
	}
	
	function trendDetails(){
		$.ajax({
	        type: "GET",
	        contentType: "application/json",
	        url: "api/v1/azure/trendsDetails?toTime="+startDate+"&fromTime="+endDate,
	        dataType: 'json',
	        cache: false,
	        timeout: 600000,
	        success: function (data1) {
	    		console.log(data1);
	        	if(typeof chart2 !== "undefined") {
	    			chart2.destroy();
	    		}
	        	function newDateMoment(date) {
					return moment(date).format('MMMM YYYY');
				}
	        	
	        	var labels = data1.map(function(e) {
        			var dt = newDateMoment(e.usingDate);
        			return dt;
        		});
	        	
        		var activeData = data1.map(function(e) {
        		   return e.activeCustomers;
        		});
        		
        		var newdata = data1.map(function(e) {        
	        	   return e.newCustomers;
	        	});
        	
	        	var churnedCustomers = data1.map(function(e) {        
		       	   return e.churnedCustomers;
		      	});
        		
    			var ctx = document.getElementById('myChart2').getContext('2d');
    		    ctx.canvas.parentNode.style.height = "400px";
    		
    			var config = {
   					   type: 'bar',
   					   data: {
   					      labels: labels,
   					      datasets: [
   					    	  {
   					    		    label: 'Active Customers',
   					    		    data: activeData,
   					    		 	backgroundColor:'rgb(255, 218, 179)'

   					    		  },
   					    		  {
   					    		    label: 'New Customers',
   					    		    data: newdata,
   					    		 	backgroundColor:'rgb(255, 119, 51)'

   					    		  },
   					    		  {
   					    		    label: 'Churned Customers',
   					    		    data: churnedCustomers,
   					    		 	backgroundColor:'rgb(179, 60, 0)'
   					    		  }
   					    		]
   					   },
   					   options: {
   						   legend: {
   						    	display: false
   						    },
   						    title: {
  						            display: true,
  						            text: 'User Trend for Informatica products',
					             fontSize: 14

  						        },
   						   scales: { 
   							   xAxes: [{
   					                type: 'time',
   					                offset: true,
   					                stacked:true,
   					                time: {
   					                    unit: 'month',
   					                    displayFormats: { month: 'MMMM YYYY' },
   				                        parser: 'MMMM YYYY'
   					                },
   					             	barThickness: 20,
   					                scaleLabel: {
   							             display: true,
   							             labelString: 'Month',
   							             fontSize: 14
   							           }
   					            }],
   							   yAxes: [{
   					                stacked:true,

   							      ticks: {
   							             beginAtZero: true
   							           },
   							      scaleLabel: {
   							             display: true,
   							             labelString: 'Users',
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
	
	function UsageProductDetails(product){
		 $.ajax({
		        type: "GET",
		        contentType: "application/json",
		        url: "api/v1/azure/customerDetails?toTime="+startDate+"&fromTime="+endDate+"&product="+product,
		        dataType: 'json',
		        cache: false,
		        timeout: 600000,
		        success: function (data1) {
		        	if(typeof chart3 !== "undefined") {
		    			chart3.destroy();
		    		}
		        	var labels = data1.map(function(e) {
	        		   return e.product ;
	        		});
	        		var data = data1.map(function(e) {
	        		   return e.countSub;
	        		});
		        	var ctx = document.getElementById('myChart3').getContext('2d');
		        	ctx.canvas.parentNode.style.height = "400px";
		        	var config = {
	  					   type: 'doughnut',
	  					   data: {
	  					      labels: labels,
	  					      datasets: [{
	  					         label: 'Company',
	  					         data: data,
	  					         backgroundColor: ['rgb(255, 218, 179)','rgb(255, 119, 51)','rgb(179, 60, 0)','rgb(240, 160, 31)',
	  					        	 'rgb(255, 85, 0)','rgb(255, 238, 230)','rgb(255, 150, 102)','rgb(255, 128, 0)','rgb(230, 115, 0)','rgb(255, 218, 179)','rgb(255, 119, 51)','rgb(179, 60, 0)','rgb(240, 160, 31)',
	  					        	 'rgb(255, 85, 0)','rgb(255, 238, 230)','rgb(255, 150, 102)','rgb(255, 128, 0)','rgb(230, 115, 0)','rgb(255, 218, 179)','rgb(255, 119, 51)','rgb(179, 60, 0)','rgb(240, 160, 31)',
	  					        	 'rgb(255, 85, 0)','rgb(255, 238, 230)','rgb(255, 150, 102)','rgb(255, 128, 0)','rgb(230, 115, 0)']
	  					      }]
	  					   },
	  					   options: {
						        plugins: {
						            datalabels: {
						                display: false
						            }
						        },
	  						   legend: {
	  						    	display: true
	  						    },
	  							 title: {
	  						            display: true,
	  						            text: 'Usage units / Product',
						             fontSize: 14

	  						        },
	  				            responsive: true,
	  				            maintainAspectRatio: false
	  				            }
	  					};
		        	
		        	chart3 = new Chart(ctx, config);
		        }
		    })
	}
	
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
	
	function VisitsCountryDetails(product){
		 $.ajax({
		        type: "GET",
		        contentType: "application/json",
		        url: "api/v1/azure/customerDetailsStacked?toTime="+startDate+"&fromTime="+endDate+"&product="+product,
		        dataType: 'json',
		        cache: false,
		        timeout: 600000,
		        success: function (data1) {
		        	data1.sort((a, b) => {
		        	    let fa = a.company,
		        	        fb = b.company;

		        	    if (fa < fb) {
		        	        return -1;
		        	    }
		        	    if (fa > fb) {
		        	        return 1;
		        	    }
		        	    return 0;
		        	});
		        	
		        	if(typeof chart5 !== "undefined") {
		    			chart5.destroy();
		    		}
		        	var labels = data1.map(function(e) {
	        		   return e.company;
	        		});
	        		var BDM = data1.map(function(e) {     
	        		   return e.BDM;
	        		});	        		
	        		var DEI = data1.map(function(e) {    		        
	        		   return e.DEI;
	        		});	
	        		var DEQ = data1.map(function(e) {
	        		   return e.DEQ;
	        		});	        		
	        		var DES = data1.map(function(e) {    		        
	        		   return e.DES;
	        		});	        		
	        		var DQ = data1.map(function(e) {    		        
	        		   return e.DQ;
	        		});	        		
	        		var EDC = data1.map(function(e) {    		        
	        		   return e.EDC;
	        		});		        		
	        		var EDP = data1.map(function(e) { 		        
	        		   return e.EDP;
	        		});
	        		var IICS = data1.map(function(e) { 		        
	        		   return e.IICS;
	        		});
	        		var PowerCenter = data1.map(function(e) { 		        
	        		   return e.PowerCenter;
	        		});
			        			
		     		var ctx = document.getElementById('myChart5').getContext('2d');
	    			if ( labels.length < 10){    		    	 
			    		ctx.canvas.parentNode.style.height ="500px";
	    		    }
	    		    else {
			    		ctx.canvas.parentNode.style.height = (labels.length * 30)+"px";
	    		    }	
	    			 
	    			var config = {
    					   type: 'horizontalBar',
    					   data: {
    					      labels: labels,
    					      datasets: [
    					    	  {
    					    		    label: 'BDM Usage',
    					    		    data: BDM,
	    					    		    backgroundColor:'rgb(255, 218, 179)'

    					    	   },
    					           {
	    					    		label: 'DEI Usage',
	    					    		data: DEI,
		    					    	backgroundColor:'rgb(255, 119, 51)'

	    			         	  },
	    					     {
		    					    	label: 'DEQ Usage',
		    					    	data: DEQ,
			    					    backgroundColor:'rgb(179, 60, 0)'

		    		    		  },
		    					    		  
		    					   {
			    					    label: 'DES Usage',
			    					    data: DES,
				    					 backgroundColor:'rgb(240, 160, 31)'

			    				     },
			    				     
			    				     {
				    					    label: 'DQ Usage',
				    					    data: DQ,
					    					 backgroundColor:'rgb(255, 85, 0)'

				    				     },
				    				     
				    				     {
					    					    label: 'EDC Usage',
					    					    data: EDC,
						    					 backgroundColor:'rgb(214, 123,  2)'

					    				     },
					    				     
					    				     {
						    					    label: 'EDP Usage',
						    					    data: EDP,
							    					 backgroundColor:'rgb(255, 128, 0)'

						    				     },
					    				     {
						    					    label: 'IICS Usage',
						    					    data: IICS,
							    					 backgroundColor:'rgb(255, 128, 0)'

						    				     },
					    				     {
						    					    label: 'PowerCenter Usage',
						    					    data: PowerCenter,
							    					 backgroundColor:'rgb(255, 128, 0)'

						    				     }
    					    		]
    					   },
    					   options: {
    						   plugins: {
    							    datalabels: {
    							    	color: '#000000',
    							    	font: {
    							            weight: 'bold',
    							            size: 10,
    							          },
    							       display: function(context) {
    							          return  context.dataset.data[context.dataIndex] >= 500;
    							       }
    							    }
    							  },
    						   legend: {
    						    	display: false
    						    },
    						    title: {
   						            display: true,
   						            text: 'Visits/Country',
					             fontSize: 14

   						        },
    						   scales: { 
    							   xAxes: [{
    					                stacked:true,
    					                scaleLabel: {
    							             display: true,
    							             labelString: 'Visits',
    							             fontSize: 14
    							           }
    					            }],
    							   yAxes: [{
    					                stacked:true,

    							      ticks: {
    							             beginAtZero: true
    							           },
    							      scaleLabel: {
    							             display: true,
    							             labelString: 'Country',
    							             fontSize: 14
    							           }
    							  }]
    							 },
	    				            maintainAspectRatio: false,
    				            responsive: true
    				            }
    					};
	    			chart5 = new Chart(ctx, config);
		        }
		 });
	}
	
	
	
	function refreshAllCharts(product){
		 $.ajax({
		        type: "GET",
		        contentType: "application/json",
		        url: "api/v1/azure/countSubscribers?toTime="+startDate+"&fromTime="+endDate,
		        dataType: 'json',
		        cache: false,
		        timeout: 600000,
		        success: function (data1) {

		        	document.getElementById("numberOfSubsribers").innerHTML =data1;
		        }
		   });
		  
		   $.ajax({
		        type: "GET",
		        contentType: "application/json",
		        url: "api/v1/azure/countHours?product="+product+"&toTime="+startDate+"&fromTime="+endDate,
		        dataType: 'json',
		        cache: false,
		        timeout: 600000,
		        success: function (data1) {

		        	document.getElementById("numberOfHours").innerHTML = data1;
		        }
		    });
		customerDetailsByDate();
		trendDetails();
		UsageProductDetails(product);
		UsageCountryDetails(product);
		VisitsCountryDetails(product);		
	}

</script>
</html>