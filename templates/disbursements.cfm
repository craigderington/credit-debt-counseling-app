			
			
			
			
			
			
			
			<cfoutput>
				<div class="container">
				
					<div class="row">
						
						<div class="col-md-12">
					
							<div class="widget stacked">
							
								<div class="widget-header">
									<i class="fa fa-user-plus"></i>
									<h3>#trim( session.selectedclientname )#</h3>
								</div>

								<div class="widget-content">							  

									<div class="bs-example">
										<ul id="myTab" class="nav nav-tabs">
											<li><a href="#application.root#client"><i class="fa fa-money"></i> Escrow Register</a></li>
											<li><a href="#application.root#receipts"><i class="fa fa-usd"></i> Receipts</a></li>
											<li class="active"><a href="#application.root#disbursements"><i class="fa fa-check-square"></i> Disbursements</a></li>
											<li><a href="#application.root#fees"><i class="fa fa-briefcase"></i> Client Fees</a></li>
											<li><a href="#application.root#settlements"><i class="fa fa-building"></i> Settlement Summary</a></li>												
											<li><a href="#application.root#docs"><i class="fa fa-folder-open-o"></i> Client Documents</a></li>
													
												<li class="dropdown">
													<a href="##" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-cog"></i> More Options <b class="caret"></b></a>
														<ul class="dropdown-menu" role="menu">
															<li><a href="#application.root#lead" tabindex="-1">Lead Summary</a></li>
															<li><a href="#application.root#program" tabindex="-1">Program Summary</a></li>
															<li><a href="#application.root#debtworksheet" tabindex="-1">Debt Worksheet</a></li>
															<li><a href="#application.root#personaldata" tabindex="-1">Personal Data</a></li>
															<li><a href="#application.root#budget" tabindex="-1">Monthly Budget</a></li>
															<li><a href="#application.root#assets" tabindex="-1">A & L</a></li>
															<li><a href="#application.root#worksheet" tabindex="-1">Payment Worksheet</a></li>
														</ul>
												</li>
										</ul>
												
												
										<div class="tab-content">
											<div class="tab-pane fade active in" id="register">
											<h6 style="font-weight:900;">DISBURSEMENTS TO CREDITORS</strong></h6>
											<p style="margin-top:5px;">PAYMENTS TO CREDITORS...</p>
										</div>
													
													
									</div>
								</div>


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