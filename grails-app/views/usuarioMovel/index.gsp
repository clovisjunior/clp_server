
<%@ page import="com.projeto.clp.UsuarioMovel" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuarioMovel.label', default: 'UsuarioMovel')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-usuarioMovel" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-usuarioMovel" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="usuario" title="${message(code: 'usuarioMovel.usuario.label', default: 'Usuario')}" />
					
						<g:sortableColumn property="senha" title="${message(code: 'usuarioMovel.senha.label', default: 'Senha')}" />
					
						<th><g:message code="usuarioMovel.departamento.label" default="Departamento" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioMovelInstanceList}" status="i" var="usuarioMovelInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usuarioMovelInstance.id}">${fieldValue(bean: usuarioMovelInstance, field: "usuario")}</g:link></td>
					
						<td>${fieldValue(bean: usuarioMovelInstance, field: "senha")}</td>
					
						<td>${fieldValue(bean: usuarioMovelInstance, field: "departamento")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioMovelInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
