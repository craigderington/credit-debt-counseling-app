<cfcomponent displayname="settlementsettingsservice">
	<cffunction name="init" access="public" output="false" returntype="settlementsettingsservice" hint="I create an initialized settlement settings service object.">
		<cfreturn this >
	</cffunction>
		
	<cffunction name="getsettlementsettings" access="public" returntype="query" output="false" hint="I get the system settlement settings.">			
		<cfset var settlementsettings = "" />
			<cfquery datasource="#application.dsn#" name="settlementsettings">
				select *
				  from settlementsettings
			</cfquery>
		<cfreturn settlementsettings>
	</cffunction>
</cfcomponent>