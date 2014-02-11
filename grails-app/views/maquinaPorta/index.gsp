
<%@ page import="com.projeto.clp.MaquinaPorta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maquinaPorta.label', default: 'MaquinaPorta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-maquinaPorta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-maquinaPorta" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="apenasLeitura" title="${message(code: 'maquinaPorta.apenasLeitura.label', default: 'Apenas Leitura')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'maquinaPorta.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="endereco" title="${message(code: 'maquinaPorta.endereco.label', default: 'Endereco')}" />
					
						<g:sortableColumn property="identificador" title="${message(code: 'maquinaPorta.identificador.label', default: 'Identificador')}" />
					
						<th><g:message code="maquinaPorta.maquina.label" default="Maquina" /></th>
					
						<g:sortableColumn property="tipoValor" title="${message(code: 'maquinaPorta.tipoValor.label', default: 'Tipo Valor')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${maquinaPortaInstanceList}" status="i" var="maquinaPortaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${maquinaPortaInstance.id}">${fieldValue(bean: maquinaPortaInstance, field: "apenasLeitura")}</g:link></td>
					
						<td>${fieldValue(bean: maquinaPortaInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: maquinaPortaInstance, field: "endereco")}</td>
					
						<td>${fieldValue(bean: maquinaPortaInstance, field: "identificador")}</td>
					
						<td>${fieldValue(bean: maquinaPortaInstance, field: "maquina")}</td>
					
						<td>${fieldValue(bean: maquinaPortaInstance, field: "tipoValor")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${maquinaPortaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
