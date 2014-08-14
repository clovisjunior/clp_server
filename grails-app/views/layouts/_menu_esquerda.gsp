<!-- Sidebar Menu -->
<div id="menu" class="hidden-phone hidden-print">
	<!-- Brand -->
	<g:link url="${createLink(uri: '/')}" class="appbrand">Projeto CLP <span></span></g:link>

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
						<sec:access expression="hasRole('ROLE_ADMIN')">
						<li>
							<g:link controller="administrador" action="edit" id="${sec.loggedInUserInfo(field: 'id')}" class="glyphicons lock"><i></i>Conta</g:link>							
						</li>
						<li>
							<g:link controller="administrador" action="edit" id="${sec.loggedInUserInfo(field: 'id')}" class="glyphicons lock"><i></i>Senha</g:link>
						</li>
						</sec:access>

						<sec:access expression="hasRole('ROLE_USER')">
						<li>
							<g:link controller="entidade" action="edit" id="${sec.loggedInUserInfo(field: 'id')}" class="glyphicons lock"><i></i>Conta</g:link>							
						</li>
						<li>
							<g:link controller="entidade" action="edit" id="${sec.loggedInUserInfo(field: 'id')}" class="glyphicons lock"><i></i>Senha</g:link>
						</li>
						</sec:access>
						<li>
							<g:link controller="logout" class="glyphicons eject"><i></i>Sair</g:link>
						</li>
						
					</ul>
				</span>
		</span>
		<!-- // Sidebar Profile END -->

		<!-- Regular Size Menu -->
		<ul class="menu-0">

			<!-- Menu Regular Item -->
			<li id="menu_dashboard" class="glyphicons display">
				<g:link action="index" controller="dashboard">
					<i></i><span>Dashboard</span></a>
				</g:link>
			</li>

			<!-- Components Submenu Level 1 -->
			<li id="menu_cadastros" class="hasSubmenu glyphicons list">
				<a data-toggle="collapse" href="#menu_components"><i></i><span>Cadastros</span></a>
				<ul class="collapse" id="menu_components">

					<li class="">
						<g:link action="index" controller="entidade">
							<span>Entidade</span>
						</g:link>
					</li>

					<sec:access expression="hasRole('ROLE_ADMIN')">
					<li class="">
						<g:link action="index" controller="administrador">
							<span>Administradores</span>
						</g:link>
					</li>
					</sec:access>
					
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
						<g:link action="index" controller="maquina">
							<span>Máquina</span>
						</g:link>
					</li>	
					<li class="">
						<g:link action="index" controller="dispositivoMovel">
							<span>Dispositivo Móvel</span>
						</g:link>
					</li>
					<li class="">
						<g:link action="index" controller="usuarioMovel">
							<span>Usuário Móvel</span>
						</g:link>
					</li>
					</sec:access>

				</ul> 
				
			</li>
			
			<sec:access expression="hasRole('ROLE_USER')">
			<li id="menu_alarme" class="glyphicons warning_sign">
				<g:link action="index" controller="alarme">
					<i></i><span>Alarmes</span>
				</g:link>
			</li>
			
			<li id="menu_ocorrencia" class="glyphicons flag">
				<g:link action="index" controller="ocorrenciaAlarme">
					<i></i><span>Ocorrências</span>
				</g:link>

				<span id="qtdeOcorrenciasAbertaMenu" class="count">
					<ocorrencia:quantidadeAbertas/>
				</span>
			</li>
			</sec:access>
		</ul>
		
		
		<div class="clearfix"></div>
		<!-- // Regular Size Menu END -->

		<sec:access expression="hasRole('ROLE_USER')">

		<ul class="menu-1">
			<li class="hasSubmenu active">
				<a class="glyphicons wifi_alt" href="#menu-recent-stats" data-toggle="collapse"><i></i>
					<span>Estatísticas</span>
				</a>
				<ul class="collapse in" id="menu-recent-stats">
					<li>
						<g:link action="index" controller="ocorrenciaAlarme" class="glyphicons flag">
							<i></i><span><ocorrencia:quantidadeAbertas/> Ocorrências Abertas</span>
						</g:link>						
					</li>
					<li>
						<g:link action="index" controller="ocorrenciaAlarme" class="glyphicons flag">
							<i></i><span><ocorrencia:quantidadeFechadas/> Ocorrências Fechadas</span>
						</g:link>
					</li>
				</ul>
			</li>
		</ul>
		
		</sec:access>

		<div class="clearfix"></div>
		<div class="separator bottom"></div>

	</div>
</div>
<!-- // Sidebar Menu END -->
