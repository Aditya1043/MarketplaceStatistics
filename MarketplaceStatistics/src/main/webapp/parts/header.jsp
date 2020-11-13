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
				<option>PowerCenter</option>
				<option>IICS</option>
			</select>  
		</div>
       

       </nav>
       <!-- End of Topbar -->