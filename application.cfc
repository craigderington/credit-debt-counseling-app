<cfcomponent	
	displayname="Application"
	output="true"
	hint="Handle the application.">	
	
	<!--- Setup the application --->
	<cfscript>
       this.name = hash( getcurrenttemplatepath() );
       this.applicationTimeout = createtimespan(1,0,0,0);
       this.clientmanagement = "true";       
       this.sessionmanagement = "true";
       this.sessiontimeout = createtimespan(0,0,59,0);
       this.loginstorage = "session";
	   this.setclientcookies = "false";       
       this.scriptprotect = "all";    
   </cfscript>
	
 
	<!--- Define the page request properties. --->
	<cfsetting
		requesttimeout="120"
		showdebugoutput="true"
		enablecfoutputonly="false"
		/>
 
 
	<cffunction
		name="OnApplicationStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires when the application is first created.">	
		
		 <cfscript>
			//set your app vars for the application          
			application.dsn = "efiscal_progressive";
			application.title = "Progressive Debt Relief v3";
			application.developer = "eFiscal Networks, LLC.";
			application.agencyname = "Progressive Debt Relief";
			application.agencydba = "PDR";
			application.bootver = "v 2.3.1";
			application.softver = "v 1.0.0 Alpha";
			application.root = "index.cfm?event=";
			application.sessions = 0;
		</cfscript>
		
		<cftry>
            <!--- test whether the DB is accessible by selecting some data. --->
            <cfquery name="testdb" datasource="#application.dsn#" maxrows="2">
                select count(id)
                  from users
            </cfquery>
            <!--- If we get a database error, report an error to the user, log the error information, and do not start the application. --->
            <cfcatch type="database">
                <cflog file="#this.name#" type="error" 
                     text="DB not available. message: #cfcatch.message# Detail: #cfcatch.detail# Native Error: #cfcatch.NativeErrorCode#" >
            
                <cfthrow message="This application encountered an error connecting to the database. Please contact support." />      
            
                <cfreturn false>
            </cfcatch>
       </cftry>
       
       <cflog file="#this.name#" type="Information" text="Application #this.name# Started">
 
		<!--- Return out. --->
		<cfreturn true />
	</cffunction>
 
 
	<cffunction
		name="OnSessionStart"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the session is first created.">
			
			
			<!--- Store date the session was created. --->
			<cfset session.dateInitialized = now() />
			
			<!--- set these CFID variables in traditional CF environment in order to 
			      mimic J2EE session expirations when the browser closes 
			<cfcookie name="CFID" value="#session.CFID#">
			<cfcookie name="CFTOKEN" value="#session.CFTOKEN#">--->
			

			
		<!--- Return out. --->
		<cfreturn />
	</cffunction>
 
	
	<cffunction
		name="OnRequestStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires at first part of page processing.">
 
		<!--- Define arguments. --->
		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>
			
			<!--- // if the URL query string contains a reinit param, restart all application vars --->
			<cfif structkeyexists( url, "reinit" ) and url.reinit is "true" >
				<cfset onApplicationStart() />
			</cfif>
			
			<!--- // for direct web service api calls 
			<cfif trim( right( arguments.TargetPage, 4 )) eq ".cfc">
				<cfset structdelete( this, "OnRequestStart" ) />				
				<cfset structdelete( variables, "OnRequestStart" ) />				
			</cfif>		
			--->
			
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
							   AND users.password = <cfqueryparam value="#trim( cflogin.password )#" cfsqltype="cf_sql_varchar" />
						</cfquery>				
						
								
							<cfloginuser 
								name = "#cflogin.name#" 
								password = "#hash( cflogin.password, "sha" )#" 
								roles="efiscal">

											
								<cfset SESSION.goodLogin = TRUE />
								<cfset SESSION.userID = getUsers.id / >
								<cfset SESSION.ipAddress = #REMOTE_ADDR# />							
								<cfset SESSION.officeID = 4 />
								<cfset SESSION.username = "#getUsers.firstName# #getUsers.lastName#" />						
											
								<!---
								<cfquery datasource="#application.dsn#" name="logUser">
									update users
									   set lastlogin = <cfqueryparam value="#CreateODBCDateTime(Now())#" cfsqltype="cf_sql_timestamp" />,
										   lastloginip = <cfqueryparam value="#cgi.remote_addr#" cfsqltype="cf_sql_varchar" />
									 where id = <cfqueryparam value="#getUsers.id#" cfsqltype="cf_sql_integer" />									   
								</cfquery>
								--->
						
					</cfif>    
				</cfif>
			</cflogin>	
			
			<cfif GetAuthUser() EQ "">				
				<!---
					<form action="check-user-login-security.cfm" method="Post">
						<input type="submit" Name="Logout" value="Logout">
					</form>
				--->
				<cflogout>				
				<cfinclude template="login.cfm">								
			</cfif>

			 <!--- include the requested page --->
			 <cfinclude template="#ARGUMENTS.TargetPage#" />
		
		<!--- Return out. --->
		<cfreturn true />
	</cffunction>
	
	
	<cffunction
		name="OnRequest"
		access="public"
		returntype="void"
		output="true"
		hint="Fires after pre page processing is complete.">
 
		<!--- Define arguments. --->
		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>
 
		<!--- Include the requested page. --->
		<cfinclude template="#ARGUMENTS.TargetPage#" />
 
		<!--- Return out. --->
		<cfreturn />
	</cffunction>
	
 
	<cffunction
		name="OnRequestEnd"
		access="public"
		returntype="void"
		output="true"
		hint="Fires after the page processing is complete."> 
		
		<!--- Return out. --->
		<cfreturn />
	</cffunction>
 
 
	<cffunction
		name="OnSessionEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the session is terminated.">
 
		<!--- Define arguments. --->
		<cfargument
			name="sessionScope"
			type="struct"
			required="true"
			/>			
			
		<cfargument
			name="applicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>
			
		<!--- output the cfid and cftoken values to the log. --->
		<cffile
			action="append"
			file="#getDirectoryFromPath( getCurrentTemplatePath() )#log.cfm"
			output="ENDED: #arguments.sessionScope.cfid#<br />"
			/>			
			
				
		<!--- Return out. --->
		<cfreturn />
	</cffunction>	
 
	<cffunction
		name="OnApplicationEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the application is terminated.">
 
		<!--- Define arguments. --->
		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#">	
 
		<!--- Return out. --->
		<cfreturn />
	</cffunction>
 
 
	<cffunction
		name="OnError"
		access="public"
		returntype="void"
		output="true"
		hint="Fires when an exception occures that is not caught by a try/catch.">
 
		<!--- Define arguments. --->
		<cfargument
			name="Exception"
			type="any"
			required="true"			
			/>
 
		<cfargument
			name="EventName"
			type="string"
			required="false"
			default=""
			/>			
			
			<!--- log the error --->
			<cfif cgi.server_name neq "localhost" and cgi.server_name neq "127.0.0.1">
				<!--- // if this is the live production server, handle the error --->
				<cfinclude template="cferror.cfm">
					<cflog file="#this.name#" type="error" text="Event Name: #arguments.eventname#" >
					<cflog file="#this.name#" type="error" text="Message: #arguments.exception.message#">
					<cflog file="#this.name#" type="error" text="Root Cause Message: #arguments.exception.rootcause.message#">			
			<cfelse>
				<cfif len( arguments.eventname )>
					<cfdump var="#arguments.eventname#" label="Error Event Name"/>
				</cfif>
				<cfdump var="#arguments.exception#" label="Error Exception" />			
			</cfif>
			
			
			
		<!--- Return out. --->
		<cfreturn />
	</cffunction> 
</cfcomponent>