
<%@ page import="com.projeto.clp.UnidadeDeNegocio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unidadeDeNegocio.label', default: 'UnidadeDeNegocio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-unidadeDeNegocio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-unidadeDeNegocio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="endereco" title="${message(code: 'unidadeDeNegocio.endereco.label', default: 'Endereco')}" />
					
						<th><g:message code="unidadeDeNegocio.entidade.label" default="Entidade" /></th>
					
						<g:sortableColumn property="nome" title="${message(code: 'unidadeDeNegocio.nome.label', default: 'Nome')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${unidadeDeNegocioInstanceList}" status="i" var="unidadeDeNegocioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${unidadeDeNegocioInstance.id}">${fieldValue(bean: unidadeDeNegocioInstance, field: "endereco")}</g:link></td>
					
						<td>${fieldValue(bean: unidadeDeNegocioInstance, field: "entidade")}</td>
					
						<td>${fieldValue(bean: unidadeDeNegocioInstance, field: "nome")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${unidadeDeNegocioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
