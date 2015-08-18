			
			
			
			
			
			
			
			<cfoutput>
				<div class="container">				
					<div class="row">						
						<div class="col-md-12">					
							<div class="widget stacked">							
								<div class="widget-header">
									<i class="fa fa-calendar-o"></i>
									<h3>
										<cfif not isuserinrole( "sales" )>
										
											#application.agencyname# <i class="fa fa-angle-double-right"></i> &nbsp; Company Calendar
											
										<cfelse>
										
											Your Calendar
										
										</cfif>								
									</h3>
								</div>
								<div class="widget-content">
									
									{{ calendar content }}
									
									<br />
									<br />
									<br />							
								</div>						
							</div>					
						</div>					
					</div>
					<div style="margin-top:150px;"></div>				
				</div>
			</cfoutput>