			
			
			
			
			
			<cfoutput>
				<div class="container">				
					<div class="row">						
						<div class="col-md-12">					
							<div class="widget stacked">							
								<div class="widget-header">
									<i class="fa fa-cog"></i>
									<h3>#application.agencyname# <i class="fa fa-angle-double-right" style="margin-right:5px;"></i> Settlement Settings</h3>
								</div>
								<div class="widget-content">									
									<cfif isuserinrole( "efiscal" )>
										<cfinclude template="views/settlement-settings-view.cfm">
									<cfelse>
										<cfinclude template="views/security-check-view.cfm">
									</cfif>								
									<br />							
								</div>						
							</div>					
						</div>					
					</div>
					<div style="margin-top:75px;"></div>				
				</div>
			</cfoutput>