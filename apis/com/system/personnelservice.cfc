<cfcomponent displayname="personnelservice">
	<cffunction name="init" access="public" output="false" returntype="personnelsservice" hint="I create an initialized personnel service object.">
		<cfreturn this >
	</cffunction>		
	<cffunction name="getpersonnelgroups" access="public" returntype="query" output="false" hint="I get the personnel groups.">		
		<cfset var personnelgroups = "" />
			<cfquery datasource="#application.dsn#" name="personnelgroups">
				select distinct(personneltype) as ptype,
				       count(personnelid) as totalingroup
				  from personnel
				 where personneltype <> <cfqueryparam value="admin" cfsqltype="cf_sql_varchar" />
				   and active = <cfqueryparam value="1" cfsqltype="cf_sql_bit" />
			  group by personneltype
			  order by personneltype desc
			</cfquery>
		<cfreturn personnelgroups>
	</cffunction>
	<cffunction name="getpersonnel" access="public" returntype="query" output="false" hint="I get the list of personnel.">			
		<cfargument name="status" type="boolean" required="no" default="1">
		<cfargument name="groupid" type="any" required="yes" default="Sales">
		<cfset var personnellist = "" />
			<cfquery datasource="#application.dsn#" name="personnellist">
				select *
				  from personnel
				 where active = <cfqueryparam value="#arguments.status#" cfsqltype="cf_sql_bit" />
				   and personneltype = <cfqueryparam value="#arguments.groupid#" cfsqltype="cf_sql_varchar" />
				   and personnelid NOT IN(<cfqueryparam value="60108,61323,64358,99133,87286" cfsqltype="cf_sql_integer" list="yes" />)				   
			  order by personnelID asc
			</cfquery>
		<cfreturn personnellist>
	</cffunction>
	<cffunction name="getpersonneldetail" access="public" returntype="query" output="false" hint="I get the personnel detail.">			
		<cfargument name="pid" type="numeric" required="yes" default="#url.pid#">
		<cfset var personneldetail = "" />
			<cfquery datasource="#application.dsn#" name="personneldetail">
				select p.*, u.password
				  from personnel p, users u
				 where p.personnelID = u.id
				   and p.personnelID = <cfqueryparam value="#arguments.pid#" cfsqltype="cf_sql_integer" />			  
			</cfquery>
		<cfreturn personneldetail>
	</cffunction>
</cfcomponent>