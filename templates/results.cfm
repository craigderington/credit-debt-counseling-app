


	
					
					
					<cfif not structkeyexists( form, "search" )>				
						<cflocation url="#application.root#index" addtoken="no">
					<cfelseif structkeyexists( form, "search" ) and trim( form.search ) eq "">				
						<cflocation url="#application.root#index" addtoken="no">
					<cfelse>					
						
						
						
						<cfif structkeyexists( form, "search" ) and form.search is not "">
							
							
							
							<cfparam name="searchvar" default="">												
							<cfinvoke component="apis.com.clients.clientservice" method="getclientlist" returnvariable="clientlist">
								<cfinvokeargument name="search" value="#trim( form.search )#">
							</cfinvoke>
							
					
					
							<div class="main">
								<div class="container">
									<div class="row">						
										<div class="col-md-12">						
											<div class="widget stacked ">								
												<div class="widget-header">
													<i class="fa fa-list-alt"></i>
													<h3>Your Search Results</h3>
												</div> <!-- /widget-header -->								
												
													<div class="widget-content">							
										  
										  
																	<cfif clientlist.recordcount gt 0 >
																	  
																		<div class="table-responsive">
																			<table class="table table-bordered table-hover table-striped">
																				<thead>
																					<tr>
																						<th width="5%" class="td-actions">Select</th>
																						<th width="25%">Client Name</th>
																						<th width="20%">Phone</th>
																						<th width="25%">Email</th>
																						<th width="25%">Status</th>
																					</tr>
																				</thead>
																				<tbody>																		
																				  <cfoutput query="clientlist" maxrows="25">
																					<tr>
																						<td><div align="center"><a href="#application.root#getclient&fuseaction=getClientDetails&clientID=#clientID#"><i class="fa fa-check-square"></i></a></div></td>
																						<td><span style="font-weight: bold"><a href="#application.root#getclient&fuseaction=getClientDetails&clientID=#clientID#">#clientfirstname# #clientlastname# - (#clientID#)</a> </span></td>
																						<td><cfif trim( phone ) is not ""><i class="icon-phone"></i> #phone#<cfelse><font color="##999999">Phone number not saved</font></cfif></td>
																						<td><cfif trim( email ) is not ""><i class="icon-envelope-alt"></i> #email#<cfelse><font color="##999999">Email not entered</font></cfif></td>
																						<td><cfif trim( clientstatus ) is "Active"><font color="##009900"><strong>#clientstatus#</strong></font><cfelseif trim( clientstatus ) is "Inactive"><font color="##FF0000"><strong>#clientstatus#</strong></font><cfelseif trim( clientstatus ) is "Completed"><font color="##0000FF"><strong>#clientstatus#</strong></font><cfelseif trim( clientstatus ) is "Prospect"><font color="##999999"><strong>#clientstatus#</strong></font><cfelse>Status Unknown</cfif></td>
																					</tr>
																				  </cfoutput>
																			</table>
																		</div>
																	
																	<cfelse>
																		
																		<!--- // search was empty --->
																		<div class="alert alert-danger alert-dismissable">
																		  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
																			<h3 style="font-size:14px;"><i style="font-weight:bold;margin-right:4px;" class="fa fa-warning"></i>NO RECORDS FOUND!</h3>
																			<p>Sorry, no records matched your search criteria.  Please try again...</p>
																		</div>					
																																		
																					  
																	 </cfif>																	
															
										

																						
													
													</div><!-- / .widget-content -->
											</div><!-- / .widget -->
										</div><!-- / .span12 -->
									</div>
									<div style="margin-top:194px;"></div>
								</div>
							</div>
						
						</cfif>
					</cfif>