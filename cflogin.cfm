<!--- // perform login function --->
			<cflogin>
				<cfif NOT IsDefined("cflogin")>
					<cfinclude template="login.cfm">
					<cfabort>
				<cfelse>
					<cfif cflogin.name IS "" OR cflogin.password IS "">
						<cfset REQUEST.badlogin = true />
						<cfinclude template="login.cfm">
						<cfabort>
					<cfelse>
						<!--- // ok, we have a valid login attempt, try login query --->
						<cfquery datasource="#application.dsn#" NAME="getUsers">
							SELECT users.id, users.password, users.userType, users.firstName, users.lastName
							  FROM users
							 WHERE users.id = <cfqueryparam value="#cflogin.name#" cfsqltype="cf_sql_integer" />
							   AND users.password = <cfqueryparam value="#trim( cflogin.password )#" cfsqltype="cf_sql_integer" />
						</cfquery>						
						
						<cfif getUsers.recordcount eq 1>							
								
							<cfif getUsers.usertype neq 1>
									
									<cfquery datasource="#application.dsn#" NAME="getOffice">
									   SELECT * 
									     FROM personnel
									    WHERE personnelID = <cfqueryparam value="#getUsers.id#" cfsqltype="cf_sql_integer" />
									      AND active = <cfqueryparam value="1" cfsqltype="cf_sql_bit" />
								    </CFQUERY>					
									
									
									<cfloginuser 
										name = "#cflogin.name#" 
										password = "#cflogin.password#" 
										roles="efiscal">

											<!-- start necessary session variables --->
											<cfset SESSION.goodLogin = TRUE />
											<cfset SESSION.userID = getUsers.id / >
											<cfset SESSION.ipAddress = #REMOTE_ADDR# />							
											<cfif getOffice.recordcount gt 0>
												<cfset SESSION.officeID = getOffice.officeID />
											<cfelse>
												<cfset SESSION.officeID = 4 />
											</cfif>
											<cfset SESSION.userName = "#getUsers.firstName# #getUsers.lastName#" />						
									
											<!--- Log this users activity to the database ---> 
											<cfquery datasource="#application.dsn#" name="logUser">
												update users
												   set lastlogin = <cfqueryparam value="#CreateODBCDateTime(Now())#" cfsqltype="cf_sql_timestamp" />,
													   lastloginip = <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar" />
												 where id = <cfqueryparam value="#getusers.userid#" cfsqltype="cf_sql_integer" />									   
											</cfquery>
							
							<cfelse>
									<!--- client role --->
									<cfset SESSION.goodLogin = TRUE />
									<cfset SESSION.userID = getUsers.ID />
									<cfset SESSION.ipAddress = #CGI.REMOTE_ADDR#>								
									<cfset SESSION.userName = "#getUsers.firstName# #getUsers.lastName#">
									
									<!--- Log this users activity to the database ---> 
									<cfquery datasource="#application.dsn#" name="logUser">
										update users
										   set lastlogin = <cfqueryparam value="#CreateODBCDateTime(Now())#" cfsqltype="cf_sql_timestamp" />,
											   lastloginip = <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar" />
										 where id = <cfqueryparam value="#getusers.userid#" cfsqltype="cf_sql_integer" />									   
									</cfquery>											
									<!---<cflocation url="clientEscrowStatement.cfm" addtoken="yes">--->									
							</cfif>
						<cfelse>
							<cfset REQUEST.badlogin = true />    
							<cfinclude template="login.cfm">
							<cfabort>
						</cfif>
					</cfif>    
				</cfif>
			</cflogin>			