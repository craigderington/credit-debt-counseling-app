





					<cfoutput>
		
		
							
							
							
							
							<cfif isuserinrole( "efiscal" )>
							
									<a href="#application.root#paymentholding" class="shortcut">
										<i class="shortcut-icon fa fa-money"></i>
										<span class="shortcut-label">Payment Holding</span>
									</a>
										
									<a href="#application.root#stateregulations" class="shortcut">
										<i class="shortcut-icon fa fa-globe"></i>
										<span class="shortcut-label">State Regulations</span>								
									</a>
										
									<a href="#application.root#settings" class="shortcut">
										<i class="shortcut-icon fa fa-gears"></i>
										<span class="shortcut-label">Settlement Settings</span>								
									</a>
										
									<a href="#application.root#billing" class="shortcut">
										<i class="shortcut-icon fa fa-usd"></i>
										<span class="shortcut-label">Program<br /> Fees</span>								
									</a>					
							
									<br />
							</cfif>

							
							<cfif isuserinrole( "efiscal" ) or isuserinrole( "execmanager" )>
							
								<a href="#application.root#leadsources" class="shortcut">
									<i class="shortcut-icon fa fa-users"></i>
									<span class="shortcut-label">Lead <br />Sources</span>
								</a>
										
								<a href="#application.root#offices" class="shortcut">
									<i class="shortcut-icon fa fa-bank"></i>
									<span class="shortcut-label">Manage <br />Offices</span>								
								</a>
										
								<a href="#application.root#users" class="shortcut">
									<i class="shortcut-icon fa fa-user-plus"></i>
									<span class="shortcut-label">Manage <br />Personnel</span>								
								</a>
										
								<a href="#application.root#systemeventlog" class="shortcut">
									<i class="shortcut-icon fa fa-server"></i>
									<span class="shortcut-label">System <br />Events</span>								
								</a>
							
							
							</cfif>
							
							
							
							
					</cfoutput>		
							