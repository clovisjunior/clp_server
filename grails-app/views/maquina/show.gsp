
<%@ page import="com.projeto.clp.Maquina" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maquina.label', default: 'Maquina')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<g:javascript>
			function showSpinner() {
			   $('#spinner').show(); 
			   $("#list_escravos_pesquisa").slideUp();
				
			}
			
			function hideSpinner() {
			   $('#spinner').hide();
			   $("#list_escravos_pesquisa").slideDown();
			}
			
			function addEscravo(id, maquina) {
				var identificador = document.getElementById('identificador' + id).value;
				var descricao = document.getElementById('descricao' + id).value;
				
				<g:remoteFunction action="addEscravoMaquina" update="teste_conexao" 
								  controller="maquina"
								  id="\' + maquina + \'"
								  params="\'dados=\' + id + \'|\' + identificador + \'|\' + descricao"
								  onComplete="loadEscravos(maquina)"/>
				
				return false;
			}
			
			function loadEscravos(maquina) {
				<g:remoteFunction action="listarEscravos" update="list_escravos" 
								  controller="maquina"
								  id="\' + maquina + \'"
								  onComplete="showEscravosTab();"/>
			}
			
			function showEscravosTab(){
				$('#tabs a:first').tab('show');
				$('#tabs').focus();
			}
			
		</g:javascript>
	</head>
	<body>
	
		<div class="heading-buttons">
			<h2>${entityName}</h2>
			
			<div class="buttons pull-right">
				<g:link action="index" class="btn btn-default btn-icon glyphicons circle_arrow_left">
					<i></i>	<g:message code="default.list.label" default="Listagem"/>
				</g:link>
			</div>
			<div class="clearfix"></div>
		</div>
		
		<div class="separator bottom"></div>
		
		<div class="innerLR">
			<!-- Mensagem -->
			<g:if test="${flash.message}">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong><g:message default="Atenção !" code="alert.warning"/></strong> ${flash.message}
				</div>
			</g:if>
			<!-- //END Mensagem -->
			
			<!-- Widget -->
			<div class="widget">
				<!-- Widget heading -->
				<div class="widget-head">
					<h4 class="heading"><g:message code="default.show.head.label"/></h4>
				</div>
				<!-- // Widget heading END -->
		
				<div class="widget-body">
				
					<!-- Row -->
					<div class="row-fluid">
						<ol class="property-list maquina">
						
							<g:if test="${maquinaInstance?.localizacaoFisica}">
							<li class="fieldcontain">
								<span id="localizacaoFisica-label" class="property-label"><g:message code="maquina.localizacaoFisica.label" default="Localizacao Fisica" /></span>
								
									<span class="property-value" aria-labelledby="localizacaoFisica-label"><g:fieldValue bean="${maquinaInstance}" field="localizacaoFisica"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaInstance?.ip}">
							<li class="fieldcontain">
								<span id="ip-label" class="property-label"><g:message code="maquina.ip.label" default="Ip" /></span>
								
									<span class="property-value" aria-labelledby="ip-label"><g:fieldValue bean="${maquinaInstance}" field="ip"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaInstance?.isEncapsulado}">
							<li class="fieldcontain">
								<span id="isEncapsulado-label" class="property-label"><g:message code="maquina.isEncapsulado.label" default="Is Encapsulado" /></span>
								
									<span class="property-value" aria-labelledby="isEncapsulado-label"><g:formatBoolean boolean="${maquinaInstance?.isEncapsulado}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaInstance?.modelo}">
							<li class="fieldcontain">
								<span id="modelo-label" class="property-label"><g:message code="maquina.modelo.label" default="Modelo" /></span>
								
									<span class="property-value" aria-labelledby="modelo-label"><g:fieldValue bean="${maquinaInstance}" field="modelo"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaInstance?.identificador}">
							<li class="fieldcontain">
								<span id="identificador-label" class="property-label"><g:message code="maquina.identificador.label" default="Identificador" /></span>
								
									<span class="property-value" aria-labelledby="identificador-label"><g:fieldValue bean="${maquinaInstance}" field="identificador"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaInstance?.porta}">
							<li class="fieldcontain">
								<span id="porta-label" class="property-label"><g:message code="maquina.porta.label" default="Porta" /></span>
								
									<span class="property-value" aria-labelledby="porta-label"><g:fieldValue bean="${maquinaInstance}" field="porta"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaInstance?.departamento}">
							<li class="fieldcontain">
								<span id="departamento-label" class="property-label"><g:message code="maquina.departamento.label" default="Departamento" /></span>
								
									<span class="property-value" aria-labelledby="departamento-label"><g:link controller="departamento" action="show" id="${maquinaInstance?.departamento?.id}">${maquinaInstance?.departamento?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:maquinaInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-primary btn-icon glyphicons circle_plus" action="create"><i></i> <g:message code="default.add.label" default="Adicionar" args="[entityName]"/></g:link>
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${maquinaInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
								
								<g:remoteLink action="testeConexao" class="btn btn-icon btn-default glyphicons link" id="${maquinaInstance.id}" update="[success:'teste_conexao']">
									<i></i><g:message code="default.button.testar.conexao.label" default="Testar Conexão"/>
								</g:remoteLink>
								<span id="teste_conexao"></span>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
			
			<div class="widget widget-tabs widget-tabs-double-2">
				<div class="widget-head">
					<ul id="tabs">
						<li class="active"><a class="glyphicons list" href="#tabEscravos" data-toggle="tab"><i></i><span>Escravos</span></a></li>
						<li><a class="glyphicons search" href="#tabPesquisar" data-toggle="tab"><i></i><span>Pesquisar</span></a></li>
					</ul>
				</div>
				<div class="widget-body">
					<div class="tab-content">
						<div id="tabEscravos" class="tab-pane active widget-body-regular">
						
							<div id="list_escravos">
							
								<g:render template="list_escravos" model="[escravos: maquinaInstance?.escravos]"></g:render>
							
								<hr class="separator" />
					
								<!-- Form actions -->
								<div class="form-actions">
									<g:link class="btn btn-primary btn-icon glyphicons circle_plus" action="create" controller="escravoMaquina" params="['maquina.id': maquinaInstance.id]">
										<i></i> <g:message code="default.add.label" default="Adicionar" args="['Escravo']"/>
									</g:link>
								</div>
							</div>
							
						</div>
						
						<div id="tabPesquisar" class="tab-pane widget-body-regular">
						
							<g:remoteLink action="listarEscravosPesquisa" class="btn btn-icon btn-default glyphicons search" id="${maquinaInstance.id}" 
										  update="[success:'list_escravos_pesquisa']" onLoading="showSpinner();" onLoaded="hideSpinner();">
								<i></i><g:message code="default.button.testar.conexao.label" default="Pesquisar Escravos"/>
							</g:remoteLink>
							
							<hr class="separator" />
							
							<div id="list_escravos_pesquisa"></div>
							
							<div id="spinner" style="display: none;">
							   <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Pesquisando ..." width="16" height="16" />
							</div>
							
						</div>
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>
