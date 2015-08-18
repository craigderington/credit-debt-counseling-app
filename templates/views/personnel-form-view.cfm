



			<cfinvoke component="apis.com.system.personnelservice" method="getpersonneldetail" returnvariable="personneldetail">
				<cfinvokeargument name="pid" value="#url.pid#">
			</cfinvoke>
			
			<cfinvoke component="apis.com.offices.officeservice" method="getoffices" returnvariable="officelist">
			
			
			<!--- // process personnel form --->
			<cfif structkeyexists( form, "savepersonnel" )>

				<cfset person = structnew() />
				<cfset person.pID = form.personID />
				<cfset person.ptype = trim( form.ptype ) />
				<cfset person.fname = trim( form.personnelfirstname ) />
				<cfset person.lname = trim( form.personnellastname ) />
				<cfset person.title = trim( form.title ) />
				<cfset person.phone = trim( form.phone ) />
				<cfset person.email = trim( form.email ) />
				<cfset person.officeID = form.officeID />
				<cfset person.password = trim( form.password ) />
				
				
				
				<cfif not structisempty( person )>
					
						<!--- // create an array to hold our errors, if any... --->
						<cfset arrperson = arraynew(1) />					
					
						<cfif person.fname eq "">
							<cfset arrayappend( arrperson, "The personnel first name can not be blank.  Please check your input and try again." ) />
						<cfelseif person.lname eq "">
							<cfset arrayappend( arrperson, "The personnel last name can not be blank.  Please check your input and try again." ) />
						<cfelseif person.ptype eq "">
							<cfset arrayappend( arrperson, "Please select a personnel type.  Please check your input and try again." ) />
						<cfelseif person.phone eq "">
							<cfset arrayappend( arrperson, "The phone number can not be blank.  Please check your input and try again." ) />
						<cfelseif person.title eq "">
							<cfset arrayappend( arrperson, "The personnel position can not be blank.  Please check your input and try again." ) />
						<cfelseif person.email eq "">
							<cfset arrayappend( arrperson, "The email address can not be blank.  Please check your input and try again." ) />
						<cfelseif person.officeID eq "">
							<cfset arrayappend( arrperson, "The selected office is invalid.  Please check your input and try again." ) />
						<cfelseif person.phone eq "">
							<cfset arrayappend( arrperson, "The phone number can not be blank.  Please check your input and try again." ) />
						<cfelseif person.pid eq "">
							<cfset arrayappend( arrperson, "Opps, there is a problem with the form structure. Please cancel and return to the Admin Menu." ) />
						</cfif>
				
						<!--- // check for any input errors --->
						<cfif arraylen( arrperson ) neq 0>
				
							<cfloop array="#arrperson#" index="j">
								<cfoutput>
									<div class="alert alert-danger alert-dismissable">
										<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
										<strong><i class="fa fa-warning"></i> INPUT ERROR</strong> #j#
									</div>
								</cfoutput>
							</cfloop>
						
						
						<cfelse>
						
						
							<cfif person.pid eq 0>
							
								{{ insert new personnel }}
							
							<cfelse>						
							
								<!--- // the struct is ok, and our pid is not zero, proceed to save the record --->
								<cfquery datasource="#application.dsn#" name="savepersonnel">
									update  personnel
									   set  personnelfirstname = <cfqueryparam value="#person.fname#" cfsqltype="cf_sql_varchar" />, 
											personnellastname = <cfqueryparam value="#person.lname#" cfsqltype="cf_sql_varchar" />,
											personneltype = <cfqueryparam value="#person.ptype#" cfsqltype="cf_sql_varchar" />,
											officeid = <cfqueryparam value="#person.officeID#" cfsqltype="cf_sql_integer" />, 
											phone = <cfqueryparam value="#person.phone#" cfsqltype="cf_sql_varchar" />, 
											email = <cfqueryparam value="#person.email#" cfsqltype="cf_sql_varchar" />, 
											positiontitle = <cfqueryparam value="#person.title#" cfsqltype="cf_sql_varchar" />
											
											<cfif isdefined( "form.active" )> 
												, active = <cfqueryparam value="1" cfsqltype="cf_sql_bit" />
											<cfelse>
												, active = <cfqueryparam value="0" cfsqltype="cf_sql_bit" />
											</cfif>
											<cfif isdefined( "form.alert" )> 
												, alertuser = <cfqueryparam value="1" cfsqltype="cf_sql_bit" />
											<cfelse> 
												, alertuser = <cfqueryparam value="0" cfsqltype="cf_sql_bit" />
											</cfif>
											
									 where  personnelid = <cfqueryparam value="#person.pID#" cfsqltype="cf_sql_integer" />
								</cfquery>
				
								<!---
								<cfif person.password neq "">
									<cfquery datasource="#application.dsn#" name="saveuserinfo">
										update users
										   set password = <cfqueryparam value="#person.password#" cfsqltype="cf_sql_varchar" />
										 where id = <cfqueryparam value="#person.pID#" cfsqltype="cf_sql_integer" />
									</cfquery>
								</cfif>
				
								
								<cfquery datasource="#application.dsn#" name="saveevent">
								   insert into systemeventlog(systemlogeventtype, systemlogeventstamp, systemlogeventuser, systemlogeventtext, clientid)
									  values(
											 'manage personnel', 
											 #createodbcdatetime(now())#, 
											 '#session.username#', 
											 'the user updated the personnel information for #form.personnelid#.', 
											 0);
								</cfquery>
								--->
								
								<cflocation url="#application.root##url.event#&msg=saved" addtoken="no">
							
							</cfif>
				
						</cfif>				
				
				<cfelse>
				
					<div class="alert alert-danger alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						<p><strong><i class="fa fa-warning"></i> SERIOUS SYSTEM ERROR. NAVIGATE ANYWAY FROM THIS PAGE...</strong></p>
					</div>	
				
				</cfif>
			</cfif>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
				<cfoutput query="personneldetail">		
					
					<h5 style="color:##990000"><i class="fa fa-user"></i> <strong>Edit Personnel #personnelfirstname# #personnellastname#</strong></h5>
					<br />
					
					<form action="" role="form" class="form-horizontal col-md-12" method="post">
						<fieldset>
							
							<div class="form-group">
								<label for="ptype" class="col-lg-4">User Group</label>
								<div class="col-lg-5">
									<select name="ptype" class="form-control col-lg-2">
										<option value="Administration"<cfif trim( personneltype ) eq "Administration">selected</cfif>>Administration</option>
										<option value="Accounting"<cfif trim( personneltype ) eq "Accounting">selected</cfif>>Accounting</option>
										<option value="Manager"<cfif trim( personneltype ) eq "Manager">selected</cfif>>Manager</option>
										<option value="Sales"<cfif trim( personneltype ) eq "Sales">selected</cfif>>Sales</option>
										<cfif isuserinrole( "efiscal" )>
										<option value="admin"<cfif trim( personneltype ) eq "admin">selected</cfif>>eFiscal Admin</option>
										</cfif>
									</select>
								</div>
							</div>					
							
							<div class="form-group">
								<label for="personnelfirstname" class="col-lg-4">First Name</label>
								<div class="col-lg-5">
									<input type="text" class="form-control" name="personnelfirstname" id="personnelfirstname" value="<cfif isdefined( "form.personnelfirstname" )>#trim( form.personnelfirstname )#<cfelse>#trim( personnelfirstname )#</cfif>" maxlength="50" />
								</div>
							</div>

							<div class="form-group">
								<label for="personnellastname" class="col-lg-4">Last Name</label>
								<div class="col-lg-5">
									<input type="text" class="form-control" name="personnellastname" id="personnellastname" value="<cfif isdefined( "form.personnelfirstname" )>#trim( form.personnellastname )#<cfelse>#trim( personnellastname )#</cfif>" maxlength="50" />
								</div>
							</div>

							<div class="form-group">
								<label for="title" class="col-lg-4">Position/Title</label>
								<div class="col-lg-5">
									<input type="text" class="form-control col-lg-4" name="title" id="title" value="<cfif isdefined( "form.title" )>#trim( form.title )#<cfelse>#trim( positiontitle )#</cfif>" maxlength="50" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="password" class="col-lg-4">Password</label>
								<div class="col-lg-5">
									<input type="password" class="form-control" name="password" id="password" />
								</div>
							</div>
									
							<div class="form-group">
								<label for="officeID" class="col-lg-4">Office</label>
								<div class="col-lg-5">
									<select name="officeID" class="form-control col-lg-2">
										<cfloop query="officelist" startrow="1">
											<option value="#officeid#"<cfif personneldetail.officeid eq officelist.officeid>selected</cfif>>#office#</option>
										</cfloop>										
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label for="phone" class="col-lg-4">Telephone</label>
								<div class="col-lg-5">
									<input type="text" class="form-control" name="phone" id="phone" value="#trim( phone )#" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="email" class="col-lg-4">Email</label>
								<div class="col-lg-5">
									<input type="text" class="form-control" name="email" id="email" value="#trim( email )#" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-4">Personnel Active?</label>
								<div class="col-lg-5">
									<div class="checkbox">
										<label>
											<input type="checkbox" name="active" value="1" <cfif active eq 1>checked</cfif> />												 
										</label>
									</div>									
								</div>
							</div> <!-- /.form-group -->
							
							<div class="form-group">
								<label class="col-lg-4">Alert User?</label>
								<div class="col-lg-5">
									<div class="checkbox">
										<label>
											<input type="checkbox" name="alert" value="1" <cfif alertuser eq 1>checked</cfif> />
											Select this option to have user notified of ACH exceptions. 
										</label>
									</div>									
								</div>
							</div> <!-- /.form-group -->

							

							<br />
								  
							<div class="form-group">
								<div class="col-lg-4"></div>
								<div class="col-lg-5">
									  <input type="hidden" name="personID" value="#personnelID#">
									  <button type="submit" name="savepersonnel" class="btn btn-md btn-danger"><i class="fa fa-save"></i> Save #personneldetail.personnelfirstname# #personneldetail.personnellastname#</button>
									  <a href="#application.root##url.event#" class="btn btn-md btn-default"><i class="fa fa-remove"></i> Cancel</a>
								</div>
							</div>
						</fieldset>
					</form>
	
				</cfoutput>
				

				
				
				
				
				
				
													
																						
														
							
							
		
							