



							<cfinvoke component="apis.com.dashboard.dashboardservice" method="getdashboard" returnvariable="dashboard">
						
							
							
							<cfoutput>

								<div class="stats">
									
									<div class="stat">
										<span class="stat-value">#dashboard.totalactiveclients#</span>									
										ACTIVE
									</div> <!-- /stat -->
									
									<div class="stat" style="margin-left:5px;">
										<span class="stat-value">#dashboard.totalcompleted#</span>									
										COMPLETED
									</div> <!-- /stat -->
									
									<div class="stat">
										<span class="stat-value">#dashboard.totalprospect#</span>									
										PROSPECT
									</div> <!-- /stat -->
									
									<div class="stat">
										<span class="stat-value">#dollarformat( dashboard.totaldebt )#</span>									
										TOTAL ENROLLED DEBT
									</div> <!-- /stat -->
									
								</div> <!-- /stats -->
								
							</cfoutput>