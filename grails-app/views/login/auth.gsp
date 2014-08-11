<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="pt_BR">
	<head>
		<title><g:message code="app.name"/></title>
		
		<!-- Meta -->
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
		
		<!-- Bootstrap -->
		<link href="${resource(dir: 'common/bootstrap/css', file: 'bootstrap.css')}" rel="stylesheet" />
		<link href="${resource(dir: 'common/bootstrap/css', file: 'responsive.css')}" rel="stylesheet" />
		
		<!-- Glyphicons Font Icons -->
		<link href="${resource(dir: 'common/theme/css', file: 'glyphicons.css')}" rel="stylesheet" />
		
		<!-- Uniform Pretty Checkboxes -->
		<link href="${resource(dir: 'common/theme/scripts/plugins/forms/pixelmatrix-uniform/css', file: 'uniform.default.css')}" rel="stylesheet" />
		
		<!-- Main Theme Stylesheet :: CSS -->
		<link href="${resource(dir: 'common/theme/css', file: 'style-light.css')}" rel="stylesheet" />
		
		<!-- LESS.js Library -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/system', file: 'less.min.js')}"></script>
	
	</head>
	<body class="login">
		
		<!-- Wrapper -->
		<div id="login">
	
			<div class="container">
			
				<div class="wrapper">
				
					<h1 class="glyphicons lock"><g:message code="app.name" default="Projeto CLP"/> <i></i></h1>
				
					<!-- Box -->
					<div class="widget">
						
						<div class="widget-head">
							<h3 class="heading"><g:message code="security.login.label" default="Login"/> </h3>
						</div>
						<div class="widget-body">

							<!-- Mensagem -->
							<g:if test="${flash.message}">
								<div class="alert ${flash.messageTypeClass}">
									<button type="button" class="close" data-dismiss="alert">&times;</button>
									<strong><g:message default="Atenção !" code="alert.warning"/></strong> ${flash.message}
								</div>
							</g:if>
							<!-- //END Mensagem -->
						
							<!-- Form -->
							<form action="${postUrl}" method="post" id="loginForm" name="loginForm" autocomplete='off'>
								<label><g:message code="security.username.label" default="Usuário"/> </label>
								<input name="j_username" type="text" class="input-block-level" placeholder="${g.message(code: 'security.username.placeholder')}" tabindex="1"/> 
								<label>


								<g:message code="security.password.labell" default="Senha"/> 
									<!--
									<a class="password" href=""><g:message code="security.password.forgot" default="Esqueceu a senha?"/></a>
									-->
								</label>

								<input name="j_password" type="password" class="input-block-level margin-none" placeholder="${g.message(code: 'security.password.placeholder')}" tabindex="2"/>
								<div class="separator bottom"></div> 
								<div class="row-fluid">

									<div class="span8">
										<div class="uniformjs">
											<!--
											<label class="checkbox">

												<input type="checkbox" name="${rememberMeParameter}" id="remember_me" <g:if test='${hasCookie}'>checked='checked'</g:if>><g:message code="security.remember.label" default="Lembre-me"/>
											</label>
											-->
										</div>
									</div>
									<div class="span4 center">
										<button class="btn btn-block btn-primary" type="submit"><g:message code="security.login.label" default="Entrar"/></button>
									</div>
								</div>
							</form>
							<!-- // Form END -->
									
						</div>
						<div class="widget-footer">
							<p class="glyphicons restart"><i></i><g:message code="security.message" /></p>
						</div>
					</div>
					<!-- // Box END -->
					
				</div>
				
			</div>
			
		</div>
		<!-- // Wrapper END -->	
	
		<!-- JQuery -->
		<script src="${resource(dir: 'common/theme/scripts/plugins/system', file: 'jquery.min.js')}"></script>
		
		<!-- Modernizr -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/system', file: 'modernizr.js')}"></script>
		
		<!-- Bootstrap -->
		<script	src="${resource(dir: 'common/bootstrap/js', file: 'bootstrap.min.js')}"></script>
		
		<!-- SlimScroll Plugin -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/other/jquery-slimScroll', file: 'jquery.slimscroll.min.js')}"></script>
		
		<!-- Common Demo Script -->
		<script	src="${resource(dir: 'common/theme/scripts/demo', file: 'common.js')}"></script>
		
		<!-- Holder Plugin -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/other/holder', file: 'holder.js')}"></script>
		
		<!-- Uniform Forms Plugin -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/forms/pixelmatrix-uniform', file: 'jquery.uniform.min.js')}"></script>
	
	</body>
</html>