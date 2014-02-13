<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="pt_BR">
<!--<![endif]-->
<head>

	<title><g:layoutTitle default="Grails" /></title>
	
	<!-- Meta -->
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
	
<!-- Bootstrap -->
<link
	href="${resource(dir: 'common/bootstrap/css', file: 'bootstrap.css')}"
	rel="stylesheet" />
<link
	href="${resource(dir: 'common/bootstrap/css', file: 'responsive.css')}"
	rel="stylesheet" />

<!-- Glyphicons Font Icons -->
<link
	href="${resource(dir: 'common/theme/css', file: 'glyphicons.css')}"
	rel="stylesheet" />

<!-- Uniform Pretty Checkboxes -->
<link
	href="${resource(dir: 'common/theme/scripts/plugins/forms/pixelmatrix-uniform/css', file: 'uniform.default.css')}"
	rel="stylesheet" />

<!--[if IE]><!-->
<script
	src="${resource(dir: 'common/theme/scripts/plugins/other/excanvas', file: 'excanvas.js')}"></script>
<!--<![endif]-->
<!--[if lt IE 8]><script src="${resource(dir: 'common/theme/scripts/plugins/other', file: 'json2.js')}"></script><![endif]-->

<!-- Bootstrap Extended -->
<link
	href="${resource(dir: 'common/bootstrap/extend/jasny-bootstrap/css' , file: 'jasny-bootstrap.min.css')}"
	rel="stylesheet">
<link
	href="${resource(dir: 'common/bootstrap/extend/jasny-bootstrap/css', file: 'jasny-bootstrap-responsive.min.css')}"
	rel="stylesheet">
<link
	href="${resource(dir: 'common/bootstrap/extend/bootstrap-wysihtml5/css', file: 'bootstrap-wysihtml5-0.0.2.css')}"
	rel="stylesheet">
<link
	href="${resource(dir: 'common/bootstrap/extend/bootstrap-select', file: 'bootstrap-select.css')}"
	rel="stylesheet" />
<link
	href="${resource(dir: 'common/bootstrap/extend/bootstrap-toggle-buttons/static/stylesheets', file: 'bootstrap-toggle-buttons.css')}"
	rel="stylesheet" />

<!-- Select2 Plugin -->
<link
	href="${resource(dir: 'common/theme/scripts/plugins/forms/select2', file: 'select2.css')}"
	rel="stylesheet" />

<!-- DateTimePicker Plugin -->
<link
	href="${resource(dir: 'common/theme/scripts/plugins/forms/bootstrap-datetimepicker/css', file: 'datetimepicker.css')}"
	rel="stylesheet" />

<!-- JQueryUI -->
<link
	href="${resource(dir: 'common/theme/scripts/plugins/system/jquery-ui/css/smoothness', file: 'jquery-ui-1.9.2.custom.min.css')}"
	rel="stylesheet" />

<!-- MiniColors ColorPicker Plugin -->
<link
	href="${resource(dir: 'common/theme/scripts/plugins/color/jquery-miniColors', file: 'jquery.miniColors.css')}"
	rel="stylesheet" />

<!-- Notyfy Notifications Plugin -->
<link
	href="${resource(dir: 'common/theme/scripts/plugins/notifications/notyfy', file: 'jquery.notyfy.css')}"
	rel="stylesheet" />
<link
	href="${resource(dir: 'common/theme/scripts/plugins/notifications/notyfy/themes', file: 'default.css')}"
	rel="stylesheet" />

<!-- Gritter Notifications Plugin -->
<link
	href="${resource(dir: 'common/theme/scripts/plugins/notifications/Gritter/css', file: 'jquery.gritter.css')}"
	rel="stylesheet" />

<!-- Easy-pie Plugin -->
<link
	href="${resource(dir: 'common/theme/scripts/plugins/charts/easy-pie', file: 'jquery.easy-pie-chart.css')}"
	rel="stylesheet" />

<!-- Google Code Prettify Plugin -->
<link
	href="${resource(dir: 'common/theme/scripts/plugins/other/google-code-prettify', file: 'prettify.css')}"
	rel="stylesheet" />

<!-- Bootstrap Image Gallery -->
<link
	href="${resource(dir: 'common/bootstrap/extend/bootstrap-image-gallery/css', file: 'bootstrap-image-gallery.min.css')}"
	rel="stylesheet" />

<!-- Main Theme Stylesheet :: CSS -->
<link
	href="${resource(dir: 'common/theme/css', file: 'style-light.css')}"
	rel="stylesheet" />


