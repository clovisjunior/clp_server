
<%@ page import="com.projeto.clp.MaquinaPorta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maquinaPorta.label', default: 'MaquinaPorta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-maquinaPorta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-maquinaPorta" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list maquinaPorta">
			
				<g:if test="${maquinaPortaInstance?.apenasLeitura}">
				<li class="fieldcontain">
					<span id="apenasLeitura-label" class="property-label"><g:message code="maquinaPorta.apenasLeitura.label" default="Apenas Leitura" /></span>
					
						<span class="property-value" aria-labelledby="apenasLeitura-label"><g:formatBoolean boolean="${maquinaPortaInstance?.apenasLeitura}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${maquinaPortaInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="maquinaPorta.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${maquinaPortaInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maquinaPortaInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="maquinaPorta.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${maquinaPortaInstance}" field="endereco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maquinaPortaInstance?.identificador}">
				<li class="fieldcontain">
					<span id="identificador-label" class="property-label"><g:message code="maquinaPorta.identificador.label" default="Identificador" /></span>
					
						<span class="property-value" aria-labelledby="identificador-label"><g:fieldValue bean="${maquinaPortaInstance}" field="identificador"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${maquinaPortaInstance?.maquina}">
				<li class="fieldcontain">
					<span id="maquina-label" class="property-label"><g:message code="maquinaPorta.maquina.label" default="Maquina" /></span>
					
						<span class="property-value" aria-labelledby="maquina-label"><g:link controller="maquina" action="show" id="${maquinaPortaInstance?.maquina?.id}">${maquinaPortaInstance?.maquina?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${maquinaPortaInstance?.tipoValor}">
				<li class="fieldcontain">
					<span id="tipoValor-label" class="property-label"><g:message code="maquinaPorta.tipoValor.label" default="Tipo Valor" /></span>
					
						<span class="property-value" aria-labelledby="tipoValor-label"><g:fieldValue bean="${maquinaPortaInstance}" field="tipoValor"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:maquinaPortaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${maquinaPortaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
