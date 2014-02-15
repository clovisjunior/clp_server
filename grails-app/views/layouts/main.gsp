<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="pt_BR">
<!--<![endif]-->
	<head>

		<title>
			<g:layoutTitle default="Projeto CLP"/>
		</title>
		
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
		
		<!--[if IE]><!-->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/other/excanvas', file: 'excanvas.js')}"></script>
		<!--<![endif]-->
		<!--[if lt IE 8]><script src="${resource(dir: 'common/theme/scripts/plugins/other', file: 'json2.js')}"></script><![endif]-->
		
		<!-- Bootstrap Extended -->
		<link href="${resource(dir: 'common/bootstrap/extend/jasny-bootstrap/css' , file: 'jasny-bootstrap.min.css')}" rel="stylesheet">
		<link href="${resource(dir: 'common/bootstrap/extend/jasny-bootstrap/css', file: 'jasny-bootstrap-responsive.min.css')}" rel="stylesheet">
		<link href="${resource(dir: 'common/bootstrap/extend/bootstrap-wysihtml5/css', file: 'bootstrap-wysihtml5-0.0.2.css')}"	rel="stylesheet">
		<link href="${resource(dir: 'common/bootstrap/extend/bootstrap-select', file: 'bootstrap-select.css')}"	rel="stylesheet" />
		<link href="${resource(dir: 'common/bootstrap/extend/bootstrap-toggle-buttons/static/stylesheets', file: 'bootstrap-toggle-buttons.css')}" rel="stylesheet" />
		
		<!-- Select2 Plugin -->
		<link href="${resource(dir: 'common/theme/scripts/plugins/forms/select2', file: 'select2.css')}" rel="stylesheet" />
		
		<!-- DateTimePicker Plugin -->
		<link href="${resource(dir: 'common/theme/scripts/plugins/forms/bootstrap-datetimepicker/css', file: 'datetimepicker.css')}" rel="stylesheet" />
		
		<!-- JQueryUI -->
		<link href="${resource(dir: 'common/theme/scripts/plugins/system/jquery-ui/css/smoothness', file: 'jquery-ui-1.9.2.custom.min.css')}" rel="stylesheet" />
		
		<!-- MiniColors ColorPicker Plugin -->
		<link href="${resource(dir: 'common/theme/scripts/plugins/color/jquery-miniColors', file: 'jquery.miniColors.css')}" rel="stylesheet" />
		
		<!-- Notyfy Notifications Plugin -->
		<link href="${resource(dir: 'common/theme/scripts/plugins/notifications/notyfy', file: 'jquery.notyfy.css')}" rel="stylesheet" />
		<link href="${resource(dir: 'common/theme/scripts/plugins/notifications/notyfy/themes', file: 'default.css')}" rel="stylesheet" />
		
		<!-- Gritter Notifications Plugin -->
		<link href="${resource(dir: 'common/theme/scripts/plugins/notifications/Gritter/css', file: 'jquery.gritter.css')}" rel="stylesheet" />
		
		<!-- Easy-pie Plugin -->
		<link href="${resource(dir: 'common/theme/scripts/plugins/charts/easy-pie', file: 'jquery.easy-pie-chart.css')}" rel="stylesheet" />
		
		<!-- Google Code Prettify Plugin -->
		<link href="${resource(dir: 'common/theme/scripts/plugins/other/google-code-prettify', file: 'prettify.css')}" rel="stylesheet" />
		
		<!-- Bootstrap Image Gallery -->
		<link href="${resource(dir: 'common/bootstrap/extend/bootstrap-image-gallery/css', file: 'bootstrap-image-gallery.min.css')}" rel="stylesheet" />
		
		<!-- Main Theme Stylesheet :: CSS -->
		<link href="${resource(dir: 'common/theme/css', file: 'style-light.css')}" rel="stylesheet" />
		
		
		<!-- LESS.js Library -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/system', file: 'less.min.js')}"></script>
			
		<g:layoutHead />
		<g:javascript library="application" />
		<r:layoutResources />
	</head>
	<body class="">
	
		<!-- Main Container Fluid -->
		<div class="container-fluid fluid menu-left">
	
			<!-- Top navbar (note: add class "navbar-hidden" to close the navbar by default) -->
			<div class="navbar main hidden-print">
	
				<!-- Wrapper -->
				<div class="wrapper">
	
					<!-- Menu Toggle Button -->
					<button type="button" class="btn btn-navbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> 
						<span class="icon-bar"></span>
					</button>
					<!-- // Menu Toggle Button END -->
	
					<g:render template="/layouts/menu_superior"></g:render>
	
					<div class="clearfix"></div>
	
				</div>
				<!-- // Wrapper END -->
			</div>
			<!-- Top navbar END -->
	
			<!-- Sidebar menu & content wrapper -->
			<div id="wrapper">
	
				<g:render template="/layouts/menu_esquerda"></g:render>
	
				<!-- Content -->
				<div id="content">
				
					<g:layoutBody />
					
					<div class="separator bottom"></div>
	
				</div>
				<!-- // Content END -->
			</div>
			
		</div>
	
		<div class="clearfix"></div>
		<!-- // Sidebar menu & content wrapper END -->
	
		<g:render template="/layouts/rodape"></g:render>
		
	
		<!-- JQuery -->
		<script src="${resource(dir: 'common/theme/scripts/plugins/system', file: 'jquery.min.js')}"></script>
	
		<!-- JQueryUI -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/system/jquery-ui/js', file: 'jquery-ui-1.9.2.custom.min.js')}"></script>
	
		<!-- JQueryUI Touch Punch -->
		<!-- small hack that enables the use of touch events on sites using the jQuery UI user interface library -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/system/jquery-ui-touch-punch', file: 'jquery.ui.touch-punch.min.js')}"></script>
	
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
	
		<!-- Global -->
		<script>
			var basePath = "${resource(dir: 'common')}";
		</script>
	
		<!-- Bootstrap Extended -->
		<script src="${resource(dir: 'common/bootstrap/extend/bootstrap-select', file: 'bootstrap-select.js')}"></script>
		<script	src="${resource(dir: 'common/bootstrap/extend/bootstrap-toggle-buttons/static/js', file: 'jquery.toggle.buttons.js')}"></script>
		<script src="${resource(dir: 'common/bootstrap/extend/bootstrap-hover-dropdown', file: 'twitter-bootstrap-hover-dropdown.min.js')}"></script>
		<script src="${resource(dir: 'common/bootstrap/extend/jasny-bootstrap/js', file: 'jasny-bootstrap.min.js')}"></script>
		<script src="${resource(dir: 'common/bootstrap/extend/jasny-bootstrap/js', file: 'bootstrap-fileupload.js')}"></script>
		<script src="${resource(dir: 'common/bootstrap/extend', file: 'bootbox.js')}"></script>
		<script	src="${resource(dir: 'common/bootstrap/extend/bootstrap-wysihtml5/js', file: 'wysihtml5-0.3.0_rc2.min.js')}"></script>
		<script	src="${resource(dir: 'common/bootstrap/extend/bootstrap-wysihtml5/js', file: 'bootstrap-wysihtml5-0.0.2.js')}"></script>
	
		<!-- Google Code Prettify -->
		<script src="${resource(dir: 'common/theme/scripts/plugins/other/google-code-prettify', file: 'prettify.js')}"></script>
	
		<!-- Gritter Notifications Plugin -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/notifications/Gritter/js', file: 'jquery.gritter.min.js')}"></script>
	
		<!-- Notyfy Notifications Plugin -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/notifications/notyfy', file: 'jquery.notyfy.js')}"></script>
	
		<!-- MiniColors Plugin -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/color/jquery-miniColors', file: 'jquery.miniColors.js')}"></script>
	
		<!-- DateTimePicker Plugin -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/forms/bootstrap-datetimepicker/js', file: 'bootstrap-datetimepicker.min.js')}"></script>
	
		<!-- Cookie Plugin -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/system', file: 'jquery.cookie.js')}"></script>
	
		<!-- Colors -->
		<script>
			var primaryColor = '#8ec657',
				dangerColor = '#b55151',
				successColor = '#609450',
				warningColor = '#ab7a4b',
				inverseColor = '#45484d';
		</script>
	
		<!-- Twitter Feed -->
		<script	src="${resource(dir: 'common/theme/scripts/demo', file: 'twitter.js')}"></script>
	
		<!-- Easy-pie Plugin -->
		<script src="${resource(dir: 'common/theme/scripts/plugins/charts/easy-pie', file: 'jquery.easy-pie-chart.js')}"></script>
	
		<!-- Sparkline Charts Plugin -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/charts/sparkline', file: 'jquery.sparkline.min.js')}"></script>
	
		<!-- Ba-Resize Plugin -->
		<script	src="${resource(dir: 'common/theme/scripts/plugins/other', file: 'jquery.ba-resize.js')}"></script>
	
		<!-- Dashboard Demo Script -->
		<script	src="${resource(dir: 'common/theme/scripts/demo', file: 'index.js')}"></script>
	
		<!-- Google JSAPI -->
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	
		<!--  Flot Charts Plugin -->
		<script src="${resource(dir: 'common/theme/scripts/plugins/charts/flot', file: 'jquery.flot.js')}"></script>
		<script	src="${resource(dir: 'common/theme/scripts/plugins/charts/flot', file: 'jquery.flot.pie.js')}"></script>
		<script	src="${resource(dir: 'common/theme/scripts/plugins/charts/flot', file: 'jquery.flot.tooltip.js')}"></script>
		<script	src="${resource(dir: 'common/theme/scripts/plugins/charts/flot', file: 'jquery.flot.selection.js')}"></script>
		<script	src="${resource(dir: 'common/theme/scripts/plugins/charts/flot', file: 'jquery.flot.resize.js')}"></script>
		<script	src="${resource(dir: 'common/theme/scripts/plugins/charts/flot', file: 'jquery.flot.orderBars.js')}"></script>
	
		<!-- Charts Helper Demo Script -->
		<script	src="${resource(dir: 'common/theme/scripts/demo', file: 'charts.helper.js')}"></script>
	
		<!-- Bootstrap Image Gallery -->
		<script	src="http://blueimp.github.com/JavaScript-Load-Image/load-image.min.js"></script>
		<script	src="${resource(dir: 'common/bootstrap/extend/bootstrap-image-gallery/js', file: 'bootstrap-image-gallery.min.js')}" type="text/javascript"></script>
	
		<r:layoutResources />
	
	</body>
</html>
