






					<cfinvoke component="apis.com.system.settlementsettingsservice" method="getsettlementsettings" returnvariable="settlementsettings">
					
					
					
					<!--- // save the settings --->
					<cfif structkeyexists( form, "updatesettings" )>
						
						<cfset ss = structnew() />
						<cfset ss.startupformula = trim( form.startupformula ) />
						<cfset ss.startupfigure = form.startupfigure />
						<cfset ss.enrollmentformula = trim( form.enrollmentformula ) />
						<cfset ss.enrollmentfigure = form.enrollmentfigure />
						<cfset ss.numberenrollmentpayments = form.numberenrollmentpayments />
						<cfset ss.monthlyformula = trim( form.monthlyformula ) />
						<cfset ss.monthlyfigure = form.monthlyfigure />
						<cfset ss.settlementformula = trim( form.settlementformula ) />
						<cfset ss.settlementfigure = form.settlementfigure />
						<cfset ss.paydayformula = trim( form.paydayformula ) />
						<cfset ss.paydayfigure = form.paydayfigure />
						<cfset ss.escrowfee = form.escrowfee />
						
						
						<cfif not structisempty( ss )>					
							<cfquery datasource="#application.dsn#" name="savesettlementsettings">
								update settlementsettings
								   set startupformula = <cfqueryparam value="#ss.startupformula#" cfsqltype="cf_sql_varchar" />,
									   startupfigure = <cfqueryparam value="#ss.startupfigure#" cfsqltype="cf_sql_float" />, 
									   enrollmentformula = <cfqueryparam value="#ss.enrollmentformula#" cfsqltype="cf_sql_varchar" />, 
									   enrollmentfigure = <cfqueryparam value="#ss.enrollmentfigure#" cfsqltype="cf_sql_float" />,
									   numberenrollmentpayments = <cfqueryparam value="#ss.numberenrollmentpayments#" cfsqltype="cf_sql_numeric" />, 
									   monthlyformula = <cfqueryparam value="#ss.monthlyformula#" cfsqltype="cf_sql_varchar" />, 
									   monthlyfigure = <cfqueryparam value="#ss.monthlyfigure#" cfsqltype="cf_sql_float" />,
									   settlementformula = <cfqueryparam value="#ss.settlementformula#" cfsqltype="cf_sql_varchar" />, 
									   settlementfigure = <cfqueryparam value="#ss.settlementfigure#" cfsqltype="cf_sql_float" />, 
									   paydayformula = <cfqueryparam value="#ss.paydayformula#" cfsqltype="cf_sql_varchar" />,
									   escrowfee = <cfqueryparam value="#ss.escrowfee#" cfsqltype="cf_sql_float" />, 
									   paydayfigure = <cfqueryparam value="#ss.paydayfigure#" cfsqltype="cf_sql_float" />
							</cfquery>						
							<cflocation url="#application.root##url.event#&msg=saved" addtoken="yes">
						<cfelse>
							<div class="alert alert-danger alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
								<i class="fa fa-warning"></i> <strong>SYSTEM MESSAGE!</strong> The settlement settings could not be saved.  There is a problem with the data structure.  Please check your input and try again...
							</div>						
						</cfif>
					</cfif>
					
					
					
					
					
					
					
					
					
					<cfif structkeyexists( url, "msg" ) and trim( url.msg ) eq "saved">
						<div class="alert alert-success alert-dismissable">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
							<i class="fa fa-check-square"></i> <strong>Success!</strong> The system settlement settings were successfully updated...
						</div>					
					</cfif>
					
					
					
					
					
					
					
					
					
							
						    
					
					
					
					
							<cfoutput query="settlementsettings">
								
								<form class="form-horizontal" method="post" action="">
									<fieldset>
									
									<h5 style="margin-top:5px;margin-bottom:5px;"><i class="fa fa-dollar"></i> Start Up Fees</h5>				
										<br />
										<div class="form-group">
											<label for="startupformula" class="col-lg-4 control-label">Startup Formula</label>
											<div class="col-lg-8">
												<select name="startupformula" class="form-control col-lg-2">
													<option value="null"<cfif startupformula is ""> selected</cfif>></option>
													<option value="set amount"<cfif startupformula is "set amount"> selected</cfif>>set amount</option>
													<option value="$ per creditor"<cfif startupformula is "$ per creditor"> selected</cfif>>$ per creditor</option>
													<option value="% of debt"<cfif startupformula is "% of debt"> selected</cfif>>% of debt</option>
													<option value="% of monthly payment"<cfif startupformula is "% of monthly payment"> selected</cfif>>% of monthly payment</option>
												</select>
											</div>									
										</div>						
										
										<div class="form-group">
											<label for="startupfigure" class="col-lg-4 control-label">Startup Figure</label>
												<div class="col-lg-8">											 
													<input type="text" name="startupfigure" class="form-control" value="#numberformat( startupfigure, ".99" )#" />
												</div>
										</div>
									
									<br />
									
									<h5 style="margin-top:5px;margin-bottom:5px;"><i class="fa fa-dollar"></i> Enrollment Fees</h5>	
										<br />
										<div class="form-group">
											<label for="enrollmentformula" class="col-lg-4 control-label">Formula</label>
											<div class="col-lg-8">
												<select name="enrollmentformula" class="form-control col-lg-2">
													<option value="null"<cfif enrollmentformula is ""> selected</cfif>></option>
													<option value="set amount"<cfif enrollmentformula is "set amount"> selected</cfif>>set amount</option>
													<option value="$ per creditor"<cfif enrollmentformula is "$ per creditor"> selected</cfif>>$ per creditor</option>
													<option value="% of debt"<cfif enrollmentformula is "% of debt"> selected</cfif>>% of debt</option>
													<option value="% of monthly payment"<cfif enrollmentformula is "% of monthly payment"> selected</cfif>>% of monthly payment</option>
												</select>
											</div>
										</div>
										
										<div class="form-group">
											<label for="enrollementfigure" class="col-lg-4 control-label">Figure</label>
												<div class="col-lg-8">											 
													<input type="text" name="enrollmentfigure" class="form-control" value="#numberformat( enrollmentfigure, ".99" )#" />
												</div>
										</div>
										
										<div class="form-group">
											<label for="numberenrollmentpayments" class="col-lg-4 control-label">Number of Payments</label>
												<div class="col-lg-8">											 
													<input type="text" name="numberenrollmentpayments" class="form-control" value="#numberenrollmentpayments#" />
												</div>
										</div>
										
										<br />
										
										<h5 style="margin-top:5px;margin-bottom:5px;"><i class="fa fa-dollar"></i> Monthly Fees</h5>
											<br />
											<div class="form-group">
												<label for="monthlyformula" class="col-lg-4 control-label">Formula</label>
												<div class="col-lg-8">
													<select name="monthlyformula" class="form-control col-lg-2">
														<option value="null"<cfif monthlyformula is ""> selected</cfif>></option>
														<option value="set amount"<cfif monthlyformula is "set amount"> selected</cfif>>set amount</option>
														<option value="$ per creditor"<cfif monthlyformula is "$ per creditor"> selected</cfif>>$ per creditor</option>
														<option value="% of debt"<cfif monthlyformula is "% of debt"> selected</cfif>>% of debt</option>
														<option value="% of monthly payment"<cfif monthlyformula is "% of monthly payment"> selected</cfif>>% of monthly payment</option>
													</select>
												</div>
											</div>
											
											<div class="form-group">
												<label for="monthlyfigure" class="col-lg-4 control-label">Figure</label>
													<div class="col-lg-8">											 
														<input type="text" name="monthlyfigure" class="form-control" value="#numberformat( monthlyfigure, ".99" )#" />
													</div>
											</div>			

											<br />
											
											<h5 style="margin-top:5px;margin-bottom:5px;"><i class="fa fa-dollar"></i> Standard Debt Settlement Fees</h5>	
												<br />
												<div class="form-group">
													<label for="settlementformula" class="col-lg-4 control-label">Formula</label>
														<div class="col-lg-8">										
															<select name="settlementformula" class="form-control col-lg-2">
																<option value="null"<cfif settlementformula is ""> selected</cfif>></option>
																<option value="set amount"<cfif settlementformula is "set amount"> selected</cfif>>set amount</option>
																<option value="% of savings"<cfif settlementformula is "% of savings"> selected</cfif>>% of savings</option>
																<option value="% of debt"<cfif settlementformula is "% of debt"> selected</cfif>>% of debt</option>
															</select>
														</div>
												</div>
												
												<div class="form-group">
													<label for="settlementfigure" class="col-lg-4 control-label">Figure</label>
														<div class="col-lg-8">											 
															<input type="text" name="settlementfigure" class="form-control" value="#numberformat( settlementfigure, ".99" )#" />
														</div>
												</div>	
												
												 
												<br />
												
												<h5 style="margin-top:5px;margin-bottom:5px;"><i class="fa fa-dollar"></i> Pay Day Loan Settlement Fees</h5>
													<br />
													<div class="form-group">
														<label for="paydayformula" class="col-lg-4 control-label">Formula</label>
															<div class="col-lg-8">											
																<select name="paydayformula" class="form-control col-lg-2">
																	<option value="null"<cfif paydayformula is ""> selected</cfif>></option>
																	<option value="set amount"<cfif paydayformula is "set amount"> selected</cfif>>set amount</option>
																	<option value="% of savings"<cfif paydayformula is "% of savings"> selected</cfif>>% of savings</option>
																	<option value="% of debt"<cfif paydayformula is "% of debt"> selected</cfif>>% of debt</option>
																</select>
															</div>
													</div>
													
													<div class="form-group">
														<label for="paydayfigure" class="col-lg-4 control-label">Figure</label>
															<div class="col-lg-8">											 
																<input type="text" class="form-control" name="paydayfigure" value="#numberformat( paydayfigure, ".99" )#" />
															</div>
													</div>										
											
												<h5 style="margin-top:5px;margin-bottom:5px;"><i class="fa fa-dollar"></i> Escrow Fees</h5>
													<br />
													<div class="form-group">
														<label for="escrowfee" class="col-lg-4 control-label">Figure</label>
															<div class="col-lg-8">											 
																<input type="text" name="escrowfee" class="form-control" value="#numberformat( escrowfee, ".99" )#" readonly="true">
															</div>
													</div>

										
													
										
										
										
									
										<div class="form-group" style="margin-top:5px;">
											<div class="col-lg-offset-4 col-lg-8">
												<button type="submit" name="updatesettings" class="btn btn-default"><i class="fa fa-save"></i> Save Settings</button>
												<a href="#application.root#admin" class="btn btn-warning"><i class="fa fa-remove"></i> Cancel</a>
											</div>
										</div>
									</fieldset>
								</form>							
							</cfoutput>