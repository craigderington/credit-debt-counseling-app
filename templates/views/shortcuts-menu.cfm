									
									
									
									
					<cfoutput>				
									
									
									
									
									
									<!--- // show for sales and manager roles --->
									<cfif isuserinrole( "sales" ) or isuserinrole( "manager" )>
										<a href="#application.root#leads" class="shortcut">
											<i class="shortcut-icon fa fa-list-alt"></i>
											<span class="shortcut-label">View Leads</span>
										</a>
										
										<a href="#application.root#clients" class="shortcut">
											<i class="shortcut-icon fa fa-bookmark"></i>
											<span class="shortcut-label">View Clients</span>								
										</a>
										
										<a href="#application.root#newlead" class="shortcut">
											<i class="shortcut-icon fa fa-user-plus"></i>
											<span class="shortcut-label">New Lead</span>								
										</a>
										
										<a href="#application.root#calendar" class="shortcut">
											<i class="shortcut-icon fa fa-calendar"></i>
											<span class="shortcut-label">Calendar</span>								
										</a>
									</cfif>
									
									
									
									<cfif not isuserinrole( "sales" ) and not isuserinrole( "manager" )>
									
										<a href="#application.root#reports" class="shortcut">
											<i class="shortcut-icon fa fa-archive"></i>
											<span class="shortcut-label">Reports</span>	
										</a>
										
										<a href="#application.root#calendar" class="shortcut">
											<i class="shortcut-icon fa fa-calendar"></i>
											<span class="shortcut-label">Calendar</span>								
										</a>
										
										<a href="#application.root#search" class="shortcut">
											<i class="shortcut-icon fa fa-user"></i>
											<span class="shortcut-label">Search Clients</span>
										</a>
										
										<a href="#application.root#newlead" class="shortcut">
											<i class="shortcut-icon fa fa-user-plus"></i>
											<span class="shortcut-label">New Lead</span>	
										</a>
									
									
											<cfif isuserinrole( "execmanager" )>								
											
													<a href="#application.root#reports" class="shortcut">
														<i class="shortcut-icon fa fa-list-alt"></i>
														<span class="shortcut-label">Reports</span>	
													</a>
											
													<a href="#application.root#feesdue" class="shortcut">
														<i class="shortcut-icon fa fa-usd"></i>
														<span class="shortcut-label">Fees Due</span>
													</a>

													<a href="#application.root#checkdetails" class="shortcut">
														<i class="shortcut-icon fa fa-check-circle-o"></i>
														<span class="shortcut-label">Check Center</span>
													</a>
													
													<a href="#application.root#manageleads" class="shortcut">
														<i class="shortcut-icon fa fa-users"></i>
														<span class="shortcut-label">Lead Management</span>
													</a>
													
											<cfelseif isuserinrole( "efiscal" )>
											
													<a href="#application.root#checkcenter" class="shortcut">
														<i class="shortcut-icon fa fa-check-circle-o"></i>
														<span class="shortcut-label">Check Center</span>	
													</a>
											
													<a href="#application.root#feesdue" class="shortcut">
														<i class="shortcut-icon fa fa-bank"></i>
														<span class="shortcut-label">Fees</span>
													</a>

													<a href="#application.root#paymentcenter" class="shortcut">
														<i class="shortcut-icon fa fa-money"></i>
														<span class="shortcut-label">Disbursements</span>
													</a>
													
													<a href="#application.root#processreturns" class="shortcut">
														<i class="shortcut-icon fa fa-refresh"></i>
														<span class="shortcut-label">Process Returns</span>
													</a>
												
												
											</cfif>								
									
									</cfif>
									
					</cfoutput>