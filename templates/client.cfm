




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
													<li class="active"><a href="##register"><i class="fa fa-money"></i> Escrow Register</a></li>
													<li><a href="#application.root#receipts"><i class="fa fa-usd"></i> Receipts</a></li>
													<li><a href="#application.root#disbursements"><i class="fa fa-check-square"></i> Disbursements</a></li>
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
														<h6 style="font-weight:900;">ESCROW REGISTER</strong></h6>
														<p style="margin-top:5px;"><cfinclude template="views/escrow-register.cfm"></p>
													</div>
													
													<!---
													<div class="tab-pane fade" id="receipts">
														<strong>Receipts <span class="pull-right"><span class="label label-primary"><i class="fa fa-dollar"></i> Total Paid: {{add data}}</span></span></strong>
														<p style="margin-top:5px;"><cfinclude template="views/payments-receipts.cfm"></p>
													</div>
												
													<div class="tab-pane fade" id="disbursements">
														<strong>Disbursements</strong>
														<p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
													</div>
												
													<div class="tab-pane fade" id="fees">
														<strong>Client Fees</strong>
														<p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
													</div>
													
													<div class="tab-pane fade" id="ssummary">
														<strong>Settlement Summary</strong>
														<p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
													</div>
													
													<div class="tab-pane fade" id="docs">
														<strong>Client Documents</strong>
														<p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
													</div>
													--->
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