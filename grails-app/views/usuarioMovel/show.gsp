
<%@ page import="com.projeto.clp.UsuarioMovel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuarioMovel.label', default: 'UsuarioMovel')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
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
						<ol class="property-list usuarioMovel">
						
							<g:if test="${usuarioMovelInstance?.usuario}">
							<li class="fieldcontain">
								<span id="usuario-label" class="property-label"><g:message code="usuarioMovel.usuario.label" default="Usuario" /></span>
								
									<span class="property-value" aria-labelledby="usuario-label"><g:fieldValue bean="${usuarioMovelInstance}" field="usuario"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${usuarioMovelInstance?.senha}">
							<li class="fieldcontain">
								<span id="senha-label" class="property-label"><g:message code="usuarioMovel.senha.label" default="Senha" /></span>
								
									<span class="property-value" aria-labelledby="senha-label"><g:fieldValue bean="${usuarioMovelInstance}" field="senha"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${usuarioMovelInstance?.departamento}">
							<li class="fieldcontain">
								<span id="departamento-label" class="property-label"><g:message code="usuarioMovel.departamento.label" default="Departamento" /></span>
								
									<span class="property-value" aria-labelledby="departamento-label"><g:link controller="departamento" action="show" id="${usuarioMovelInstance?.departamento?.id}">${usuarioMovelInstance?.departamento?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${usuarioMovelInstance?.dispositivosMoveis}">
							<li class="fieldcontain">
								<span id="dispositivosMoveis-label" class="property-label"><g:message code="usuarioMovel.dispositivosMoveis.label" default="Dispositivos Moveis" /></span>
								
									<g:each in="${usuarioMovelInstance.dispositivosMoveis}" var="d">
									<span class="property-value" aria-labelledby="dispositivosMoveis-label"><g:link controller="dispositivoMovel" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${usuarioMovelInstance?.maquinas}">
							<li class="fieldcontain">
								<span id="maquinas-label" class="property-label"><g:message code="usuarioMovel.maquinas.label" default="Maquinas" /></span>
								
									<g:each in="${usuarioMovelInstance.maquinas}" var="m">
									<span class="property-value" aria-labelledby="maquinas-label"><g:link controller="maquina" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:usuarioMovelInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-primary btn-icon glyphicons circle_plus" action="create"><i></i> <g:message code="default.add.label" default="Adicionar" args="[entityName]"/></g:link>
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${usuarioMovelInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>
