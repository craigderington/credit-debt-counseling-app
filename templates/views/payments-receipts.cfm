







					<cfinvoke component="apis.com.clients.clienttotals" method="getclientpayments" returnvariable="paymentList2">
						<cfinvokeargument name="clientID" value="#session.selectedclientid#">
					</cfinvoke>
					
					<cfinvoke component="apis.com.clients.clienttotals" method="checkclientpayments" returnvariable="checkpaid">
						<cfinvokeargument name="clientID" value="#session.selectedclientid#">
					</cfinvoke>
					
					<cfinvoke component="apis.com.clients.clientservice" method="checkclientsettings" returnvariable="checkclient">
						<cfinvokeargument name="clientID" value="#session.selectedclientid#">
					</cfinvoke>				
					
					<!--- // page params --->
					<cfparam name="feetotal" default="0.00">
					<cfparam name="trusttotal" default="0.00">
					<cfparam name="overalltotal" default="0.00">
					<cfparam name="modifiedtotal" default="0.00">
					<cfparam name="nsftotal" default="0.00">							
			
			
			
			
			
							
							
							
							
							
							
			
			
			
			
			
			
			
			
			
							<!--- // create receipt schedule headers for client ach hold/ban or acct freeze --->
							<cfif trim( checkclient.achhold ) is "yes">
							
								<cfoutput>									
									<div class="alert alert-danger alert-dismissable">
										<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
										<i class="fa fa-warning"></i> <strong><small>ACH HOLD</small></strong> | Date: #dateformat( checkclient.achholddate, "mm/dd/yyyy" )# | Reason: #checkclient.achholdreason#
									</div>								 
								</cfoutput>
							</cfif>
							
							<cfif trim( checkclient.freezeacct ) is "yes">
							
								<cfoutput>
									<div class="alert alert-info alert-dismissable">
										<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
										<i class="fa fa-alert"></i> <strong><small>ACCOUNT FROZEN</small></strong>  Date: #dateformat( checkclient.freezedate, "mm/dd/yyyy" )# 
									</div>									 
								</cfoutput>
							</cfif>
							
							<cfif checkclient.achban eq 1>
							
								<cfoutput>
									<div class="alert alert-warning alert-dismissable">
										<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
										<i class="fa fa-exclamation-triangle"></i> <strong></small>PERMANENT ACH HOLD</small></strong>
										<p>Date: #dateformat( checkclient.achbandate, "mm/dd/yyyy" )# | Reason: #checkclient.achbanreason#   <span class="pull-right"><cfif isuserinrole( "efiscal" )><div align="center">[ <a href="payments-receipts.cfm?fuseaction=removeachban" onclick="return confirm('This action will remove the permanent ach hold.  Do you wish to continue?');">remove ban</a> ]</div></cfif></span></p>
									
									</div>
									</cfoutput>				
							
							</cfif>						
							
							
									<div class="table-responsive">
										<table class="table table-hover table-striped">
											<thead>
												<tr>
													<td>Date</td>
													<td>Purpose</td>
													<td>Type</td>
													<td>Payment Amount</td>
													<td>Payment Pending</td>
													<td>Payment Available</td>
													<td>NSF Date</td>
													<td>NSF Reason</td>
													<td>Note</td>
													<td>Delete</td>												
												</tr>
											</thead>
											<tbody>
												<cfoutput query="paymentlist2">													
													<tr <cfif trim( paymenttype ) is "ach" and paymentamount gt 2000.00>class="error"</cfif>>
															
															<td>
																<cfif updatedduedate is not "">
																	#dateformat( updatedduedate, "mm/dd/yyyy" )#
																<cfelse>
																	#dateformat( paymentduedate, "mm/dd/yyyy" )#
																</cfif>
																<cfif paymentreceived is "" and paymentpaid is "" and nsfdate is "">[<a href="##" onclick="openwindow('datepaymentadjust.cfm?clientid=#session.selectedclientid#&paymentid=#paymentid#&<cfif updatedduedate is not "">date=#dateformat(paymentduedate, 'mm-dd-yyyy')#<cfelse>date=#dateformat(now(), 'mm-dd-yyyy')#</cfif>&headertext=new due date&fieldname=paymentduedate&tablename=payments&datemodified=#dateformat(now(), 'mm-dd-yyyy')#','','scrollbars=yes,width=500,height=150')">adjust</a>]</cfif>
															</td>
														
															<cfif paymentreceived is "">
																<form action="" method="post">
																	<td>
																		<select name="updatepaymentpurpose" onchange="javascript:this.form.submit();">
																			<option value=""<cfif paymentpurpose is ""> selected</cfif>></option>
																			<option value="setup fee"<cfif paymentpurpose is "setup fee">selected</cfif>>setup fee</option>
																			<option value="enrollment"<cfif paymentpurpose is "enrollment"> selected</cfif>>enrollment</option>
																			<option value="monthly"<cfif paymentpurpose is "monthly"> selected</cfif>>monthly</option>
																			<option value="extra funds"<cfif paymentpurpose is "extra funds"> selected</cfif>>extra funds</option>
																			<option value="pdr-client-loan"<cfif paymentpurpose is "pdr-client-loan">selected</cfif>>pdr client loan</option>																													
																		</select>
																		<input type="hidden" name="paymentid" value="#paymentid#">
																	</td>
																</form>
															<cfelse>
																<td>#paymentpurpose#</td>
															</cfif>
														
															<cfif paymentreceived is "">
																<form action="payments-receipts.cfm" method="post">
																<td>
																	<select name="updatepaymenttype" onchange="javascript:this.form.submit();">
																		<option value=""<cfif paymenttype is ""> selected</cfif>></option>
																		<option value="ach"<cfif paymenttype is "ach"> selected</cfif>>ach</option>
																		<option value="money order"<cfif paymenttype is "money order"> selected</cfif>>money order</option>
																		<option value="web pay"<cfif paymenttype is "web pay"> selected</cfif>>web pay</option>
																		<option value="check"<cfif paymenttype is "check"> selected</cfif>>check</option>
																		<option value="transfer"<cfif paymenttype is "transfer"> selected</cfif> disabled>transfer</option>
																		<option value="rmo"<cfif paymenttype is "rmo"> selected</cfif>>rmo</option>
																	</select>
																	<input type="hidden" name="paymentid" value="#paymentid#">
																</td>
																</form>
															<cfelse>
																<td>#paymenttype#</td>
															</cfif>
														
															<td height="20">
																<cfif updatedamount is not "">
																	#dollarformat(updatedamount)#
																	<cfset thisamount = numberformat(updatedamount, '.99')>
																<cfelse>
																	#dollarformat(paymentamount)#
																	<cfset thisamount = numberformat(paymentamount, '.99')>
																</cfif>
																<cfif isuserinrole("efiscal")>
																<cfif paymentreceived is "" <!---and nsfdate is ""--->>[<a href="##" onclick="openwindow('fieldadjust3.cfm?clientid=#session.selectedclientid#&paymentid=#paymentid#&value=#numberformat(paymentamount, ".00")#&description=new payment amount&headertext=new payment amount&fieldname=paymentamount&tablename=payments&datemodified=#dateformat(now(), "mm-dd-yyyy")#','','scrollbars=yes,width=500,height=150')">adjust</a>]</cfif>
																</cfif>
																<cfif isuserinrole("execmanager")>
																<cfif paymentreceived is "" and paymentpaid is "" and nsfdate is "">[<a href="##" onclick="openwindow('fieldadjust3.cfm?clientid=#session.selectedclientid#&paymentid=#paymentid#&value=#numberformat(paymentamount, ".00")#&description=new payment amount&headertext=new payment amount&fieldname=paymentamount&tablename=payments&datemodified=#dateformat(now(), "mm-dd-yyyy")#','','scrollbars=yes,width=500,height=150')">adjust</a>]</cfif>
																</cfif>
															</td>
														
														<td>
															<cfif paymentreceived is "">
																<cfif paymentpurpose is "nsf fee">
																	<cfif isuserinrole("efiscal")>[<a href="payments-receipts.cfm?markreceived=yes&nsffee=#numberformat(thisamount, '.99')#&paymentid=#paymentid#">mark received</a>]</cfif>
																<cfelseif paymentpurpose is "admin fee">
																<cfif isuserinrole("efiscal")>[<a href="payments-receipts.cfm?markreceived=yes&adminfee=#numberformat(thisamount, '.99')#&paymentid=#paymentid#">mark received</a>]</cfif>
																<cfelseif nsfdate is not "">nsf - #dateformat(nsfdate, "mm/dd/yyyy")#
																<cfelse>
																	<cfif isuserinrole("efiscal")>[<a href="payments-receipts.cfm?markreceived=yes&paymentid=#paymentid#">mark received</a>]</cfif>
																</cfif>
															<cfelseif paymentreceived is not "">	
																#dateformat(paymentreceived, "mm/dd/yyyy")#
															<cfelse>
																-
															</cfif>
														</td>
														<!--- // cld 02-27-2012 // modify nsf and payment paid column for new nsf & returns procedure --->
														<td>
															<cfif paymentpaid is "" and nsfdate is "">
																<cfif updatedduedate is not "">
																	<cfif isuserinrole("efiscal")>[<a href="payments-receipts.cfm?action=markpaid&paymentid=#paymentid#">mark as paid</a>]</cfif>
																<cfelse>
																	<cfif isuserinrole("efiscal")>[<a href="payments-receipts.cfm?action=markpaid&paymentid=#paymentid#">mark as paid</a>]</cfif>
																</cfif>
															<cfelseif paymentpaid is not "" and nsfdate is "">	
																#dateformat(paymentpaid, "mm/dd/yyyy")#
															<cfelseif paymentpaid is not "" and nsfdate is not "">
																#dateformat(paymentpaid, "mm/dd/yyyy")#
															<cfelse>
																-
															</cfif>
														</td>
														<!--- // cld -02-27-2012 // and always show the nsf date regardless of the payment paid date --->
														<td>
															<cfif nsfdate is "">
																<!---<cfif isuserinrole("efiscal")>[<a href="paymentschedule-new.cfm?marknsf=yes&paymentid=#paymentid#" onclick="return confirmsubmit2();">set date</a>]</cfif>--->
															<cfelseif nsfdate is not "">	
																<span class="label label-danger">#dateformat(nsfdate, "mm/dd/yyyy")#</span>
															<cfelse>
																-
															</cfif>
														</td>

														<form action="payments-receipts.cfm" method="post">
														<td>
															<cfif nsfreason is not "">
																<span class="label label-info">#nsfreason#</span>													
															</cfif>														
														</td>
														</form>

														<td>#paymentnote# <a href="payments-receipts.cfm?action=addnote&paymentid=#paymentid#" class="label label-default">edit</a></td>
														<td><cfif paymentreceived is "" and paymentpaid is "" and isuserinrole("execmanager")><a href="payments-receipts.cfm?deletepayment=yes&paymentid=#paymentid#" onclick="return confirmsubmit2();"><i class="icon-btn-only fa fa-trash"></a><cfelseif paymentpaid is "" and isuserinrole("efiscal")><a href="payments-receipts.cfm?deletepayment=yes&paymentid=#paymentid#" onclick="return confirmsubmit2();"><i class="icon-btn-only fa fa-trash"></a></cfif><cfif isuserinrole("efiscal") and paymentreceived is not "" and paymentpaid is "">&nbsp;<a href="payments-receipts.cfm?resetpayment=yes&paymentid=#paymentid#" onclick="return confirmsubmit3();"><i class="icon-btn-only fa fa-random"></a></cfif></td>
														</tr>
													<cfset overalltotal = overalltotal + paymentamount>
													
													<cfif updatedamount is not "">
														<cfset modifiedtotal = modifiedtotal + updatedamount>
														<cfset trusttotal = trusttotal + updatedamount>
													<cfelse>
														<cfset modifiedtotal = modifiedtotal + paymentamount>
														<cfset trusttotal = trusttotal + paymentamount>
													</cfif>
												
												
												
												</cfoutput>
		
												
												
												
												
												<cfoutput>
													<!---
													<tr align="left" class="color-row">
														<td height="20"></td>
														<td></td>
														<td></td>
														<td>trust total: #dollarformat(trusttotal)#</td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<cfif isuserinrole("efiscal")><td>&nbsp;</td></cfif>
													</tr>
													--->
													<tr class="color-header">
														<td height="20" colspan="2">Total Scheduled: <b>#dollarformat(overalltotal)#</b></td>
														
														<td></td>
														<td><strong>Trust Total</strong>
															<cfif overalltotal neq modifiedtotal>
																<font color="red"><b>#dollarformat(modifiedtotal)#</b></font> <cfif overalltotal lt modifiedtotal>(over by #dollarformat(overalltotal - modifiedtotal - nsftotal)#)<cfelse>(under by #dollarformat(overalltotal - modifiedtotal - nsftotal)#)</cfif>
															<cfelse>
																<font color="green"><b>#dollarformat(modifiedtotal)#</b></font>
															</cfif>
														</td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td><cfif checkpaid.totalpaid gt 0 and paymentlist2.recordcount gt 0 and ( isuserinrole( "efiscal" ) or isuserinrole( "execmanager" ))><a href="refactorpayments.cfm" class="btn btn-xs btn-default"><i class="fa fa-reorder"></i> Refactor Payments</a></cfif></td>
														<td></td>													
													</tr>
												</cfoutput>
											</tbody>
										</table>
									</div>
									
					
					
					
					
					
					
					


					