


			
			
			<!---
			<cfif structkeyexists( url, "pid" )>
				<cfif isvalid( "integer", url.pid )>
					
				<cfelse>
				
				</cfif>
			</cfif>
			--->
			







			<cfoutput>


				<h4 style="margin-top:-7px;margin-bottom:10px;font-weight:600;"><i class="fa fa-users"></i> Manage Personnel<span class="pull-right"><a href="#application.root##url.event#&fuseaction=adduser&pid=0" class="btn btn-sm btn-primary" style="margin-right:5px;"><i class="fa fa-user-plus"></i> Add User</a><a href="#application.root#admin" class="btn btn-sm btn-default"><i class="fa fa-home"></i> Admin Home</a></span></h4>
				
				<br />
				
				
				<div class="col-md-3">
					<cfinclude template="personnel-menu-view.cfm">				
				</div>
				
				
				<div class="col-md-9">				
					<cfif not structkeyexists( url, "fuseaction" )>
						<cfinclude template="personnel-data-grid.cfm">
					<cfelse>
						<cfif structkeyexists( url, "fuseaction" ) and trim( url.fuseaction ) eq "edituser">
							<cfinclude template="personnel-form-view.cfm">
						<cfelseif structkeyexists( url, "fuseaction" ) and trim( url.fuseaction ) eq "adduser">
							<cfinclude template="personnel-form-add-view.cfm">
						</cfif>
					</cfif>
				</div>
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			</cfoutput>