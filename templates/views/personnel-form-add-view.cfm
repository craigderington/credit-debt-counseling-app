



			<cfinvoke component="apis.com.offices.officeservice" method="getoffices" returnvariable="officelist">
			
			
			<!--- // process personnel form --->
			<cfif structkeyexists( form, "savepersonnel" )>

				<cfset person = structnew() />				
				<cfset person.ptype = trim( form.ptype ) />
				<cfset person.fname = trim( form.personnelfirstname ) />
				<cfset person.lname = trim( form.personnellastname ) />
				<cfset person.title = trim( form.title ) />
				<cfset person.phone = trim( form.phone ) />
				<cfset person.email = trim( form.email ) />
				<cfset person.officeID = form.officeID />
				<cfset person.password = trim( form.password ) />
				<cfset person.password2 = trim( form.password2 ) />
				
				<cfif isdefined( "form.active" )> 
					<cfset person.active = 1 />
				<cfelse>
					<cfset person.active = 0 />
				</cfif>
								
				<cfif isdefined( "form.alert" )> 
					<cfset person.alertuser = 1 />
				<cfelse>
					<cfset person.alertuser = 0 />
				</cfif>
				
				<!--- determine the numeric value for the
				      user type field dbo.users table 
					  bad original design - change to new --->
				<cfswitch expression="#person.ptype#">
					<cfcase value="Administration">
						<cfset person.usertype = 5 />
					</cfcase>					
					<cfcase value="Accounting">
						<cfset person.usertype = 4 />
					</cfcase>
					<cfcase value="Manager">
						<cfset person.usertype = 3 />
					</cfcase>
					<cfcase value="Sales">
						<cfset person.usertype = 2 />
					</cfcase>
					<cfcase value="admin">
						<cfset person.usertype = 6 />
					</cfcase>
					<cfdefaultcase>
						<cfset person.usertype = 1 />
					</cfdefaultcase>
				</cfswitch>
				
				
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
						<cfelseif person.password eq "">
							<cfset arrayappend( arrperson, "The password is required when adding a new user." ) />
						<cfelseif person.password2 eq "">
							<cfset arrayappend( arrperson, "Please confirm the password..." ) />
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
						
						<cfelseif person.password neq person.password2>
						
							<div class="alert alert-danger alert-dismissable">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
								<strong><i class="fa fa-warning"></i> Sorry, your passwords do not match.  Please try again...</strong>
							</div>						
						
						<cfelse>							
								
								<!--- // add the user table first --->
								<cfquery datasource="#application.dsn#" name="saveuserinfo">
										insert into users(firstname, lastname, password, usertype)
											values (
													<cfqueryparam value="#person.fname#" cfsqltype="cf_sql_varchar" />, 
													<cfqueryparam value="#person.lname#" cfsqltype="cf_sql_varchar" />,
													<cfqueryparam value="#person.password#" cfsqltype="cf_sql_varchar" />, 
													<cfqueryparam value="#person.usertype#" cfsqltype="cf_sql_varchar" />													
													);
								</cfquery>

								<!--- // get the ID for the user we just inserted --->
								<cfquery datasource="#application.dsn#" name="getid">
									select max (id) as id
									  from users
								     where firstname = <cfqueryparam value="#person.fname#" cfsqltype="cf_sql_varchar" />
									   and lastname = <cfqueryparam value="#person.lname#" cfsqltype="cf_sql_varchar" />
								</cfquery>
							
								<cfif getid.recordcount eq 1>
								
									<!--- // the struct is ok, proceed to save the record --->
									<cfquery datasource="#application.dsn#" name="savepersonnel">
										insert into personnel(personnelid, personnelfirstname, personnellastname, personneltype, officeid, phone, email, positiontitle, active, alertUser )
											  values(
													<cfqueryparam value="#getid.id#" cfsqltype="cf_sql_varchar" />,
													<cfqueryparam value="#person.fname#" cfsqltype="cf_sql_varchar" />, 
													<cfqueryparam value="#person.lname#" cfsqltype="cf_sql_varchar" />,
													<cfqueryparam value="#person.ptype#" cfsqltype="cf_sql_varchar" />,
													<cfqueryparam value="#person.officeID#" cfsqltype="cf_sql_integer" />, 
													<cfqueryparam value="#person.phone#" cfsqltype="cf_sql_varchar" />, 
													<cfqueryparam value="#person.email#" cfsqltype="cf_sql_varchar" />, 
													<cfqueryparam value="#person.title#" cfsqltype="cf_sql_varchar" />,
													<cfqueryparam value="#person.active#" cfsqltype="cf_sql_bit" />,
													<cfqueryparam value="#person.alertuser#" cfsqltype="cf_sql_bit" />
													);
									</cfquery>						
								
								<cfelse>
									
									<div class="alert alert-danger alert-dismissable">
										<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
										<strong><i class="fa fa-warning"></i> Sorry, the user was added, but there was a problem with the personnel record.  Please contact the system administrator.</strong>
									</div>								
								
								</cfif>
								<!---
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
								
								<cflocation url="#application.root##url.event#&msg=added" addtoken="no">
							
							
				
						</cfif>				
				
				<cfelse>
				
					<div class="alert alert-danger alert-dismissable">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						<p><strong><i class="fa fa-warning"></i> SERIOUS SYSTEM ERROR. NAVIGATE ANYWAY FROM THIS PAGE...</strong></p>
					</div>	
				
				</cfif>
			</cfif>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
				<cfoutput>		
					
					<h5 style="color:##990000"><i class="fa fa-user"></i> <strong>Add New Personnel</strong></h5>
					<br />
					
					<form action="" role="form" class="form-horizontal col-md-12" method="post">
						<fieldset>
							
							<div class="form-group">
								<label for="ptype" class="col-lg-4">User Group</label>
								<div class="col-lg-5">
									<select name="ptype" class="form-control col-lg-2">
										<option value="Administration">Administration</option>
										<option value="Accounting">Accounting</option>
										<option value="Manager">Manager</option>
										<option value="Sales">Sales</option>
										<cfif isuserinrole( "efiscal" )>
										<option value="admin">eFiscal Admin</option>
										</cfif>
									</select>
								</div>
							</div>					
							
							<div class="form-group">
								<label for="personnelfirstname" class="col-lg-4">First Name</label>
								<div class="col-lg-5">
									<input type="text" class="form-control" name="personnelfirstname" id="personnelfirstname" value="<cfif isdefined( "form.personnelfirstname" )>#trim( form.personnelfirstname )#</cfif>" maxlength="50" />
								</div>
							</div>

							<div class="form-group">
								<label for="personnellastname" class="col-lg-4">Last Name</label>
								<div class="col-lg-5">
									<input type="text" class="form-control" name="personnellastname" id="personnellastname" value="<cfif isdefined( "form.personnelfirstname" )>#trim( form.personnellastname )#</cfif>" maxlength="50" />
								</div>
							</div>

							<div class="form-group">
								<label for="title" class="col-lg-4">Position/Title</label>
								<div class="col-lg-5">
									<input type="text" class="form-control col-lg-4" name="title" id="title" value="<cfif isdefined( "form.title" )>#trim( form.title )#</cfif>" maxlength="50" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="password" class="col-lg-4">Password</label>
								<div class="col-lg-5">
									<input type="password" class="form-control" name="password" id="password" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="password" class="col-lg-4">Confirm Password</label>
								<div class="col-lg-5">
									<input type="password" class="form-control" name="password2" id="password2" />
								</div>
							</div>
									
							<div class="form-group">
								<label for="officeID" class="col-lg-4">Office</label>
								<div class="col-lg-5">
									<select name="officeID" class="form-control col-lg-2">
										<cfloop query="officelist" startrow="1">
											<option value="#officeid#">#office#</option>
										</cfloop>										
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label for="phone" class="col-lg-4">Telephone</label>
								<div class="col-lg-5">
									<input type="text" class="form-control" name="phone" id="phone" value="<cfif isdefined( "form.phone" )>#trim( form.phone )#</cfif>" />
								</div>
							</div>
							
							<div class="form-group">
								<label for="email" class="col-lg-4">Email</label>
								<div class="col-lg-5">
									<input type="text" class="form-control" name="email" id="email" value="<cfif isdefined( "form.email" )>#trim( form.email )#</cfif>" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-lg-4">Personnel Active?</label>
								<div class="col-lg-5">
									<div class="checkbox">
										<label>
											<input type="checkbox" name="active" value="1" />												 
										</label>
									</div>									
								</div>
							</div> <!-- /.form-group -->
							
							<div class="form-group">
								<label class="col-lg-4">Alert User?</label>
								<div class="col-lg-5">
									<div class="checkbox">
										<label>
											<input type="checkbox" name="alert" value="1" />
											Select this option to have user notified of ACH exceptions. 
										</label>
									</div>									
								</div>
							</div> <!-- /.form-group -->

							

							<br />
								  
							<div class="form-group">
								<div class="col-lg-4"></div>
								<div class="col-lg-5">									
									  <button type="submit" name="savepersonnel" class="btn btn-md btn-danger"><i class="fa fa-save"></i> Save New User</button>
									  <a href="#application.root##url.event#" class="btn btn-md btn-default"><i class="fa fa-remove"></i> Cancel</a>
								</div>
							</div>
						</fieldset>
					</form>
	
				</cfoutput>
				

				
				
				
				
				
				
													
																						
														
							
							
		
							