<cfcomponent displayname="counselorservice">
	<cffunction name="init" access="public" output="false" returntype="counselorservice" hint="I create an initialized counselor service object.">
		<cfreturn this >
	</cffunction>		
	<cffunction name="getcounselorlist" access="public" returntype="query" output="false" hint="I get the list of counselors.">			
		<cfargument name="officeid" type="numeric" required="yes" default="#session.officeID#">		
		<cfset var counselorlist = "" />
			<cfquery datasource="#application.dsn#" NAME="counselorlist">				
				select *
				  from personnel, offices
				 where personnel.officeid = offices.officeid
				   and personnel.personneltype = <cfqueryparam value="sales" cfsqltype="cf_sql_varchar" />
				   and personnel.active = <cfqueryparam value="1" cfsqltype="cf_sql_bit" />
				   and personnel.officeID = <cfqueryparam value="#arguments.officeID#" cfsqltype="cf_sql_integer" />
			  order by personnelid asc		
			</cfquery>	
		<cfreturn counselorlist>
	</cffunction>
</cfcomponent>