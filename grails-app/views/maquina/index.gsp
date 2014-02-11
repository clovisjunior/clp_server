
<%@ page import="com.projeto.clp.Maquina" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maquina.label', default: 'Maquina')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-maquina" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-maquina" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="localizacaoFisica" title="${message(code: 'maquina.localizacaoFisica.label', default: 'Localizacao Fisica')}" />
					
						<g:sortableColumn property="ip" title="${message(code: 'maquina.ip.label', default: 'Ip')}" />
					
						<g:sortableColumn property="modelo" title="${message(code: 'maquina.modelo.label', default: 'Modelo')}" />
					
						<g:sortableColumn property="identificador" title="${message(code: 'maquina.identificador.label', default: 'Identificador')}" />
					
						<th><g:message code="maquina.departamento.label" default="Departamento" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${maquinaInstanceList}" status="i" var="maquinaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${maquinaInstance.id}">${fieldValue(bean: maquinaInstance, field: "localizacaoFisica")}</g:link></td>
					
						<td>${fieldValue(bean: maquinaInstance, field: "ip")}</td>
					
						<td>${fieldValue(bean: maquinaInstance, field: "modelo")}</td>
					
						<td>${fieldValue(bean: maquinaInstance, field: "identificador")}</td>
					
						<td>${fieldValue(bean: maquinaInstance, field: "departamento")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${maquinaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
