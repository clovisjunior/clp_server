<!-- Sidebar Menu -->
<div id="menu" class="hidden-phone hidden-print">
	<!-- Brand -->
	<g:link url="${createLink(uri: '/')}" class="appbrand">Projeto CLP <span>outro texto</span></g:link>

	<!-- Scrollable menu wrapper with Maximum height -->
	<div class="slim-scroll" data-scroll-height="800px">
		<!-- Sidebar Profile -->
		<span class="profile">
			<p>
				Bem vindo 
				<a	href="#"><sec:loggedInUserInfo field="username"/></a>
			</p> 
			<a class="img" href="#">
				<img src="${resource(dir: 'common/theme/images', file: 'avatar-style-light.jpg')}" alt="Avatar" /></a> 
				<span>
					<ul>
						<li><a href="" class="glyphicons lock"><i></i>Conta</a></li>
						<li><a href="" class="glyphicons keys"><i></i>Senha</a></li>
						<li><a href="" class="glyphicons eject"><i></i>Logout</a></li>
					</ul>
				</span>
		</span>
		<!-- // Sidebar Profile END -->

		<!-- Regular Size Menu -->
		<ul class="menu-0">

			<!-- Menu Regular Item -->
			<li class="glyphicons display active">
				<a href="#"><i></i><span>Dashboard</span></a>
			</li>

			<!-- Components Submenu Level 1 -->
			<li class="hasSubmenu glyphicons list">
				<a data-toggle="collapse" href="#menu_components"><i></i><span>Cadastros</span></a>
				<ul class="collapse" id="menu_components">

					<li class="">
						<g:link action="index" controller="entidade">
							<span>Entidade</span>
						</g:link>
					</li>
					
					<sec:access expression="hasRole('ROLE_USER')">
					<li class="">
						<g:link action="index" controller="unidadeDeNegocio">
							<span>Unidade de Negócio</span>
						</g:link>
					</li>
					<li class="">
						<g:link action="index" controller="departamento">
							<span>Departamento</span>
						</g:link>
					</li>
					<li class="">
						<g:link action="index" controller="usuarioMovel">
							<span>Usuário Móvel</span>
						</g:link>
					</li>
					<li class="">
						<g:link action="index" controller="dispositivoMovel">
							<span>Dispositivo Móvel</span>
						</g:link>
					</li>
					<li class="">
						<g:link action="index" controller="maquina">
							<span>Máquina</span>
						</g:link>
					</li>
					</sec:access>

				</ul> 
				<span class="count">6</span>
			</li>
			
			<sec:access expression="hasRole('ROLE_USER')">
			<li class="glyphicons warning_sign">
				<g:link action="index" controller="alarme">
					<i></i><span>Alarmes</span>
				</g:link>
			</li>
			</sec:access>
		</ul>
		
		

		<div class="clearfix"></div>
		<!-- // Regular Size Menu END -->

		<ul class="menu-1">
			<li class="hasSubmenu active">
				<a class="glyphicons wifi_alt" href="#menu-recent-stats" data-toggle="collapse"><i></i>
					<span>Estatísticas</span>
				</a>
				<ul class="collapse in" id="menu-recent-stats">
					<li>
						<a class="glyphicons envelope" href="#"><i></i><span>5	New Emails</span></a>
					</li>
					<li>
						<a class="glyphicons chat" href="#"><i></i><span>New Message on 19 Jan</span></a>
					</li>
					<li>
						<a class="glyphicons user_add" href="#"><i></i><span>10	Users Subscribed</span></a>
					</li>
					<li>
						<a class="glyphicons cart_in" href="#"><i></i><span>2 Orders worth of &dollar;239</span></a>
					</li>
					<li>
						<a class="glyphicons single circle_plus" href="#"><i></i><span>View	all</span></a>
					</li>
				</ul>
			</li>
		</ul>

		<div class="clearfix"></div>
		<div class="separator bottom"></div>

		<!-- Sidebar Stats Widgets -->
		<div class="widget-sidebar-stats">
			<strong>3,540</strong> <span>Messages</span> <span
				class="pull-right sparkline"></span>
			<div class="clearfix"></div>
		</div>
		<div class="widget-sidebar-stats">
			<strong>2,510,402</strong> <span>Photos</span> <span
				class="pull-right sparkline"></span>
			<div class="clearfix"></div>
		</div>
		<div class="separator bottom"></div>
		<!-- // Sidebar Stats Widgets END -->

		<!-- Stats Widget -->
		<a href=""
			class="widget-stats widget-stats-2 widget-stats-easy-pie widget-sidebar-stats txt-single">
			<div data-percent="90" class="easy-pie primary">
				<span class="value">90</span>%
			</div> <span class="txt">Completed tasks</span>
			<div class="clearfix"></div>
		</a>
		<!-- // Stats Widget END -->

		<div class="widget-sidebar-stats">
			<h5>Generic widget</h5>
			<p>Lorem Ipsum is simply dummy text of the printing and
				typesetting industry.</p>
		</div>
	</div>
</div>
<!-- // Sidebar Menu END -->
