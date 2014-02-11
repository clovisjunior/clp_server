
<%@ page import="com.projeto.clp.Maquina" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maquina.label', default: 'Maquina')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-maquina" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-maquina" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
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
			
				<g:if test="${maquinaInstance?.departamento}">
				<li class="fieldcontain">
					<span id="departamento-label" class="property-label"><g:message code="maquina.departamento.label" default="Departamento" /></span>
					
						<span class="property-value" aria-labelledby="departamento-label"><g:link controller="departamento" action="show" id="${maquinaInstance?.departamento?.id}">${maquinaInstance?.departamento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${maquinaInstance?.portas}">
				<li class="fieldcontain">
					<span id="portas-label" class="property-label"><g:message code="maquina.portas.label" default="Portas" /></span>
					
						<g:each in="${maquinaInstance.portas}" var="p">
						<span class="property-value" aria-labelledby="portas-label"><g:link controller="maquinaPorta" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:maquinaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${maquinaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
