



			<cfoutput>
				<div class="container">				
					<div class="row">						
						<div class="col-md-12">					
							<div class="widget stacked">							
								<div class="widget-header">
									<i class="fa fa-user"></i>
									<h3>
										<cfif structkeyexists( session, "selectedclientname" )>
											<cfif session.selectedclientname neq "">
												#trim( session.selectedclientname )#
											<cfelse>
												No Client Selected
											</cfif>
										<cfelse>
											Your Selected Client
										</cfif>								
									</h3>
								</div>
								
								<div class="widget-content">
									
									<div class="bs-example">
										<ul id="myTab" class="nav nav-tabs">
											<li><a href="#application.root#lead"><i class="fa fa-reorder"></i> Lead Summary</a></li>
											<li class="active"><a href="#application.root#program"><i class="fa fa-th-large"></i> Program Summary</a></li>
											<li><a href="#application.root#debtworksheet"><i class="fa fa-th-list"></i> Debt Worksheet</a></li>
											<li><a href="#application.root#personaldata"><i class="fa fa-user-secret"></i> Personal Data</a></li>
											<li><a href="#application.root#budget"><i class="fa fa-money"></i> Budget</a></li>												
											<li><a href="#application.root#assets"><i class="fa fa-usd"></i> Assets</a></li>
											<li><a href="#application.root#worksheet"><i class="fa fa-bank"></i> Pay Info</a></li>
													
											<li class="dropdown">
												<a href="##" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog"></i> More Options <b class="caret"></b></a>
													<ul class="dropdown-menu" role="menu">
														<!---<li><a href="#application.root#client" tabindex="-1">Escrow Register</a></li>--->
														<li><a href="#application.root#receipts" tabindex="-1">Receipts</a></li>
														<li><a href="#application.root#disbursements" tabindex="-1">Disbursements</a></li>
														<li><a href="#application.root#fees" tabindex="-1">Fees</a></li>
														<li><a href="#application.root#settlements" tabindex="-1">Settlements</a></li>
														<li><a href="#application.root#docs" tabindex="-1">Client Documements</a></li>																
													</ul>
											</li>
										</ul>
									</div>
									
									<br />
									
									
									{{ program summary client data // content }}
									
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