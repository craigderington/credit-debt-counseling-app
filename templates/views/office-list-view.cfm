





						<!--- partial view // spa // manage officelist --->
						<cfinvoke component="apis.com.offices.officeservice" method="getoffices" returnvariable="officelist">		
						
						
						

							
							
							<!--- // show system messages --->
							<cfif structkeyexists( url, "msg" ) and trim( url.msg ) is "saved">								
								<div class="alert alert-block alert-success">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<h5><i style="font-weight:bold;" class="fa fa-check-square"></i> SYSTEM MESSAGE</h5>
									<p>The lead source record was successfully saved...</p>
								</div>							
							<cfelseif structkeyexists( url, "msg" ) and trim( url.msg ) is "added">
								<div class="alert alert-block alert-info">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<h5><i style="font-weight:bold;" class="fa fa-user-plus"></i> SYSTEM MESSAGE</h5>
									<p>A new lead source has been added.  Please enter the lead source name and click Save!</p>
								</div>
							<cfelseif structkeyexists( url, "msg" ) and trim( url.msg ) is "deleted">							
								<!--- // show the message that the delete transaction completed successfully --->
								<div class="alert alert-block alert-info">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
										<h5><i style="font-weight:bold;" class="fa fa-check-square"></i> SYSTEM MESSAGE</h5>
										<p>The client lead source record was successfully deleted from the system.</p>
								</div>														
							</cfif>
							
							
							
							
							
							
							
							
							
							
							
							

					
							<cfoutput>						
							
									<h4 style="margin-top:-7px;"><i class="fa fa-list-alt"></i> <strong>Manage Offices</strong> <cfif isdefined( "officelist" ) and officelist.recordcount gt 0><span style="margin-left:10px;padding:7px;" class="label label-danger"> #officelist.recordcount# </span></cfif></h4>
								
									<cfif officelist.recordcount eq 0>							
										<div class="alert alert-block alert-error">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<h5><i style="font-weight:bold;" class="icon-check"></i> No Offices Found!</h5>
											<p>Click the button below to begin...</p>
											<p>&nbsp;</p>
											<p><a href="#application.root##url.event#&fuseaction=addoffice&officeid=0" class="btn btn-default btn-xs"><i class="fa fa-building"></i> Add Office</a></p>
										</div>							
									<cfelse>											
										<a href="#application.root##url.event#&fuseaction=editoffice&officeid=0" class="btn btn-default btn-xs" style="margin-bottom:10px;"><i class="fa fa-building"></i> Add Office</a>
											<table class="table tablesorter table-striped table-highlight">
												<thead>
													<tr>														
														<th>Edit Office</th>														
														<th class="action">Delete</th>
													</tr>
												</thead>
												<tbody>
													<cfloop query="officelist">														
														<tr>
															<form name="edit-officelist-inline" class="form-inline" action="" method="post">
																<td>
																	<div class="form-group">																		
																		<div class="col-sm-3">
																			<label class="sr-only" for="officename">Office</label>
																			<input type="text" name="officename" class="form-control" value="#trim( office )#" <cfif trim( office ) is "">placeholder="Enter Office Name"</cfif> />																									
																			<input name="lsid" type="hidden" value="#officeid#" />																
																			<input type="hidden" name="__authToken" value="#randout#" />																			
																		</div>
																		<div class="col-sm-3">
																			<button type="submit" class="btn btn-sm btn-primary" name="saveoffice"><i class="fa fa-save"></i> Save</button>
																		</div>
																	</div>
																</td>
																<td class="actions">
																	
																	<!--- // delete record action 
																	<a href="#application.root##url.event#&fuseaction=deletesource&lsid=#referralsourceid#" class="btn btn-xs btn-danger" onclick="return confirm('Are you sure you want to delete the selected leadsource?');">
																												
																	</a>
																	--->
																	<i class="btn-icon-only fa fa-trash"></i>	
																</td>
															</form>
														</tr>														
													</cfloop>
												</tbody>
											</table>		
									</cfif>								
								</cfoutput>