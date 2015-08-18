<cfinvoke component="apis.com.system.personnelservice" method="getpersonnel" returnvariable="personnellist">
	<cfif not structkeyexists( url, "groupid" )>				
		<cfinvokeargument name="groupid" value="Sales">
	<cfelse>
		<cfinvokeargument name="groupid" value="#trim( url.groupid )#">
	</cfif>
</cfinvoke>


		<cfif personnellist.recordcount gt 0>			
			
			<cfif structkeyexists( url, "msg" ) and trim( url.msg ) is "saved">
				<div class="alert alert-success alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<strong><i class="fa fa-check-square"></i> Success!</strong> The personnel record was successfully saved...
				</div>
			<cfelseif structkeyexists( url, "msg" ) and trim( url.msg ) is "added">
				<div class="alert alert-success alert-dismissable">
					<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
					<strong><i class="fa fa-check-square"></i>Success!</strong> The new personnel record was successfully added...
				</div>
			</cfif>
			
			
			<cfoutput>
			<h5 style="color:##990000;font-weight:600;"><i class="fa fa-th-large"></i>  <cfif structkeyexists( url, "groupid" )>#trim( url.groupid )# User Group<cfelse>Sales User Group</cfif></h5>
			</cfoutput>
			
			<br />
			<table class="table table-striped table-highlight">
				<thead>
					<tr>
						<th style="text-align:center;" width="3%">Actions</th>
						<th>Name</th>
						<th>Group</th>
						<th>Position</th>								
					</tr>
				</thead>
				<tbody>
					<cfoutput query="personnellist">
						<tr>
							<td class="actions">
								<div align="center">
								<a href="#application.root##url.event#&fuseaction=edituser&pid=#personnelid#"><i class="icon-btn-only fa fa-user-secret"></i></a></td>
								</div>
							<td>#personnelfirstname# #personnellastname#</td>
							<td>#personneltype#</td>
							<td>#positionTitle#</td>
						</tr>
					</cfoutput>
				</tbody>
			</table>
		
		
		
		<cfelse>
		
			<div class="alert alert-danger alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <i class="fa fa-warning"></i> <strong>The query found no personnel in the selected group...</strong> Please add a user to this group of select a different group to continue.
            </div>
		
		</cfif>