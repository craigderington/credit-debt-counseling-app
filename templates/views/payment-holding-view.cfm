





						<!--- partial view // spa // manage paymentholding --->
						<cfinvoke component="apis.com.admin.paymentholding" method="getpaymenttypes" returnvariable="paymentholding">			
						
	
	
	
						<cfif structkeyexists( form, "savepaymenttype" )>
							<cfif structkeyexists( form, "paymenttypeid" ) and isvalid( "integer", form.paymenttypeid )>
								<cfif structkeyexists( form, "paymenttype" ) and trim( form.paymenttype ) neq "">							
									<cfif structkeyexists( form, "daystohold" ) and isvalid( "integer", form.daystohold )>
										<cfset paytype = trim( form.paymenttype ) />
										<cfset daystohold = numberformat( form.daystohold, "9" ) />
										<cfset payid = form.paymenttypeid />
											<cfquery datasource="#application.dsn#" name="paymentholding">					
												update paymentholding
												   set paymenttype = <cfqueryparam value="#paytype#" cfsqltype="cf_sql_varchar" />,
													   daystohold = <cfqueryparam value="#daystohold#" cfsqltype="cf_sql_numeric" />
												 where paymenttypeid = <cfqueryparam value="#payid#" cfsqltype="cf_sql_integer" />											 
											</cfquery>											
											<cflocation url="#application.root##url.event#&msg=saved" addtoken="yes">
									<cfelse>
										<div class="alert alert-block alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<h5><i style="font-weight:bold;" class="fa fa-check-square"></i> SYSTEM MESSAGE</h5>
											<p>The payment type Days to Hold must be a valid integer...</p>
										</div>
									</cfif>							
								<cfelse>
									<div class="alert alert-block alert-danger">
										<button type="button" class="close" data-dismiss="alert">&times;</button>
										<h5><i style="font-weight:bold;" class="fa fa-check-square"></i> SYSTEM MESSAGE</h5>
										<p>The payment type can not be blank...</p>
									</div>
								</cfif>
							<cfelse>
								<div class="alert alert-block alert-danger">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<h5><i style="font-weight:bold;" class="fa fa-check-square"></i> SYSTEM MESSAGE</h5>
									<p>The payment type ID is malformed.  The record can not be updated...</p>
								</div>
							</cfif>						
						</cfif>
	
	
	
						<cfif structkeyexists( url, "msg" ) and trim( url.msg ) eq "saved">
							<div class="alert alert-success alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
								<i class="fa fa-check-square"></i> <strong>Success!</strong> The payment type and days to hold were successfully updated...
							</div>				
						</cfif>
	
	
	
	
	
	
	
	
	
	
	
	
	
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							

					
							<cfoutput>						
							
									
									
									
									<h4 style="margin-top:-7px;"><i class="fa fa-bank"></i> <strong>Manage Payment Holding</strong> <cfif isdefined( "paymentholding" ) and paymentholding.recordcount gt 0><span style="margin-left:10px;padding-left:10px;padding-right:10px;" class="label label-danger"> #paymentholding.recordcount# </span></cfif><span class="pull-right"><a href="#application.root#admin" class="btn btn-sm btn-default"><i class="fa fa-home"></i> Admin Home</a></span></h4>
								
									<cfif paymentholding.recordcount eq 0>							
										<div class="alert alert-block alert-danger">
											<button type="button" class="close" data-dismiss="alert">&times;</button>
											<h5><i style="font-weight:bold;" class="fa fa-warning"></i> No Payment Types Found!</h5>
											<p>Click the button below to begin...</p>
											<p>&nbsp;</p>
										</div>							
									<cfelse>											
										<table class="table tablesorter table-striped table-highlight">
												<thead>
													<tr>														
														<th width="20%">Edit Payment Type</th>
														<th>&nbsp;Days to Hold</th>
														<th class="action">Delete</th>
													</tr>
												</thead>
												<tbody>
													<cfloop query="paymentholding">														
														<tr>
															<form name="edit-paymentholding-inline" class="form-inline" action="" method="post">
																<td>
																	<div class="form-group">											
																		<label class="sr-only" for="paymenttype">Payment Type</label>
																		<input type="text" name="paymenttype" class="form-control" value="#trim( paymenttype )#" <cfif trim( paymenttype ) is "">placeholder="Enter Payment Type Name"</cfif> />																									
																	</div>
																</td>
																<td>
																	<div class="form-group">
																		<div class="col-sm-2">
																			<label class="sr-only" for="daystohold">Days to Hold</label>
																			<input type="text" name="daystohold" class="form-control" value="#daystohold#" />
																		</div>
																		<button type="submit" class="btn btn-sm btn-primary" name="savepaymenttype"><i class="fa fa-save"></i> Save</button>
																	</div>
																</td>
																<td class="actions">
																	<div class="form-group">
																		<div class="col-sm-3">
																			<!--- // delete record action 
																			<a href="#application.root##url.event#&fuseaction=deletesource&lsid=#referralsourceid#" class="btn btn-xs btn-danger" onclick="return confirm('Are you sure you want to delete the selected leadsource?');">
																			</a>--->
																			<i class="btn-icon-only fa fa-trash"></i>																
																			<input name="paymenttypeid" type="hidden" value="#paymenttypeid#" />																		
																		</div>
																	</div>
																</td>
															</form>
														</tr>														
													</cfloop>
												</tbody>
										</table>		
									</cfif>								
								</cfoutput>