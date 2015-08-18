



			
			
			
			
			
			
		<cfoutput>
			<div class="main">

				<div class="container">

				  <div class="row">
					
					<div class="col-md-6 col-xs-12">						
						
						<div class="widget stacked">
								
							<div class="widget-header">
								<i class="fa fa-bookmark"></i>
								<h3>Navigation Shortcuts</h3>
							</div> <!-- /widget-header -->
							
							<div class="widget-content">
								
								<div class="shortcuts">
									<cfinclude template="views/shortcuts-menu.cfm">
								</div>
							
							</div> <!-- /widget-content -->
							
						</div> <!-- /widget -->
						
						
						<!--- dashboard --->
						<div class="widget stacked">								
							<div class="widget-header">
								<i class="fa fa-dashboard"></i>
								<h3>								
								<cfif structkeyexists( session, "username" )>
									#session.username#'s Dashboard
								<cfelse>
									Your Dashboard
								</cfif>
								</h3>
							</div><!-- /widget-header -->							
								
								<div class="widget-content">								
									<cfinclude template="views/dashboard-view-count.cfm">								
								</div> <!-- /widget-content -->
								
						</div> <!-- /widget -->
						
						
						
						

						<div class="widget widget-nopad stacked">
										
								<div class="widget-header">
									<i class="fa fa-list-alt"></i>
									<h3>Important News</h3>
								</div> <!-- /widget-header -->
								
								<div class="widget-content">
									
									<ul class="news-items">
										<li>
											
											<div class="news-item-detail">										
												<a href="javascript:;" class="news-item-title">Duis aute irure dolor in reprehenderit</a>
												<p class="news-item-preview">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
											</div>
											
											<div class="news-item-date">
												<span class="news-item-day">08</span>
												<span class="news-item-month">Mar</span>
											</div>
										</li>
										<li>
											<div class="news-item-detail">										
												<a href="javascript:;" class="news-item-title">Duis aute irure dolor in reprehenderit</a>
												<p class="news-item-preview">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
											</div>
											
											<div class="news-item-date">
												<span class="news-item-day">08</span>
												<span class="news-item-month">Mar</span>
											</div>
										</li>
										<li>
											<div class="news-item-detail">										
												<a href="javascript:;" class="news-item-title">Duis aute irure dolor in reprehenderit</a>
												<p class="news-item-preview">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>
											</div>
											
											<div class="news-item-date">
												<span class="news-item-day">08</span>
												<span class="news-item-month">Mar</span>
											</div>
										</li>
									</ul>
									
								</div> <!-- /widget-content -->
							
							</div> <!-- /widget -->	
						
					</div> <!-- /span6 -->
					
					
					<div class="col-md-6">						
								
						
								
							<div class="widget stacked">
							
								<div class="widget-header">
									<i class="fa fa-calendar-o"></i>
									<h3>Calendar</h3>
								</div> <!-- /widget-header -->
							
								<div class="widget-content" style="margin-top:-15px;">								
									<!--- get the small calendar for the dashboard --->
									<cfinclude template="views/calendar-view.cfm">								
								</div>
							</div>
							
							<div class="widget stacked widget-table action-table">
							
								<div class="widget-header">
									<i class="fa fa-th-list"></i>
									<h3>Dashboard Client List</h3>
								</div> <!-- /widget-header -->
							
								<div class="widget-content">	
									<!--- // get the list of clients of for the dashboard --->
									<cfinclude template="views/dashboard-clients.cfm">
								</div> <!-- /widget-content -->
						
							</div> <!-- /widget -->						
											
					  </div> <!-- /span6 -->
					
				  </div> <!-- /row -->

				</div> <!-- /container -->
    
			</div> <!-- /main -->
		</cfoutput>