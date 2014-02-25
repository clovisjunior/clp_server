<!DOCTYPE html>
<html>
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
	<body>
		<!-- Box -->
		<div class="hero-unit well">
			<h1>Ouch! <span> Acesso negado !!!!</span></h1>
			<hr class="separator" />
			<!-- Row -->
			<div class="row-fluid row-merge">
			
				<!-- Column -->
				<div class="span12">
					<div class="innerAll left">
						<p> <g:message code="security.denied.message"/> :(</p>
					</div>
				</div>
				<!-- // Column END -->
				
			</div>
			<!-- // Row END -->
				
		</div>
	</body>
</html>
