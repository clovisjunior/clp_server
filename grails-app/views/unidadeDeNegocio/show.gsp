
<%@ page import="com.projeto.clp.UnidadeDeNegocio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unidadeDeNegocio.label', default: 'UnidadeDeNegocio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-unidadeDeNegocio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-unidadeDeNegocio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list unidadeDeNegocio">
			
				<g:if test="${unidadeDeNegocioInstance?.departamentos}">
				<li class="fieldcontain">
					<span id="departamentos-label" class="property-label"><g:message code="unidadeDeNegocio.departamentos.label" default="Departamentos" /></span>
					
						<g:each in="${unidadeDeNegocioInstance.departamentos}" var="d">
						<span class="property-value" aria-labelledby="departamentos-label"><g:link controller="departamento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${unidadeDeNegocioInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="unidadeDeNegocio.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${unidadeDeNegocioInstance}" field="endereco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadeDeNegocioInstance?.entidade}">
				<li class="fieldcontain">
					<span id="entidade-label" class="property-label"><g:message code="unidadeDeNegocio.entidade.label" default="Entidade" /></span>
					
						<span class="property-value" aria-labelledby="entidade-label"><g:link controller="entidade" action="show" id="${unidadeDeNegocioInstance?.entidade?.id}">${unidadeDeNegocioInstance?.entidade?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${unidadeDeNegocioInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="unidadeDeNegocio.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${unidadeDeNegocioInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:unidadeDeNegocioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${unidadeDeNegocioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
