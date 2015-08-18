			
			
			
			
			
			
			<cfoutput>
				
					<div class="subnavbar">

						<div class="subnavbar-inner">
		
							<div class="container">
								
								<a href="javascript:;" class="subnav-toggle" data-toggle="collapse" data-target=".subnav-collapse">
								  <span class="sr-only">Toggle navigation</span>
								  <i class="fa fa-reorder"></i>
								  
								</a>

								<div class="collapse subnav-collapse">
									<ul class="mainnav">
									
										<li class="active">
											<a href="#application.root#index">
												<i class="fa fa-home"></i>
												<span>Home</span>
											</a>	    				
										</li>
										
										<li class="dropdown">					
											<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
												<i class="fa fa-tasks"></i>
												<span>Counseling</span>
												<b class="caret"></b>
											</a>	    
										
											<ul class="dropdown-menu">
												<li><a href="#application.root#newlead">New Inquiry</a></li>
												<li><a href="#application.root#leads">Active Leads</a></li>
												<li><a href="#application.root#clients">Active Clients</a></li>
												<li><a href="#application.root#wizard">Begin Counseling Session</a></li>											
											</ul> 				
										</li>
										
										<cfif not isuserinrole( "sales" )>
										
											<li class="dropdown">					
												<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
													<i class="fa fa-comments-o"></i>
													<span>Service</span>
													<b class="caret"></b>
												</a>	    
											
												<ul class="dropdown-menu">
													<li class="dropdown-submenu">
														<a tabindex="-1" href="##">Enrollment</a>
														<ul class="dropdown-menu">
															<li><a tabindex="-1" href="#application.root#newapps">Review Applications</a></li>
															<li><a href="#application.root#checklist">Review Client Checklist</a></li>												  
														</ul>
													</li>
													<li class="dropdown-submenu">
														<a tabindex="-1" href="##">Admin</a>
														<ul class="dropdown-menu">
															<li><a tabindex="-1" href="#application.root#opensettlements">Open Settlements</a></li>
															<li><a href="#application.root#nsfreport">NSF Reports</a></li>
															<li><a href="#application.root#achexception">ACH Exceptions</a></li>
															<li><a href="#application.root#balances">Account Balances</a></li>
														</ul>
													</li>
													<li class="dropdown-submenu">
														<a tabindex="-1" href="##">Negotiation</a>
														<ul class="dropdown-menu">
															<li><a tabindex="-1" href="##">Pending Settlements</a></li>
															<li><a href="##">Ready for Settlement</a></li>
															<li><a href="##">Settlement Report</a></li>
															<li><a href="##">Settlement Settings</a></li>
														</ul>
													</li>									
													<li><a href="#application.root#clients">Manage Clients</a></li>
													<li><a href="#application.root#reminders">Reminders</a></li>
												</ul>
											</li>
										
										
											<li>
												<a href="#application.root#reports">
													<i class="fa fa-database"></i>
													<span>Reports</span>
												</a>	    				
											</li>
										</cfif>
										
										
										<cfif isuserinrole( "accounting" ) or isuserinrole( "execmanager" ) or isuserinrole( "efiscal" )>
											<li class="dropdown">					
												<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
													<i class="fa fa-bank"></i>
													<span>Accounting</span>
													<b class="caret"></b>
												</a>	
											
												<ul class="dropdown-menu">
													<li><a href="#application.root#checkdetails">Check Center</a></li>
													<li><a href="#application.root#achdue">ACH Due</a></li>
													<li><a href="#application.root#achhistory">ACH History</a></li>
													<li><a href="#application.root#latelist">Late List</a></li>
													<li><a href="#application.root#nsfreport">NSF Report</a></li>
													<li><a href="#application.root#processreturns">Process Returns</a></li>
													<li><a href="#application.root#revenueactivity">Revenue Activity</a></li>
													<li class="dropdown-submenu">
														<a tabindex="-1" href="##"> More Options </a>
														<ul class="dropdown-menu">
														  <li><a tabindex="-1" href="#application.root#feesdue">Fees Due - USA</a></li>
														  <li><a href="#application.root#feesdue">Fees Due - CAN</a></li>
														  <li><a href="#application.root#settlementfeesdue">Settlement Fees Due</a></li>
														  <li><a href="#application.root#opensettlements">Open Settlements</a></li>
														  <li><a href="#application.root#balances">Account Balances</a></li>
														</ul>
													</li>
												</ul>    				
											</li>
										</cfif>
										
										
										<cfif isuserinrole( "efiscal" )>
											<li class="dropdown">					
												<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
													<i class="fa fa-building-o"></i>
													<span>Escrow</span>
													<b class="caret"></b>
												</a>	
											
												<ul class="dropdown-menu">
													<li><a href="#application.root#checkcenter">Check Center</a></li>
													<li><a href="#application.root#disbursements">Disbursements</a></li>
													<li><a href="#application.root#receipts">Receipts</a></li>
													<li class="dropdown-submenu">
														<a tabindex="-1" href="##">Fees</a>
														<ul class="dropdown-menu">
														  <li><a tabindex="-1" href="#application.root#feesdue">Fees to PDR</a></li>
														  <li><a href="#application.root#escrowfees">Fees to eFiscal</a></li>
														  <li><a href="#application.root#feesother">Other Fees</a></li>
														</ul>
													  </li>
												</ul>    				
											</li>
										</cfif>
										
									
									</ul><!-- / .ul-main-nav-->
								</div> <!-- /.subnav-collapse -->

							</div> <!-- /container -->
						
						</div> <!-- /subnavbar-inner -->

					</div> <!-- /subnavbar -->				
			</cfoutput>