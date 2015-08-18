





						<!--- partial view // spa // manage leadsources --->
						<cfinvoke component="apis.com.leadsources.leadsourceservice" method="getleadsources" returnvariable="leadsources">
							<cfif not structkeyexists( url, "filter" )>
								<cfinvokeargument name="officeID" value="#session.officeID#">
							</cfif>
						</cfinvoke>				
						
						
						<!--- // process the forms and query string action --->
						<cfif structkeyexists( url, "fuseaction" ) and url.fuseaction is "editsource">			
							<cfif structkeyexists( url, "lsid" ) and isvalid( "integer", url.lsid ) >					
								<cfset ls = structnew() />
								<cfparam name="lsid" default="#url.lsid#">					
								<cfparam name="officeID" default="4">
								
								<cfif structkeyexists( url, "officeID" )>
									<cfset officeID = 17 />
								<cfelse>
									<cfset officeID = 4 />
								</cfif>
									
								<cfif lsid eq 0>						
									<cfquery datasource="#application.dsn#" name="addsource">
											insert into referralsources(referralsource, officeID)
												values(
														<cfqueryparam value=" " cfsqltype="cf_sql_varchar" />,
														<cfqueryparam value="#officeID#" cfsqltype="cf_sql_integer" />																		
													   );						
									</cfquery>							
										
										<cfif officeID eq 4>
											<cflocation url="#application.root##url.event#&msg=added" addtoken="yes">
										<cfelse>
											<cflocation url="#application.root##url.event#&filter=true&msg=added" addtoken="yes">
										</cfif>
								<cfelse>
										<cflocation url="#application.root##url.event#&msg=error&errorid=3" addtoken="yes">
								</cfif>								
							</cfif>	
						<cfelseif structkeyexists( form, "savesource" ) and structkeyexists( form, "lsid" )>						
							<cfset ls.leadsource = trim( form.leadsourcename ) />										
							<cfset ls.lsid = form.lsid />							
									
								<cfif structkeyexists( form, "officeID" )>
									<cfset officeID = 17 />
								<cfelse>
									<cfset officeID = 4 />
								</cfif>
								
								
								<cfif ls.leadsource eq "">
									<cfset ls.leadsource = "Undefined" />
								</cfif>							
											
								<cfquery datasource="#application.dsn#" name="editleadsource">
									update referralsources
									   set referralsource = <cfqueryparam value="#ls.leadsource#" cfsqltype="cf_sql_varchar" />								   								
									 where referralsourceid = <cfqueryparam value="#ls.lsid#" cfsqltype="cf_sql_integer" />
								</cfquery>							
							
							
							<cfif officeID eq 4>
								<cflocation url="#application.root##url.event#&msg=saved" addtoken="yes">															
							<cfelse>
								<cflocation url="#application.root##url.event#&filter=true&msg=saved" addtoken="yes">
							</cfif>
						
						</cfif>
						
						<!--- // delete client outcome --->
						<cfif structkeyexists( url, "fuseaction" ) and trim( url.fuseaction ) is "deletesource">
							<cfparam name="lsid" default="">
							
								<cfif structkeyexists( url, "lsid" ) and isvalid( "integer", url.lsid )>
									<cfset lsid = url.lsid />									
										<cfquery datasource="#application.dsn#" name="getleadsource">
											select count(clientid) as totalclients
											from personaldata
											where referralsource = <cfqueryparam value="#lsid#" cfsqltype="cf_sql_integer" />												   
										</cfquery>
													
										<cfif getleadsource.totalclients eq 0>																							
											<cfquery datasource="#application.dsn#" name="killleadsource">
												delete 
												  from referralsources
												 where referralsourceid = <cfqueryparam value="#lsid#" cfsqltype="cf_sql_integer" />												
											</cfquery>														
											<!--- // redirect and display message --->
											<cflocation url="#application.root##url.event#&msg=deleted" addtoken="no">													
										<cfelse>													
											<cflocation url="#application.root##url.event#&msg=error&errorid=1" addtoken="no">												
										</cfif>
								</cfif>						
						</cfif>

















							
							
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
							<cfelseif structkeyexists( url, "msg" ) and trim( url.msg ) is "error">								
									<cfif structkeyexists( url, "errorid" ) and url.errorid eq 1>
									<!--- // show the validation error that the lead source is in use and can not be deleted --->
										<div class="alert alert-block alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
												<h5><i style="font-weight:bold;" class="fa fa-warning"></i> SYSTEM MESSAGE</h5>
												<p>Sorry, the lead source can not be deleted.  It is currently in use by active clients.</p>
										</div>
									<cfelseif structkeyexists( url, "errorid" ) and url.errorid eq 2>
									<!--- // show the validation error that the lead source is in use and can not be deleted --->
										<div class="alert alert-block alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
												<h5><i style="font-weight:bold;" class="fa fa-warning"></i> SYSTEM MESSAGE</h5>
												<p>Sorry, the lead source can not be deleted.  There was a problem retrieving the correct record from the database.</p>
										</div>
									<cfelse>
										<div class="alert alert-block alert-danger">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
											<h5><i style="font-weight:bold;" class="fa fa-warning"></i> SYSTEM MESSAGE</h5>
											<p>An unknown error has occured...</p>
										</div>
									</cfif>
														
							</cfif>
							
							
							
							
							
							
							
							
							
							
							
							

					
							<cfoutput>						
							
									<h4 style="margin-top:-7px;"><i class="fa fa-list-alt"></i> <strong>Manage Leadsources</strong> <cfif isdefined( "leadsources" ) and leadsources.recordcount gt 0><span style="margin-left:10px;padding:7px;" class="label label-danger"> #leadsources.recordcount# </span></cfif><span class="pull-right"><i class="fa fa-search"></i> Filter Location: <cfif not structkeyexists( url, "filter" )><a href="#application.root##url.event#&filter=true" class="label label-danger">CANADA</a><cfelse><a href="#application.root##url.event#" class="label label-primary">USA</a></cfif></span></h4>
								
									<cfif leadsources.recordcount eq 0>							
										<div class="alert alert-block alert-error">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<h5><i style="font-weight:bold;" class="icon-check"></i> No Leadsources Found!</h5>
											<p>Click the button below to begin...</p>
											<p>&nbsp;</p>
											<p><a href="#application.root##url.event#&fuseaction=editsource&lsid=0" class="btn btn-default btn-xs"><i class="fa fa-user-plus"></i> Add Leadsource</a></p>
										</div>							
									<cfelse>											
										<a href="#application.root##url.event#&fuseaction=editsource&lsid=0<cfif structkeyexists( url, "filter" )>&officeID=17</cfif>" class="btn btn-default btn-xs" style="margin-bottom:10px;"><i class="fa fa-user-plus"></i> Add Leadsource</a>
											<table class="table tablesorter table-striped table-highlight">
												<thead>
													<tr>														
														<th>Edit Leadsource</th>														
														<th class="action">Delete</th>
													</tr>
												</thead>
												<tbody>
													<cfloop query="leadsources">														
														<tr>
															<form name="edit-leadsources-inline" class="form-inline" action="" method="post">
																<td>
																	<div class="form-group">																		
																		<div class="col-sm-3">
																			<label class="sr-only" for="leadsourcename">Leadsource</label>
																			<input type="text" name="leadsourcename" class="form-control" value="#trim( referralsource )#" <cfif trim( referralsource ) is "">placeholder="Enter Leadsource Name"</cfif> />																									
																			<input name="lsid" type="hidden" value="#referralsourceid#" />																
																			<input type="hidden" name="__authToken" value="#randout#" />
																			<cfif structkeyexists( url, "filter" )>
																				<input type="hidden" name="officeID" value="17" />
																			</cfif>
																		</div>
																		<div class="col-sm-3">
																			<button type="submit" class="btn btn-sm btn-primary" name="savesource"><i class="fa fa-save"></i> Save</button>
																		</div>
																	</div>
																</td>
																<td class="actions">
																	
																	<!--- // delete record action --->
																	<a href="#application.root##url.event#&fuseaction=deletesource&lsid=#referralsourceid#" class="btn btn-xs btn-danger" onclick="return confirm('Are you sure you want to delete the selected leadsource?');">
																		<i class="btn-icon-only fa fa-trash"></i>											
																	</a>
																	
																	
																</td>
															</form>
														</tr>														
													</cfloop>
												</tbody>
											</table>		
									</cfif>								
								</cfoutput>