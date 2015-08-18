



			<!DOCTYPE html>
				<html lang="en">
					<head>
						<meta charset="utf-8">
							<title>Progressive Debt Relief | Powered by eFiscal Networks</title>

								<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
								<meta name="apple-mobile-web-app-capable" content="yes">								
								<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css" />
								<link href="./css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />								
								<link href="./css/font-awesome.min.css" rel="stylesheet">
								<link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
								<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
								<link href="./css/ui-lightness/jquery-ui-1.10.0.custom.min.css" rel="stylesheet">  							
								<link href="./css/base-admin-3.css" rel="stylesheet">
								<link href="./css/base-admin-3-responsive.css" rel="stylesheet">								
								<link href="./css/pages/signin.css" rel="stylesheet" type="text/css">
								<link href="./css/custom.css" rel="stylesheet">
								
							<script type="text/javascript">
								$( document ).ready(function() {
								  $( "#login" ).focus();
								});
							</script>

					</head>

					<body>
	
					<nav class="navbar navbar-inverse" role="navigation">

						<div class="container">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
								  <span class="sr-only">Toggle navigation</span>
								  <span class="icon-bar"></span>
								  <span class="icon-bar"></span>
								  <span class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href="./index.html">Progressive Debt Relief</a>
							</div>

							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse navbar-ex1-collapse">
								<ul class="nav navbar-nav navbar-right">
									<li class="">												
										<a href="https://efiscal.net/" target="_blank">
											<i class="fa fa-cog"></i>&nbsp;&nbsp; 
											Powered by eFiscal Networks
										</a>									
									</li>
								</ul>
							</div><!-- /.navbar-collapse -->
						</div> <!-- /.container -->
					</nav>



					<div class="account-container stacked">
					
						<cfif isdefined( "REQUEST.badlogin" )>
							<div class="alert alert-block alert-error fade in">
								<button type="button" class="close" data-dismiss="alert">×</button>
									<h4 class="alert-heading"><i class="icon-warning-sign"></i> Login Failed!</h4>
										<p>Sorry, your login credentials have failed.  Either your username and password was entered incorrectly.  Please try again...</p>
										
							</div>					
						<cfelseif isdefined( "url.logout" ) and url.logout eq 1>
							<div class="alert alert-block alert-info fade in">
								<button type="button" class="close" data-dismiss="alert">×</button>
									<h4 class="alert-heading"><i class="icon-check"></i> THANK YOU!</h4>
										<p>Your logout request was processed successfully.  To continue, please login again or close this window.</p>
										
							</div>
						</cfif>
	
						<div class="content clearfix">
							
							
							<cfoutput>
							<form action="#application.root#index" method="post">
							
								<h1>Sign In</h1>		
			
									<div class="login-fields">
										
										<p>Sign in using your registered account:</p>
				
											<div class="field">
												<label for="username">Username:</label>
												<input type="text" id="username" name="j_username" placeholder="Email Address" id="login" class="form-control input-lg username-field" autocomplete="off" />
												<input type="hidden" name="login" value="" />
											</div> <!-- /field -->
											
											<div class="field">
												<label for="password">Password:</label>
												<input type="password" id="password" name="j_password" placeholder="Password" class="form-control input-lg password-field" />
											</div> <!-- /password -->
											
									</div> <!-- /login-fields -->
										
									<div class="login-actions" style="margin-top:15px;float:right;">															
										<button class="button btn btn-primary btn-large">Sign In</button>											
									</div> <!-- .actions -->
							</form>
							</cfoutput>
						</div> <!-- /content -->
	
					</div> <!-- /account-container -->


					
						<!-- Text Under Login Box -->
						<cfoutput>
							<div class="login-extra" style="color:##333;font-size:10px;">
								<!---Don't have an account? <a href="./signup.html">Sign Up</a><br/>--->
								&copy; #Year(Now())#&nbsp;&nbsp;#application.developer#<br />
								All Rights Reserved.<br />
								#application.title#&nbsp;&nbsp;#application.softver#
							</div> <!-- /login-extra -->
						</cfoutput>





					<!-- Placed at the end of the document so the pages load faster -->
					<script src="./js/libs/jquery-1.9.1.min.js"></script>
					<script src="./js/libs/jquery-ui-1.10.0.custom.min.js"></script>
					<script src="./js/libs/bootstrap.min.js"></script>
					<script src="./js/Application.js"></script>
					<script src="./js/demo/signin.js"></script>

			</body>
		</html>