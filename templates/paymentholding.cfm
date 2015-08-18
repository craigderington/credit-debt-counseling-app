			
			
			
			
			
			
			<cfoutput>
				<div class="container">				
					<div class="row">						
						<div class="col-md-12">					
							<div class="widget stacked">							
								<div class="widget-header">
									<i class="fa fa-cog"></i>
									<h3>#application.agencyname# <i class="fa fa-angle-double-right" style="margin-right:5px;"></i> Payment Holding</h3>
								</div>
								<div class="widget-content">									
									<cfif isuserinrole( "efiscal" )>
										<cfinclude template="views/payment-holding-view.cfm">
									<cfelse>
										<div class="alert alert-danger alert-dismissable">
											<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
											<i class="fa fa-warning"></i> <strong>SYSTEM ALERT!</strong> You are attempting to access a secured resource in which your permissions are not sufficient.  This activity has been logged and reprted to the system administrator.  You can navigate away from this page at any time.
										</div>
									</cfif>								
									<br />							
								</div>						
							</div>					
						</div>					
					</div>
					<div style="margin-top:75px;"></div>				
				</div>
			</cfoutput>