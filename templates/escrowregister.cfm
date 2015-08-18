


				<cfparam name="clientID" default="">
				<cfset clientid = 97503 />



				<cfquery datasource="efiscal_progressive" name="thisregister">  
					SELECT p.paymentReceived as myDateRegister, p.paymentAmount as pamount, p.payProgram as programdescription, p.nsfDate as returnDate, p.nsfReason as myreason, p.paymentPaid as paymentcleared
					  FROM payments p
					 WHERE clientid = <cfqueryparam value="#clientID#" cfsqltype="cf_sql_integer" />
					   AND p.paymentReceived IS NOT NULL
					   AND paymentPaid IS NOT NULL
					UNION ALL
					  SELECT d.paymentMadeDate as myDateRegister, d.paymentAmount as pamount, c.creditorName as programdescription, d.paymentDueDate as returnDate, d.paymentType as myreason, d.paymentMadeDate as paymentcleared
						FROM disbursements d, creditors c
					   WHERE d.creditorID = c.creditorID
						 AND d.clientID = <cfqueryparam value="#clientID#" cfsqltype="cf_sql_integer" />
						 AND d.paymentMadeDate IS NOT NULL
						 AND d.creditorID <> <cfqueryparam value="-2" cfsqltype="cf_sql_integer" />
						 AND d.creditorID <> <cfqueryparam value="-5" cfsqltype="cf_sql_integer" />
					UNION ALL
					  SELECT f.feePaidDate as myDateRegister, f.feepaid as pamount, f.feePurpose as programdescription, f.feeDueDate as returnDate, f.feePurpose as myreason, f.feePaidDate as paymentcleared
						FROM fees f
					   WHERE f.clientID = <cfqueryparam value="#clientID#" cfsqltype="cf_sql_integer" />
						 AND feePaidDate IS NOT NULL					
					  
					  
					ORDER BY myDateRegister ASC
				</cfquery>



					
				

				<!--- page vars --->
				<cfparam name="myRunningTotal" default="0.00">
				<cfparam name="trustBalance" default="0.00">

				
				
					
					

					<cfif thisregister.recordcount gt 0> 
												
							
								
								
									<cfoutput query="thisregister">
										
										<cfif trim( programdescription ) eq "ds">
											<cfset myRunningTotal = myRunningTotal - pamount />																	
										<cfelse>
											<cfset myRunningTotal = myRunningTotal + pamount />
										</cfif>
												
										
												
													<cfif trim( programdescription ) eq "ds" and trim( returndate ) eq "">											
													
															#dateformat( myDateRegister, "mm/dd/yyyy" )#
															
													<cfelse>
													
															#dateformat( paymentcleared, "mm/dd/yyyy" )#
														
													</cfif>
												
													<cfif trim( programdescription ) eq "ds" and trim( returndate ) eq "">
														
															Deposit payment received from client. 
																<cfif paymentcleared is not "">
																	Cleared on #dateformat( paymentcleared, "mm/dd/yyyy" )#
																<cfelse>
																	Payment pending
																</cfif>
														
													<cfelseif trim( programdescription ) eq "ds" and returndate neq "">
														
															Client payment returned nsf on #dateformat( returndate, "mm/dd/yyyy" )# for #myreason#
														
													<cfelse>
														<cfif trim( programdescription ) contains "monthly fee" or trim( programdescription ) contains "escrow fee">
															
																Payment to #programdescription#
															
														<cfelseif trim( programdescription ) neq "ds" and trim( returndate ) neq "" and isdate( myreason )>
															
																Payment to #programdescription# - payment returned and voided
															
														<cfelse>
															
																Payment to #programdescription#
															
														</cfif>
													</cfif>
												
												
													<cfif trim( programdescription ) neq "ds">
														#dollarformat(pamount)#
													</cfif>
												
													<cfif trim( programdescription ) eq "ds" and trim( returndate ) eq "">
														
															#dollarformat( pamount )#
														
													<cfelseif trim( programdescription ) eq "ds" and trim( returndate ) neq "">
														
															#dollarformat(pamount)#
														
													</cfif>
													
													
												
															RUNNING BALANCE:  
															<!--- calc running escrow totals --->
															<cfif thisregister.currentrow eq 1>
																#pamount#
															<cfelse>																	
																#dollarformat( myRunningTotal )#
															</cfif>
												
											
									</cfoutput>
								
							
						
						
						
						
						
						
						
						
					
					<cfelse>		
				
				
							<div class="alert alert-warning alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
									<i class="fa fa-warning"></i> <strong>NO RECORDS FOUND!</strong>
							</div>
		
		
		
					</cfif>
					
					
					
					
					<br />
					<br />
					<br />
					
					<cfdump var="#thisregister#" label="thisregister">
					
					
					
					
					
					
				

						