<!-- LESS.js Library -->
<script
	src="${resource(dir: 'common/theme/scripts/plugins/system', file: 'less.min.js')}"></script>

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
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
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
				<h2>
					Dashboard <span>for your next cool web APP</span>
				</h2>

				<div class="innerLR">
					<!-- Website Traffic Chart -->
					<div class="widget" data-toggle="collapse-widget">
						<div class="widget-head">
							<h4 class="heading glyphicons cardio">
								<i></i>Website Traffic
							</h4>
						</div>
						<div class="widget-body">
							<div id="chart_lines_fill_nopoints" style="height: 250px;"></div>
						</div>
					</div>
					<!-- // Website Traffic Chart END -->


					<!-- Stats Widgets -->
					<div class="row-fluid widget-stats-group">

						<div class="span1 center hidden-phone">
							<a
								class="btn disabled btn-small btn-default glyphicons standard chevron-left"><i></i></a>
						</div>

						<div class="span2">

							<!-- Stats Widget -->
							<a href="" class="widget-stats"> <span
								class="glyphicons cart_in"><i></i></span> <span class="txt">Sales</span>
								<div class="clearfix"></div> <span
								class="count label label-important">20</span>
							</a>
							<!-- // Stats Widget END -->

						</div>
						<div class="span2">

							<!-- Stats Widget -->
							<a href="" class="widget-stats"> <span
								class="glyphicons shield"><i></i></span> <span class="txt">Alerts</span>
								<div class="clearfix"></div> <span class="count label">25</span>
							</a>
							<!-- // Stats Widget END -->

						</div>
						<div class="span2">

							<!-- Stats Widget -->
							<a href="" class="widget-stats"> <span
								class="glyphicons user_add"><i></i></span> <span class="txt">Clients</span>
								<div class="clearfix"></div> <span
								class="count label label-warning">33</span>
							</a>
							<!-- // Stats Widget END -->

						</div>
						<div class="span2">

							<!-- Stats Widget -->
							<a href="" class="widget-stats"> <span
								class="glyphicons envelope"><i></i></span> <span class="txt">Messages</span>
								<div class="clearfix"></div> <span
								class="count label label-primary">265</span>
							</a>
							<!-- // Stats Widget END -->

						</div>
						<div class="span2">

							<!-- Stats Widget -->
							<a href="" class="widget-stats primary"> <span
								class="glyphicons usd"><i></i></span> <span class="txt">Earnings</span>
								<div class="clearfix"></div> <span
								class="count label label-success">&dollar;2,920</span>
							</a>
							<!-- // Stats Widget END -->

						</div>

						<div class="span1 center hidden-phone">
							<a
								class="btn btn-small btn-default glyphicons standard chevron-right"><i></i></a>
						</div>

					</div>

					<div class="separator bottom"></div>
					<!-- // Stats Widgets END -->

					<div class="tickertape">
						<strong class="title">Important</strong> <span class="marquee">
							<span><strong>Lorem Ipsum</strong> is simply dummy text of
								the printing and typesetting industry.</span> <span>Lorem Ipsum
								has been the <strong>industry's standard</strong> dummy text
								ever since the 1500s.
						</span>
						</span>
					</div>

					<div class="row-fluid">
						<div class="span6">
							<div class="widget widget-activity margin-none"
								data-toggle="collapse-widget">
								<div class="widget-head">
									<h4 class="heading">Recent Activity</h4>
								</div>
								<div class="widget-body">

									<div class="innerB">
										<ul class="tabs">
											<li class="glyphicons user_add"><span data-toggle="tab"
												data-target="#filterUsersTab"><i></i></span></li>
											<li class="glyphicons shopping_cart"><span
												data-toggle="tab" data-target="#filterOrdersTab"><i></i></span></li>
											<li class="glyphicons envelope active"><span
												data-toggle="tab" data-target="#filterMessagesTab"><i></i></span></li>
											<li class="glyphicons link"><span data-toggle="tab"
												data-target="#filterLinksTab"><i></i></span></li>
											<li class="glyphicons camera"><span data-toggle="tab"
												data-target="#filterPhotosTab"><i></i></span></li>
										</ul>
										<div class="clearfix"></div>
									</div>

									<div class="tab-content">


										<!-- Filter Users Tab -->
										<div class="tab-pane" id="filterUsersTab">
											<ul class="list">

												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon user_add"><i></i></span> <span
													class="ellipsis"><a href="">Darius Jackson</a>
														registered at <a href="">Darius Jackson's</a> suggestion.</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon user_add"><i></i></span> <span
													class="ellipsis"><a href="">John Doe</a> registered
														at <a href="">Melisa Ragae's</a> suggestion.</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon user_add"><i></i></span> <span
													class="ellipsis"><a href="">Melisa Ragae</a>
														registered at <a href="">Martin Glades's</a> suggestion.</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon user_add"><i></i></span> <span
													class="ellipsis"><a href="">Martin Glades</a>
														registered at <a href="">John Doe's</a> suggestion.</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->

											</ul>
											<button type="button"
												class="btn btn-small btn-inverse view-all hidden-phone">
												<span class="hidden-phone hidden-tablet">View </span>members
											</button>
										</div>
										<!-- // Filter Users Tab END -->

										<!-- Filter Orders Tab -->
										<div class="tab-pane" id="filterOrdersTab">
											<ul class="list">

												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon shopping_cart"><i></i></span>
													<span class="ellipsis"><a href="">Jane Doe</a>
														bought 10 items worth of &euro;50 (<a href="">order
															#2301</a>)</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon shopping_cart"><i></i></span>
													<span class="ellipsis"><a href="">Melisa Ragae</a>
														bought 10 items worth of &euro;50 (<a href="">order
															#2302</a>)</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon shopping_cart"><i></i></span>
													<span class="ellipsis"><a href="">John Doe</a>
														bought 10 items worth of &euro;50 (<a href="">order
															#2303</a>)</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon shopping_cart"><i></i></span>
													<span class="ellipsis"><a href="">Jane Doe</a>
														bought 10 items worth of &euro;50 (<a href="">order
															#2304</a>)</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->

											</ul>
											<button type="button"
												class="btn btn-small btn-inverse view-all hidden-phone">
												<span class="hidden-phone hidden-tablet">View </span>orders
											</button>
										</div>
										<!-- // Filter Orders Tab END -->

										<!-- Filter Messages Tab -->
										<div class="tab-pane active" id="filterMessagesTab">
											<ul class="list">

												<!-- Activity item -->
												<li class="double"><span
													class="glyphicons activity-icon envelope"><i></i></span> <span
													class="ellipsis"> You have received an email from <a
														href="">Darius Jackson</a> (darius.jackson@fake-email.net)
														<span class="meta glyphicons calendar single"><i></i>
															on 29 March, 2013 <span>1 hour ago</span></span>
												</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li class="double highlight"><span
													class="glyphicons activity-icon envelope"><i></i></span> <span
													class="ellipsis"> You have received an email from <a
														href="">Martin Glades</a> (martin.glades@wee-email.com) <span
														class="meta glyphicons calendar single"><i></i> on
															29 March, 2013 <span>1 hour ago</span></span>
												</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li class="double"><span
													class="glyphicons activity-icon envelope"><i></i></span> <span
													class="ellipsis"> You have received an email from <a
														href="">Martin Glades</a> (martin.glades@wee-email.com) <span
														class="meta glyphicons calendar single"><i></i> on
															29 March, 2013 <span>1 hour ago</span></span>
												</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li class="double"><span
													class="glyphicons activity-icon envelope"><i></i></span> <span
													class="ellipsis"> You have received an email from <a
														href="">John Doe</a> (john.doe@fake-email.net) <span
														class="meta glyphicons calendar single"><i></i> on
															29 March, 2013 <span>1 hour ago</span></span>
												</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->

											</ul>
											<button type="button"
												class="btn btn-small btn-inverse view-all hidden-phone">
												<span class="hidden-phone hidden-tablet">View </span>messages
											</button>
										</div>
										<!-- // Filter Messages Tab END -->

										<!-- Filter Links Tab -->
										<div class="tab-pane" id="filterLinksTab">
											<ul class="list">

												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon link"><i></i></span> <span
													class="ellipsis"><a href="">Darius Jackson</a>
														bought 10 items worth of &euro;50 (<a href="">order
															#2301</a>)</span>
													<div class="clearfix"></div></li>
												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon link"><i></i></span> <span
													class="ellipsis"><a href="">John Doe</a> bought 10
														items worth of &euro;50 (<a href="">order #2302</a>)</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon link"><i></i></span> <span
													class="ellipsis"><a href="">John Doe</a> bought 10
														items worth of &euro;50 (<a href="">order #2303</a>)</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon link"><i></i></span> <span
													class="ellipsis"><a href="">Darius Jackson</a>
														bought 10 items worth of &euro;50 (<a href="">order
															#2304</a>)</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->

											</ul>
											<button type="button"
												class="btn btn-small btn-inverse view-all hidden-phone">
												<span class="hidden-phone hidden-tablet">View </span>referrals
											</button>
										</div>
										<!-- // Filter Links Tab END -->

										<!-- Filter Photos Tab -->
										<div class="tab-pane" id="filterPhotosTab">
											<ul class="list">

												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon camera"><i></i></span> <span
													class="ellipsis"><a href="">Jane Doe</a> bought 10
														items worth of &euro;50 (<a href="">order #2301</a>)</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon camera"><i></i></span> <span
													class="ellipsis"><a href="">John Doe</a> bought 10
														items worth of &euro;50 (<a href="">order #2302</a>)</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon camera"><i></i></span> <span
													class="ellipsis"><a href="">Melisa Ragae</a> bought
														10 items worth of &euro;50 (<a href="">order #2303</a>)</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->
												<!-- Activity item -->
												<li><span class="date">21/03</span> <span
													class="glyphicons activity-icon camera"><i></i></span> <span
													class="ellipsis"><a href="">Jane Doe</a> bought 10
														items worth of &euro;50 (<a href="">order #2304</a>)</span>
													<div class="clearfix"></div></li>
												<!-- // Activity item END -->

											</ul>
											<button type="button"
												class="btn btn-small btn-inverse view-all hidden-phone">
												<span class="hidden-phone hidden-tablet">View </span>photos
											</button>
										</div>
										<!-- // Filter Photos Tab END -->

									</div>
									<div class="separator bottom"></div>

									<button type="button" class="btn btn-default">Default</button>
									<button type="button" class="btn btn-primary">Primary</button>
									<button type="button" class="btn btn-success hidden-phone">Success</button>
									<button type="button" class="btn btn-warning hidden-phone">Warning</button>
									<button type="button" class="btn btn-danger hidden-phone">Danger</button>
								</div>
							</div>
						</div>

						<div class="span6">
							<!-- Chat -->
							<div class="widget widget-chat margin-none">

								<div class="widget-head">
									<h4 class="heading">Chat</h4>
								</div>
								<div class="widget-body">

									<!-- Slim Scroll -->
									<div class="slim-scroll chat-items" data-scroll-height="222px">

										<!-- Media item -->
										<div class="media">
											<div class="media-object pull-left thumb">
												<img data-src="holder.js/51x51" alt="Image">
											</div>
											<div class="media-body">
												<blockquote>
													<small><a href="#" title="" class="strong">Martin</a>
														<cite>just now</cite></small>
													<p>Lorem ipsum dolor sit amet, consectetur adipiscing
														elit. Proin vitae accumsan mauris. Donec vitae nibh felis,
														facilisis bibendum sapien.</p>
												</blockquote>
											</div>
										</div>
										<!-- // Media item END -->

										<!-- Media item -->
										<div class="media">
											<div class="media-object pull-right thumb">
												<img data-src="holder.js/51x51" alt="Image">
											</div>
											<div class="media-body right">
												<blockquote class="pull-right">
													<small><a href="#" title="" class="strong">John
															Doe</a><cite> 15 seconds ago</cite></small>
													<p>In ultricies ante eget tortor euismod vitae molestie
														eros hendrerit. Cras tristique, orci ac lacinia aliquet,
														velit risus laoreet lectus, eget sollicitudin metus orci
														non nulla.</p>
												</blockquote>
											</div>
										</div>
										<!-- // Media item END -->

										<!-- Media item -->
										<div class="media">
											<div class="media-object pull-left thumb">
												<img data-src="holder.js/51x51" alt="Image">
											</div>
											<div class="media-body">
												<blockquote>
													<small><a href="#" title="" class="strong">Ricky</a>
														<cite>5 minutes ago</cite></small>
													<p>Pellentesque ac turpis turpis. Aliquam erat
														volutpat. Proin semper auctor mauris vel tempor. Ut eget
														turpis neque. Nam ultricies tortor eu odio ultricies
														euismod.</p>
												</blockquote>
											</div>
										</div>
										<!-- // Media item END -->

									</div>
									<!-- // Slim Scroll END -->

								</div>

								<div class="chat-controls">
									<div class="innerLR">
										<form class="margin-none">
											<div class="row-fluid">
												<div class="span10">
													<input type="text" name="message"
														class="input-block-level margin-none"
														placeholder="Type your message .." />
												</div>
												<div class="span2">
													<button type="submit" class="btn btn-block btn-inverse">Send</button>
												</div>
											</div>
										</form>
									</div>
								</div>

							</div>
							<!-- // Chat END -->
						</div>

					</div>
					<div class="separator bottom"></div>

				</div>

				<div class="separator bottom"></div>

			</div>
		</div>
		<!-- // Content END -->
	</div>

	<div class="clearfix"></div>
	<!-- // Sidebar menu & content wrapper END -->

	<div id="footer" class="hidden-print">

		<!--  Copyright Line -->
		<div class="copy">
			&copy; 2012 - 2013 - <a href="http://www.mosaicpro.biz">MosaicPro</a>
			- All Rights Reserved. <a
				href="http://themeforest.net/item/ergo-admin-ui-template/4602755?ref=mosaicpro"
				target="_blank">Purchase Ergo on ThemeForest</a> - Current version:
			v1.2 / <a target="_blank"
				href="http://demo.mosaicpro.biz/ergoadmin/CHANGELOG">changelog</a>
		</div>
		<!--  End Copyright Line -->

	</div>
	<!-- // Footer END -->

	<!-- // Main Container Fluid END -->

	<!-- Themer -->
	<div id="themer" class="collapse">
		<div class="wrapper">
			<span class="close2">&times; close</span>
			<h4>
				Themer <span>color options</span>
			</h4>
			<ul>
				<li>Theme: <select id="themer-theme" class="pull-right"></select>
				<div class="clearfix"></div></li>
				<li>Primary Color: <input type="text" data-type="minicolors"
					data-default="#ffffff" data-slider="hue" data-textfield="false"
					data-position="left" id="themer-primary-cp" />
				<div class="clearfix"></div></li>
				<li><span class="link" id="themer-custom-reset">reset
						theme</span> <span class="pull-right"><label>advanced <input
							type="checkbox" value="1" id="themer-advanced-toggle" /></label></span></li>
			</ul>
			<div id="themer-getcode" class="hide">
				<hr class="separator" />
				<button
					class="btn btn-primary btn-small pull-right btn-icon glyphicons download"
					id="themer-getcode-less">
					<i></i>Get LESS
				</button>
				<button
					class="btn btn-inverse btn-small pull-right btn-icon glyphicons download"
					id="themer-getcode-css">
					<i></i>Get CSS
				</button>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- // Themer END -->

	<!-- Modal Gallery -->
	<div id="modal-gallery"
		class="modal modal-gallery hide fade hidden-print" tabindex="-1">
		<div class="modal-header">
			<a class="close" data-dismiss="modal">&times;</a>
			<h3 class="modal-title"></h3>
		</div>
		<div class="modal-body">
			<div class="modal-image"></div>
		</div>
		<div class="modal-footer">
			<a class="btn btn-primary modal-next">Next <i
				class="icon-arrow-right icon-white"></i></a> <a
				class="btn btn-info modal-prev"><i
				class="icon-arrow-left icon-white"></i> Previous</a> <a
				class="btn btn-success modal-play modal-slideshow"
				data-slideshow="5000"><i class="icon-play icon-white"></i>
				Slideshow</a> <a class="btn modal-download" target="_blank"><i
				class="icon-download"></i> Download</a>
		</div>
	</div>
	<!-- // Modal Gallery END -->

	<!-- JQuery -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/system', file: 'jquery.min.js')}"></script>

	<!-- JQueryUI -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/system/jquery-ui/js', file: 'jquery-ui-1.9.2.custom.min.js')}"></script>

	<!-- JQueryUI Touch Punch -->
	<!-- small hack that enables the use of touch events on sites using the jQuery UI user interface library -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/system/jquery-ui-touch-punch', file: 'jquery.ui.touch-punch.min.js')}"></script>


	<!-- Modernizr -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/system', file: 'modernizr.js')}"></script>

	<!-- Bootstrap -->
	<script
		src="${resource(dir: 'common/bootstrap/js', file: 'bootstrap.min.js')}"></script>

	<!-- SlimScroll Plugin -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/other/jquery-slimScroll', file: 'jquery.slimscroll.min.js')}"></script>

	<!-- Common Demo Script -->
	<script
		src="${resource(dir: 'common/theme/scripts/demo', file: 'common.js')}"></script>

	<!-- Holder Plugin -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/other/holder', file: 'holder.js')}"></script>

	<!-- Uniform Forms Plugin -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/forms/pixelmatrix-uniform', file: 'jquery.uniform.min.js')}"></script>

	<!-- Global -->
	<script>
		var basePath = "${resource(dir: 'common')}";
	</script>

	<!-- Bootstrap Extended -->
	<script
		src="${resource(dir: 'common/bootstrap/extend/bootstrap-select', file: 'bootstrap-select.js')}"></script>
	<script
		src="${resource(dir: 'common/bootstrap/extend/bootstrap-toggle-buttons/static/js', file: 'jquery.toggle.buttons.js')}"></script>
	<script
		src="${resource(dir: 'common/bootstrap/extend/bootstrap-hover-dropdown', file: 'twitter-bootstrap-hover-dropdown.min.js')}"></script>
	<script
		src="${resource(dir: 'common/bootstrap/extend/jasny-bootstrap/js', file: 'jasny-bootstrap.min.js')}"></script>
	<script
		src="${resource(dir: 'common/bootstrap/extend/jasny-bootstrap/js', file: 'bootstrap-fileupload.js')}"></script>
	<script
		src="${resource(dir: 'common/bootstrap/extend', file: 'bootbox.js')}"></script>
	<script
		src="${resource(dir: 'common/bootstrap/extend/bootstrap-wysihtml5/js', file: 'wysihtml5-0.3.0_rc2.min.js')}"></script>
	<script
		src="${resource(dir: 'common/bootstrap/extend/bootstrap-wysihtml5/js', file: 'bootstrap-wysihtml5-0.0.2.js')}"></script>

	<!-- Google Code Prettify -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/other/google-code-prettify', file: 'prettify.js')}"></script>

	<!-- Gritter Notifications Plugin -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/notifications/Gritter/js', file: 'jquery.gritter.min.js')}"></script>

	<!-- Notyfy Notifications Plugin -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/notifications/notyfy', file: 'jquery.notyfy.js')}"></script>

	<!-- MiniColors Plugin -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/color/jquery-miniColors', file: 'jquery.miniColors.js')}"></script>

	<!-- DateTimePicker Plugin -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/forms/bootstrap-datetimepicker/js', file: 'bootstrap-datetimepicker.min.js')}"></script>

	<!-- Cookie Plugin -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/system', file: 'jquery.cookie.js')}"></script>

	<!-- Colors -->
	<script>
		var primaryColor = '#8ec657',
			dangerColor = '#b55151',
			successColor = '#609450',
			warningColor = '#ab7a4b',
			inverseColor = '#45484d';
		</script>

	<!-- Themer -->
	<script>
		var themerPrimaryColor = primaryColor;
		</script>
	<script
		src="${resource(dir: 'common/theme/scripts/demo', file: 'themer.js')}"></script>

	<!-- Twitter Feed -->
	<script
		src="${resource(dir: 'common/theme/scripts/demo', file: 'twitter.js')}"></script>

	<!-- Easy-pie Plugin -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/charts/easy-pie', file: 'jquery.easy-pie-chart.js')}"></script>

	<!-- Sparkline Charts Plugin -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/charts/sparkline', file: 'jquery.sparkline.min.js')}"></script>

	<!-- Ba-Resize Plugin -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/other', file: 'jquery.ba-resize.js')}"></script>

	<!-- Dashboard Demo Script -->
	<script
		src="${resource(dir: 'common/theme/scripts/demo', file: 'index.js')}"></script>


	<!-- Google JSAPI -->
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>

	<!--  Flot Charts Plugin -->
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/charts/flot', file: 'jquery.flot.js')}"></script>
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/charts/flot', file: 'jquery.flot.pie.js')}"></script>
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/charts/flot', file: 'jquery.flot.tooltip.js')}"></script>
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/charts/flot', file: 'jquery.flot.selection.js')}"></script>
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/charts/flot', file: 'jquery.flot.resize.js')}"></script>
	<script
		src="${resource(dir: 'common/theme/scripts/plugins/charts/flot', file: 'jquery.flot.orderBars.js')}"></script>

	<!-- Charts Helper Demo Script -->
	<script
		src="${resource(dir: 'common/theme/scripts/demo', file: 'charts.helper.js')}"></script>


	<!-- Bootstrap Image Gallery -->
	<script
		src="http://blueimp.github.com/JavaScript-Load-Image/load-image.min.js"></script>
	<script
		src="${resource(dir: 'common/bootstrap/extend/bootstrap-image-gallery/js', file: 'bootstrap-image-gallery.min.js')}"
		type="text/javascript"></script>

	<g:layoutBody />
	<r:layoutResources />

</body>
</html>
