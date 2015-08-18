




						
			
			
			
			
			
			<cfoutput>
				<div class="container">				
					<div class="row">						
						<div class="col-md-12">					
							<div class="widget stacked">							
								<div class="widget-header">
									<i class="fa fa-warning"></i>
									<h3>Error Processing Template</h3>
								</div>
								<div class="widget-content">							
									
									<div class="alert alert-alert-block alert-danger">										  
										
										<h3><i class="fa fa-cog fa-spin"></i> SYSTEM NAVIGATION ERROR!</h3>
										<p>Sorry for the inconvenience, but the resource you attempted to access could not be located within this system.</p>
										<p>&nbsp;</p>
										  
										<cfif not structkeyexists( session, "selectedclientid" )>
											<p>Please click here to navigate <a href="#application.root#index">Home</a>.
										<cfelse>
											<p>Please click here to navigate to the currently selected <a href="#application.root#client">Client Home</a>.
										</cfif>
									</div>
									
									
									<br />
									<br />
									<br />							
								</div>						
							</div>					
						</div>					
					</div>
					<div style="margin-top:300px;"></div>				
				</div>
			</cfoutput>