<cfinvoke component="apis.com.system.personnelservice" method="getpersonnelgroups" returnvariable="personnelgroups">
<cfoutput>
<ul class="nav nav-pills nav-stacked" style="max-width:300px;">
	<cfloop query="personnelgroups">
		<li <cfif structkeyexists( url, "groupid" ) and url.groupid eq trim( ptype )>class="active"</cfif><cfif not structkeyexists( url, "groupid" ) and personnelgroups.currentrow eq 1>class="active"</cfif>>
			<a href="#application.root##url.event#&groupid=#trim( ptype )#">
				<span class="badge pull-right">#totalingroup#</span>
				<small>#ucase( ptype )#</small>
			</a>
		</li>
	</cfloop>
</ul>
</cfoutput>