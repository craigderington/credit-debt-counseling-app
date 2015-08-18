
		
		
		<!--- close the client record and destroy session vars --->
		<cfif structkeyexists( session, "selectedclientid" )>				
			<cfparam name="tempX" default="">					
			<cfset tempX = structdelete( session, "selectedclientid" )>					
			<cflocation url="#application.root#leads" addtoken="no">			
		</cfif>
		
		<!--- include our data access components --->
		<cfinvoke component="apis.com.leads.leadservice" method="getleadlist" returnvariable="leadlist">	
			<cfinvokeargument name="officeID" value="#session.officeID#">
			<cfinvokeargument name="userID" value="#session.userID#">
		</cfinvoke>
		<cfinvoke component="apis.com.leadsources.leadsourceservice" method="getleadsources" returnvariable="leadsources">	
			<cfinvokeargument name="officeID" value="#session.officeID#">
		</cfinvoke>
		
		<cfinvoke component="apis.com.counselors.counselorservice" method="getcounselorlist" returnvariable="counselorlist">			
		
		<!--- // redirect if lead list is empty --->
		<cfif not structkeyexists( form, "filtermyresults" ) and leadlist.recordcount eq 0>
			<cflocation url="#application.root#newlead" addtoken="no">
		</cfif>
		
		
		<!--- // additonal stylesheet for large support buttons --->
		<link href="./js/plugins/faq/faq.css" rel="stylesheet">		

			
						
						
							
							
							
							
							
										
										
										<!--- // data grid  filter	--->							
										<cfoutput>
											<div class="well">
												<p><i class="fa fa-check"></i> Filter Your Results</p>
												<form class="form-inline" name="filterresults" method="post">																				
													<div class="form-group form-group-sm">														
														<label class="sr-only" for="leadsource">LeadSources</label>													
															<select name="leadsource" style="margin-left:5px;" class="form-control col-lg-1" onchange="javascript:this.form.submit();">
																<option value="">Filter Lead Source</option>
																	<cfloop query="leadsources">
																		<option value="#referralsourceid#"<cfif isdefined( "form.leadsource" ) and form.leadsource eq leadsources.referralsourceid>selected</cfif>>#referralsource#</option>
																	</cfloop>												
														</select>														
													</div>
													<div class="form-group form-group-sm">
														<cfif isuserinrole( "execmanager" ) or isuserinrole( "efiscal") or isuserinrole( "accounting" ) or isuserinrole( "manager" )>
																
															<label class="sr-only" for="counselors">Counselors</label>															
																<select name="counselors" style="margin-left:5px;" class="form-control col-lg-1" onchange="javascript:this.form.submit();">
																	<option value="">Filter Counselors</option>
																		<cfloop query="counselorlist">
																			<option value="#personnelid#"<cfif isdefined( "form.counselors" ) and form.counselors eq counselorlist.personnelid>selected</cfif>>#personnelfirstname# #personnellastname#</option>
																		</cfloop>												
																</select>															
																
														</cfif>
													</div>
													
													<div class="form-group form-group-sm">
														<input type="text" name="filterbyname" style="margin-left:5px;" class="form-control" placeholder="Filter By Name" id="filterbyname" value="<cfif isdefined( "form.filterbyname" )>#trim( form.filterbyname )#</cfif>" onchange="javascript:this.form.submit();" />
													</div>

													<div class="form-group form-group-sm">													
														<input type="text" name="startleaddate" style="margin-left:5px;" class="form-control" placeholder="From Date Entered" id="datepicker-inline" value="<cfif isdefined( "form.startleaddate" )>#dateformat( form.startleaddate, 'mm/dd/yyyy' )#</cfif>">
													</div>
													
													<div class="form-group form-group-sm">
														<input type="text" name="endleaddate" style="margin-left:5px;" class="form-control" placeholder="To Date Entered" id="datepicker-inline1" value="<cfif isdefined( "form.endleaddate" )>#dateformat( form.endleaddate, 'mm/dd/yyyy' )#</cfif>">
													</div>													
													<input type="hidden" name="filtermyresults">
													<button type="submit" style="margin-left:5px;margin-top:5px;" name="filterresults" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> Filter Results</button>
													<cfif structkeyexists( form, "filtermyresults" )><button type="reset" onclick="location.href='#application.root##url.event#'" style="margin-left:3px;margin-top:5px;" class="btn btn-sm btn-default"><i class="fa fa-check-square"></i> Reset List</button></cfif>
													
												</form>
											</div>
										</cfoutput>
										<!--- // end filter --->			
									
										<cfif leadlist.recordcount gt 0>


												<!--- activity log pagination --->
												<cfparam name="startrow" default="1">
												<cfparam name="displayrows" default="10">
												<cfparam name="torow" default="0">												
												
												<cfset torow = startrow + ( displayrows - 1 ) />
												<cfif torow gt leadlist.recordcount>
													<cfset torow = leadlist.recordcount />
												</cfif>												
												
												<cfset next = startrow + displayrows>
												<cfset prev = startrow - displayrows>

												
												<cfoutput>
													<h5 style="font-weight:700;"><i style="margin-right:5px;" class="fa fa-th-large"></i> Total Prospects: #leadlist.recordcount# | Displaying #startrow# to #torow#      <span class="pull-right"><cfif prev gte 1><a style="margin-right:5px;margin-bottom:5px;" href="#application.root##url.event#&startrow=#prev#" class="btn btn-sm btn-danger"><i class="fa fa-arrow-circle-left"></i> Previous #displayrows# Records</a></cfif><cfif next lte leadlist.recordcount><a style="margin-bottom:5px;margin-left:5px;" class="btn btn-sm btn-default" href="#application.root##url.event#&startrow=#next#">Next <cfif ( leadlist.recordcount - next ) lt displayrows>#evaluate(( leadlist.recordcount - next ) + 1 )#<cfelse>#displayrows#</cfif> Records <i class="fa fa-arrow-circle-right"></i></a></cfif>  <a href="#application.root#newlead" style="margin-left:5px;margin-bottom:5px;" class="btn btn-sm btn-danger"><i class="fa fa-user-plus"></i> Create New Inquiry</a></span></h5>
												</cfoutput>
											
												
												<!--- // show data grid --->
												<table id="tablesorter" class="table table-bordered table-striped table-highlight tablesorter">
													<thead>
														<tr>
															<th style="text-align:center;" width="5%">Actions</th>
															<th>Inquiry Source</th>
															<th>Name/ID</th>
															<th>Contact</th>
															<th>Email</th>									
															<th>State</th>
															<th>Date Entered</th>
															
														</tr>
													</thead>
													<tbody>
														<cfoutput query="leadlist" startrow="#startrow#" maxrows="#displayrows#">
															
															<!--- use the correct phone number --->
															<cfparam name="myphone" default="">
															
															<cfif leadlist.workphone neq "">
																<cfset myphone = replace( leadlist.workphone, "-", "", "all" ) />
															<cfelseif leadlist.phone neq "">
																<cfset myphone = replace( leadlist.phone, "-", "", "all" ) />
															<cfelseif leadlist.cellphone neq "">
																<cfset myphone = replace( leadlist.cellphone, "-", "", "all" ) />
															<cfelse>
																<cfset myphone = "555111222" />
															</cfif>
															
															
															<!-- // invoke component to cleanse phone number --->
															<cfinvoke component="apis.udfs.cleanphonenumber" method="formatphonenumber" returnvariable="phonenumber">
																<cfinvokeargument name="phonenumber" value="#myphone#">
															</cfinvoke>

															
																<tr>
																	<td>
																		<div align="center">
																			<a href="#application.root#getclient&fuseaction=getClientDetails&clientid=#clientid#" class="btn btn-xs btn-danger">
																				<i class="btn-icon-only fa fa-check-circle-o"></i>										
																			</a>
																		</div>
																	</td>
																	<td>#referralsource#</td>													
																	<td>#clientfirstname# #clientlastname#  (#clientid#)</td>
																	<td><span class="label label-primary">#phonenumber#</span></td>														
																	<td>#email#</td>
																	<td>#stateabbreviation#</td>
																	<td>#dateformat( dateentered, "mm/yy/yyyy" )#</td>
																</tr>
														</cfoutput>												
													</tbody>
												</table>
												<br />
												<p class="tip">
													<span class="label label-danger">TIP!</span> &nbsp; Click the column headers to sort the data.  You can sort multiple columns simultaneously by holding down the shift key and clicking a second, third or even fourth column header!
												</p>
											<cfelse>
											
												
												<div class="alert alert-block alert-danger">
													<h5><i class="fa fa-warning"></i> <strong>Sorry, the query can not find any prospects matching the report input filter...</h5>													
													<p>&nbsp;</p>
													<cfoutput>
													<p><a href="#application.root##url.event#" class="btn btn-sm btn-default"><i class="fa fa-retweet"></i> Reset Filter</a></p>
													</cfoutput>											
												</div>
											
											</cfif>
								
									
								
								
								
								
							
						
											
											<cfif leadlist.recordcount lt 10>
												<div style="margin-top:250px;"></div>
											<cfelse>
												<div style="margin-top:100px;"></div>
											</cfif>
			