











				<div class="container-fluid">
					<div class="row-fluid">			
						<div class="container">
							<div class="row">									
								<div class="col-md-12">
										<cfoutput>
											<div class="col-md-4">
												<div class="well" style="padding:15px;">
													<i class="fa fa-user" style="margin-right:5px;"></i> <strong>#session.selectedclientname# (#session.selectedclientid#)</strong>&nbsp;&nbsp; 
													<cfif trim( session.status ) eq "active">
														<span class="label label-success">ACTIVE</span>
													<cfelseif trim( session.status ) eq "completed">
														<span class="label label-default">COMPLETED</span>
													<cfelseif trim( session.status ) eq "inactive">
														<span class="label label-danger">INACTIVE</span>
													<cfelse>
														<span class="label label-info">PROSPECT</span>
													</cfif>																								
													<br />
													#session.address#<br />
													
													<i class="fa fa-lock" style="margin-right:5px;"></i> SSN: XXX-XX-#right( session.ssn, 4 )#<br />
													<i class="fa fa-check" style="margin-right:5px;"></i> Client Type: #session.clientType# <br />
													<i class="fa fa-calendar"style="margin-right:5px;" ></i> #dateformat( session.enrollmentDate, "mm/dd/yyyy" )#
												</div>
											</div>
											
											<div class="col-md-4">
												<div class="well" style="padding:15px;">
													<cfif trim( session.phone ) neq "">
														<i class="fa fa-phone" style="margin-right:5px;"></i>  #trim( session.phone )#  <cfif trim( session.preferredcontact ) neq ""><span style="float:right;" class="label label-info">#trim( ucase( session.preferredcontact ))#</span>
													</cfif><br />
													</cfif>
													<cfif trim( session.cellphone ) neq "">
														<i class="fa fa-mobile" style="margin-right:5px;"></i>  #trim( session.cellphone )#<br />
													</cfif>
													<cfif trim( session.email ) neq "">
														<i class="fa fa-envelope" style="margin-right:5px;"></i>  #trim( session.email )#<br />
													</cfif>		
													<cfif session.leadSource neq "">
														<i class="fa fa-bookmark" style="margin-right:5px;"></i>  #trim( session.leadsource )#<br />
													</cfif>
													
													<!--- // program flags --->
													<cfif trim( session.flaggedNote ) neq "">
														<span class="label label-warning">IMPORTANT NOTES</span>
													</cfif>
													
													<cfif session.payDayLoan EQ 1>
														<span class="label label-primary">PAY DAY CLIENT</span>
													</cfif>
													
													<cfif trim( session.recordedCall ) EQ "YES">
														<span class="label label-info">WELCOME CALL</span><br />
													<cfelse>
														<span class="label label-default">NO WELCOME CALL</span><br />
													</cfif>
													
													<cfif trim( session.achHoldStat ) eq "YES">
														<span class="label label-danger">ACH HOLD</span>													
													</cfif>
													
													<cfif trim( session.DVD ) eq "YES">
														<span class="label label-default">DVD</span>
													</cfif>
													
													
													
												</div>
											</div>
											
											
											<div class="col-md-4">
												<div class="well" style="padding:15px;">
												<a href="#application.root#close" style="float:right;"><i class="fa fa-close fa-2x"></i></a>
												
													
													
													<!---
													<cfif clientPOA.powerOfAttorneyReceived neq "">
														<span class="label label-success">POA RECEIVED</span>
													<cfelse>
														<span class="label label-default">NO CLIENT POA</span>
													</cfif>
													--->
													
													<cfinvoke component="apis.com.clients.clienttotals" method="getclientbalance" returnvariable="clienttotalbalance">
														<cfinvokeargument name="clientID" value="#session.selectedclientid#">
													</cfinvoke>
													
																	
													
													<p><cfif session.CO eq 4>
														<img src="img/us_flag.jpg">
													<cfelseif session.CO eq 17>
														<img src="img/can_flag.jpg">
													<cfelse>
														<span class="label label-danger">Unknown Office</span>
													</cfif>
													&nbsp;<small>ESCROW BALANCE</small></p>
													<p style="font-size:58px;font-weight:bold;margin-top:-24px;">#dollarformat( clienttotalbalance )#</p>
													
													
													
													
												</div>
											</div>
										</cfoutput>
									</div>
								</div>					
							</div>
						</div>						
					</div>
				</div>