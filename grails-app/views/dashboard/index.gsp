<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Dashboard</title>
	</head>
	<body>

		<div class="heading-buttons">
			<h2>Dashboard</h2>
	
			<div class="buttons pull-right">
                
			</div>
			<div class="clearfix"></div>
		</div>
	
		<div class="innerLR">
	
			<div class="row-fluid">
				<div class="span6">
   
   					<sec:access expression="hasRole('ROLE_USER')">
				    <div class="widget">
				    	<g:render template="quantidade_maquina_unidade_negocio" model="[maquinasUnidadeNegocio: maquinasUnidadeNegocioList]"/>
				    </div>
				    
				    <div class="widget">
				    	<g:render template="quantidade_usuario_movel_unidade_negocio" model="[usuariosMoveisUnidadeNegocio: usuariosMoveisUnidadeNegocioList]"/>
                    </div>			
                    </sec:access>

                    <sec:access expression="hasRole('ROLE_ADMIN')">
				    <div class="widget">
				    	<g:render template="quantidade_maquina_entidade" model="[maquinasEntidadeList: maquinasEntidadeList]"/>
				    </div>
				    
				    <div class="widget">
				    	<g:render template="quantidade_usuario_movel_entidade" model="[usuariosMoveisEntidadeNegocioList: usuariosMoveisEntidadeNegocioList]"/>
                    </div>			
                    </sec:access>

					
				</div>
				<div class="span6">
				  
					<sec:access expression="hasRole('ROLE_USER')">
				    <div class="widget">
				    	<g:render template="ocorrencias_abertas" model="[ocorrenciasAbertas: ocorrenciasAbertasList]"/>
				    </div>
				    
				    <div class="widget">
				    	<g:render template="ocorrencias_fechadas" model="[ocorrenciasFechadas: ocorrenciasFechadasList]"/>
                    </div>
                    </sec:access>

                    <sec:access expression="hasRole('ROLE_ADMIN')">
				    <div class="widget">
				    	<g:render template="ocorrencias_abertas_entidade" model="[ocorrenciasAbertas: ocorrenciasAbertasList]"/>
				    </div>
				    
				    <div class="widget">
				    	<g:render template="ocorrencias_fechadas_entidade" model="[ocorrenciasFechadas: ocorrenciasFechadasList]"/>
                    </div>
                    </sec:access>
					
				</div>
			</div>
		</div>

		<g:javascript>

			$(function(){

				//Setar menu
				$(".menu-0 > li").each(function(){
					$(this).removeClass("active");
				});
				
				$(".menu-0 > li[id=menu_dashboard]").addClass("active");

			});
			
		</g:javascript>

	</body>
</html>
