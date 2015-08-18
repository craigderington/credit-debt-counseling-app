			
			
			
			
			
			
			<cfoutput>
				<div class="container">				
					<div class="row">						
						<div class="col-md-12">					
							<div class="widget stacked">							
								<div class="widget-header">
									<i class="fa fa-cog"></i>
									<h3>#application.agencyname# <i class="fa fa-angle-double-right"></i> &nbsp; Manage Personnel</h3>
								</div>
								<div class="widget-content">
									<cfif isuserinrole( "execmanager" ) or isuserinrole( "efiscal" )>
										<cfinclude template="views/personnel-list-view.cfm">
									<cfelse>
										<cfinclude template="security-check-view.cfm">
									</cfif>																		
								</div>						
							</div>					
						</div>					
					</div>
					<div style="margin-top:150px;"></div>				
				</div>
			</cfoutput>