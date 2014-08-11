

<!-- Top Menu Right -->
<ul class="topnav pull-right">

	<!-- Dropdown -->
	<!--
	<li class="dropdown dd-1 visible-desktop">
		
		<a href="" data-toggle="dropdown" class="glyphicons shield"><i></i>Ajuda <span class="caret"></span></a>
		<ul class="dropdown-menu pull-right">

			<li class="dropdown submenu">
				<a href="#"	class="dropdown-toggle glyphicons bell" data-toggle="dropdown"><i></i>Level	2</a>
				<ul class="dropdown-menu submenu-show submenu-hide pull-left">
					<li class="dropdown submenu">
						<a href="#"	class="dropdown-toggle" data-toggle="dropdown">Level 2.1</a>
						<ul class="dropdown-menu submenu-show submenu-hide pull-left">
							<li><a href="#">Level 2.1.1</a></li>
							<li><a href="#">Level 2.1.2</a></li>
							<li><a href="#">Level 2.1.3</a></li>
							<li><a href="#">Level 2.1.4</a></li>
						</ul>
					</li>
					<li class="dropdown submenu">
						<a href="#"	class="dropdown-toggle" data-toggle="dropdown">Level 2.2</a>
						<ul class="dropdown-menu submenu-show submenu-hide pull-left">
							<li><a href="#">Level 2.2.1</a></li>
							<li><a href="#">Level 2.2.2</a></li>
						</ul>
					</li>
				</ul>
			</li>


			<li>
				<a href="" class="glyphicons settings"><i></i>Some option</a>
			</li>
			<li>
				<a href="" class="glyphicons bell"><i></i>Some other option</a>
			</li>
			<li>
				<a href="" class="glyphicons bell"><i></i>Other	option</a>
			</li>

		</ul>
	</li>
	-->
	<!-- // Dropdown END -->

	<!-- Profile / Logout menu -->
	<li class="account dropdown dd-1">
		<a data-toggle="dropdown" href="#" class="glyphicons logout lock">
			<span class="hidden-phone"><sec:loggedInUserInfo field="username"/></span><i></i>
		</a>
		<ul class="dropdown-menu pull-right">
			<!--
			<li>
				<a href="#" class="glyphicons cogwheel">Configurações<i></i></a>
			</li>
			
			<li class="profile">
				<span> 
					<span class="heading">Perfil
						<a href="#" class="pull-right">editar</a>
					</span> 
					<span class="img"></span> 
					<span class="detalhes"> 
						<a href="#"><sec:loggedInUserInfo field="username"/></a> 
				</span> 
				<span class="clearfix"></span>
				</span>
			</li>
			-->
			<li>
				<span> 
					<a href="#"><sec:loggedInUserInfo field="username"/></a> 
					<g:link controller="logout" class="btn btn-default btn-mini pull-right">Sair</g:link>
				</span>
			</li>
		</ul>
	</li>
	<!-- // Profile / Logout menu END -->

</ul>