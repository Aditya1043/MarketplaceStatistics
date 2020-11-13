<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Dashboard</title>        
  <style>
      .ch-grid {
	margin: 20px 0 0 0;
	padding: 0;
	list-style: none;
	display: block;
	text-align: center;
	width: 100%;
}

.ch-grid:after,
.ch-item:before {
	content: '';
    display: table;
}

.ch-grid:after {
	clear: both;
}

.ch-grid li {
	width: 220px;
	height: 220px;
	display: inline-block;
	margin: 20px;
}
      
      .ch-item {
	width: 100%;
	height: 100%;
	border-radius: 50%;
	position: relative;
	box-shadow: 0 1px 2px rgba(0,0,0,0.1);
	cursor: default;
}

.ch-info-wrap{
	position: absolute;
	width: 180px;
	height: 180px;
	border-radius: 50%;

	-webkit-perspective: 800px;
	-moz-perspective: 800px;
	-o-perspective: 800px;
	-ms-perspective: 800px;
	perspective: 800px;

	-webkit-transition: all 0.4s ease-in-out;
	-moz-transition: all 0.4s ease-in-out;
	-o-transition: all 0.4s ease-in-out;
	-ms-transition: all 0.4s ease-in-out;
	transition: all 0.4s ease-in-out;

	top: 20px;
	left: 20px;
	box-shadow: 
		0 0 0 20px rgba(255,255,255,0.2), 
		inset 0 0 3px rgba(115,114, 23, 0.8);

}

.ch-info{
	position: absolute;
	width: 180px;
	height: 180px;
	border-radius: 50%;

	-webkit-transition: all 0.4s ease-in-out;
	-moz-transition: all 0.4s ease-in-out;
	-o-transition: all 0.4s ease-in-out;
	-ms-transition: all 0.4s ease-in-out;
	transition: all 0.4s ease-in-out;
		
	-webkit-transform-style: preserve-3d;
	-moz-transform-style: preserve-3d;
	-o-transform-style: preserve-3d;
	-ms-transform-style: preserve-3d;
	transform-style: preserve-3d;

}

.ch-info > div {
	display: block;
	position: absolute;
	width: 100%;
	height: 100%;
	border-radius: 50%;
	background-position: center center;

	-webkit-backface-visibility: hidden;
	-moz-backface-visibility: hidden;
	-o-backface-visibility: hidden;
	-ms-backface-visibility: hidden;
	backface-visibility: hidden;
}

.ch-info .ch-info-back {
	-webkit-transform: rotate3d(0,1,0,180deg);
	-moz-transform: rotate3d(0,1,0,180deg);
	-o-transform: rotate3d(0,1,0,180deg);
	-ms-transform: rotate3d(0,1,0,180deg);
	transform: rotate3d(0,1,0,180deg);
	
	background: orange;
}

.ch-info .ch-info-back1 {
	-webkit-transform: rotate3d(0,1,0,180deg);
	-moz-transform: rotate3d(0,1,0,180deg);
	-o-transform: rotate3d(0,1,0,180deg);
	-ms-transform: rotate3d(0,1,0,180deg);
	transform: rotate3d(0,1,0,180deg);
	
	background: lightblue;
}      
      
.ch-img-1 { 
	background-image: url(data:image/png;base64,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);
}

.ch-img-2 { 
	background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSmoKtKFi88K8I7fZv_93BKVhhAxbWU-HnFvw&usqp=CAU);
}

.ch-info h3 {
	color: #fff;
	text-transform: uppercase;
	letter-spacing: 2px;
	font-size: 14px;
	margin: 0 15px;
	padding: 40px 0 0 0;
	height: 90px;
	font-family: 'Open Sans', Arial, sans-serif;
	text-shadow: 
		0 0 1px #fff, 
		0 1px 2px rgba(0,0,0,0.3);
}

.ch-info p {
	color: #fff;
	padding: 10px 5px;
	font-style: italic;
	margin: 0 30px;
	font-size: 12px;
	border-top: 1px solid rgba(255,255,255,0.5);
}

.ch-info p a {
	display: block;
	color: #fff;
	color: rgba(255,255,255,0.7);
	font-style: normal;
	font-weight: 700;
	text-transform: uppercase;
	font-size: 9px;
	letter-spacing: 1px;
	padding-top: 4px;
	font-family: 'Open Sans', Arial, sans-serif;
}

.ch-info p a:hover {
	color: #fff222;
	color: rgba(255,242,34, 0.8);
}

.ch-item:hover .ch-info-wrap {
	box-shadow: 
		0 0 0 0 rgba(255,255,255,0.8), 
		inset 0 0 3px rgba(115,114, 23, 0.8);
}

.ch-item:hover .ch-info {
	-webkit-transform: rotate3d(0,1,0,-180deg);
	-moz-transform: rotate3d(0,1,0,-180deg);
	-o-transform: rotate3d(0,1,0,-180deg);
	-ms-transform: rotate3d(0,1,0,-180deg);
	transform: rotate3d(0,1,0,-180deg);
}
      
      @import url('https://fonts.googleapis.com/css?family=Quicksand');

html,body {
  height: 100%;
}

.wrapper {
  height: 100%;
  font-family: 'Quicksand', sans-serif;
  line-height: 1.5;
  word-spacing: 4px;
  letter-spacing: 1px;
}

.fixed-bg {
  background-attachment: fixed;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center center;
  height: 30%; 
  width: 100%;
  color: white;
  text-align: center;
  display: table;
    
}

.fixed-bg h1 {
  display: table-cell;
  vertical-align: middle;
}

.scroll-bg {
  background-color: white;
  padding: 10px 70px;
  color: white;
}

/* first section */

.bg-1 {
  background-image: url('https://i.pinimg.com/474x/aa/89/8f/aa898f8a047e4cf45d9cff6d34b93c0e.jpg');
}


        </style>
    </head>
    <body>
        
        
        <div class="wrapper"> <!-- wrapper div starts -->
  <div style="margin-left: 0px" >
         <img src="https://www.informatica.com/content/dam/informatica-com/en/images/cc02v2/logo-informatica.svg" height="50px">
        </div>
  <div class="fixed-bg bg-1">
    <h1>Marketplace Statistics</h1>
  </div>
  
  <div class="scroll-bg">
        <div class="container">
			<section class="main">
			
				<ul class="ch-grid">
                    <li>
						<div class="ch-item ch-img-1">				
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-1"></div>
									<div class="ch-info-back">
                                        <a style="text-decoration: none" href="aws.jsp">
										<h3>Amazon Web Services Report</h3>
										<p><a href="aws.jsp">Go Here</a></p>
                                        </a>
									</div>	
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-item ch-img-2">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-2"></div>
									<div class="ch-info-back1">
                                        <a style="text-decoration: none"  href="azure.jsp">
										<h3>Microsoft Azure Report</h3>
										<p><a href="azure.jsp">Go Here</a></p>
                                            </a>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
				
			</section>
        </div>
            </div>
        </div>
    </body>
</html>