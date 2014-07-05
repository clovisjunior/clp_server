
<%@ page import="com.projeto.clp.OcorrenciaAlarme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ocorrenciaAlarme.label', default: 'OcorrenciaAlarme')}" />
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
					
						<th><g:message code="ocorrenciaAlarme.usuarioMovel.label" default="Usuario Movel" /></th>
					
						<g:sortableColumn property="motivoAlarme" title="${message(code: 'ocorrenciaAlarme.motivoAlarme.label', default: 'Motivo Alarme')}" />
					
						<g:sortableColumn property="solucaoAplicada" title="${message(code: 'ocorrenciaAlarme.solucaoAplicada.label', default: 'Solucao Aplicada')}" />
					
						<th><g:message code="ocorrenciaAlarme.estado.label" default="Estado" /></th>
					
						<th><g:message code="ocorrenciaAlarme.alarme.label" default="Alarme" /></th>
					
					
						<th class="center" colspan="1"><g:message code="default.table.edit.label" default="Editar"/></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${ocorrenciaAlarmeInstanceList}" status="i" var="ocorrenciaAlarmeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: ocorrenciaAlarmeInstance, field: "usuarioMovel")}</td>
					
						<td>${fieldValue(bean: ocorrenciaAlarmeInstance, field: "motivoAlarme")}</td>
					
						<td>${fieldValue(bean: ocorrenciaAlarmeInstance, field: "solucaoAplicada")}</td>
					
						<td>${fieldValue(bean: ocorrenciaAlarmeInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: ocorrenciaAlarmeInstance, field: "alarme")}</td>
					
						<td class="center">
							<g:link action="edit" id="${ocorrenciaAlarmeInstance.id}" class="btn-action glyphicons pencil btn-success"><i></i></g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="separator bottom"></div>
			
			<custom:paginate total="${ocorrenciaAlarmeInstanceCount ?: 0}"/>
			
		</div>
	</body>
</html>
