
<%@ page import="com.projeto.clp.DiarioBordo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'diarioBordo.label', default: 'DiarioBordo')}" />
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
					
						<g:sortableColumn property="dataHora" title="${message(code: 'diarioBordo.dataHora.label', default: 'Data Hora')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'diarioBordo.descricao.label', default: 'Descricao')}" />
					
						<th><g:message code="diarioBordo.maquina.label" default="Maquina" /></th>
					
						<th><g:message code="diarioBordo.usuarioMovel.label" default="Usuario Movel" /></th>
					
					
						<th class="center" colspan="1"><g:message code="default.table.edit.label" default="Editar"/></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${diarioBordoInstanceList}" status="i" var="diarioBordoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:formatDate date="${diarioBordoInstance.dataHora}" /></td>
					
						<td>${fieldValue(bean: diarioBordoInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: diarioBordoInstance, field: "maquina")}</td>
					
						<td>${fieldValue(bean: diarioBordoInstance, field: "usuarioMovel")}</td>
					
						<td class="center">
							<g:link action="edit" id="${diarioBordoInstance.id}" class="btn-action glyphicons pencil btn-success"><i></i></g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="separator bottom"></div>
			
			<custom:paginate total="${diarioBordoInstanceCount ?: 0}"/>
			
		</div>
	</body>
</html>
