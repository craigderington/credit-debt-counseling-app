



			<cfoutput>
				<div class="container">				
					<div class="row">						
						<div class="col-md-12">					
							<div class="widget stacked">							
								<div class="widget-header">
									<i class="fa fa-cog"></i>
									<h3>#application.agencyname# <i style="margin-right:5px;" class="fa fa-angle-double-right"></i>  Prospects</h3>
								</div>
								<div class="widget-content">									
									<cfinclude template="views/leads-list-view.cfm">								
									<br />							
								</div>						
							</div>					
						</div>					
					</div>
					<div style="margin-top:75px;"></div>				
				</div>
			</cfoutput>