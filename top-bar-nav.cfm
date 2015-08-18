




				<cfoutput>
					<nav class="navbar navbar-inverse" role="navigation">
						<div class="container">
							<!-- Brand and toggle get grouped for better mobile display -->
								<div class="navbar-header">
									<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
										<span class="sr-only">Toggle navigation</span>
											<i class="fa fa-cog"></i>
									</button>
									<cfif not structkeyexists( session, "selectedclientid" )>
										<a class="navbar-brand" href="#application.root#index">#application.agencyname#</a>
									<cfelse>
										<a class="navbar-brand" href="#application.root#client">#application.agencyname#</a>
									</cfif>
								</div>

							<cfif isuserloggedin()>
							<!-- collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse navbar-ex1-collapse">
								<ul class="nav navbar-nav navbar-right">
									
									<cfif isuserinrole( "efiscal" )>
										<li class="dropdown">
										
											<a href="javscript:;" class="dropdown-toggle" data-toggle="dropdown">
												<i class="fa fa-cog"></i>
												Settings
												<b class="caret"></b>
											</a>
							
											<ul class="dropdown-menu">
												<li><a href="#application.root#admin"><i class="fa fa-cogs"></i> Administration</a></li>
												<li><a href="#application.root#users"><i class="fa fa-user"></i> Manage Personnel</a></li>
												<li class="divider"></li>
												<li><a href="#application.root#offices"><i class="fa fa-building"></i> Manage Offices</a></li>
												<li><a href="#application.root#leadsources"><i class="fa fa-list-alt"></i> Manage Sources</a></li>
											</ul>
							
										</li>
									</cfif>
									
									<li class="dropdown">
													
										<a href="javscript:;" class="dropdown-toggle" data-toggle="dropdown">
											<i class="fa fa-user"></i> 
											<!---// session username --->
											<cfif structkeyexists( session, "username" )>
												#session.username#
											<cfelse>
												#getauthuser()#
											</cfif>
											
											<b class="caret"></b>
										</a>
										
										<ul class="dropdown-menu">
											<li><a href="#application.root#profile"><i class="fa fa-user"></i> My Profile</a></li>
											<li><a href="#application.root#calendar"><i class="fa fa-calendar-o"></i> My Calendar</a></li>
											<li class="divider"></li>
											<li><a href="#application.root#logout"><i class="fa fa-power-off"></i> Logout</a></li>
										</ul>
										
									</li>
								</ul>
								<cfif not structkeyexists( session, "selectedclientid" )>
									<form class="navbar-form navbar-right" role="search" action="#application.root#results" method="post">
										<div class="form-group">
											<input type="text" name="search" class="form-control input-sm search-query" placeholder="Search Clients by ID or Name">										
										</div>
									</form>
								</cfif>
							</div><!-- /.navbar-collapse -->
							</cfif>
						</div> <!-- /.container -->
					</nav>
				</cfoutput>