
<%@ page import="com.projeto.clp.RegistradorEscravo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registradorEscravo.label', default: 'RegistradorEscravo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<div class="heading-buttons">
			<h2>${entityName}</h2>
			
			<div class="buttons pull-right">
				<g:link action="create" class="btn btn-primary btn-icon glyphicons circle_plus">
					<i></i>	<g:message code="default.add.label" default="Adicionar" args="[entityName]"/>
				</g:link>
			</div>
			<div class="clearfix"></div>
		</div>
		
		<div class="separator bottom"></div>
		
		<div class="innerLR">
		
			<!-- Mensagem -->
			<g:if test="${flash.message}">
				<div class="alert ${flash.messageTypeClass}">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong><g:message default="Atenção !" code="alert.warning"/></strong> ${flash.message}
				</div>
			</g:if>
			<!-- //END Mensagem -->
			
			<table class="table table-bordered table-condensed table-striped table-vertical-center checkboxs js-table-sortable">
				<thead >
					<tr>
					
						<g:sortableColumn property="endereco" title="${message(code: 'registradorEscravo.endereco.label', default: 'Endereco')}" />
					
						<th><g:message code="registradorEscravo.escravoMaquina.label" default="Escravo Maquina" /></th>
					
						<g:sortableColumn property="tipo" title="${message(code: 'registradorEscravo.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="tipoDado" title="${message(code: 'registradorEscravo.tipoDado.label', default: 'Tipo Dado')}" />
					
					
						<th class="center" colspan="1"><g:message code="default.table.edit.label" default="Editar"/></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${registradorEscravoInstanceList}" status="i" var="registradorEscravoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: registradorEscravoInstance, field: "endereco")}</td>
					
						<td>${fieldValue(bean: registradorEscravoInstance, field: "escravoMaquina")}</td>
					
						<td>${fieldValue(bean: registradorEscravoInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: registradorEscravoInstance, field: "tipoDado")}</td>
					
						<td class="center">
							<g:link action="edit" id="${registradorEscravoInstance.id}" class="btn-action glyphicons pencil btn-success"><i></i></g:link>

							<g:link action="show" id="${registradorEscravoInstance.id}" class="btn-action glyphicons eye_open btn-success"><i></i></g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="separator bottom"></div>
			
			<custom:paginate total="${registradorEscravoInstanceCount ?: 0}"/>
			
		</div>
	</body>
</html>
