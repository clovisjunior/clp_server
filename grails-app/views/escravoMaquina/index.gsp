
<%@ page import="com.projeto.clp.EscravoMaquina" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'escravoMaquina.label', default: 'EscravoMaquina')}" />
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
					
						<g:sortableColumn property="escravoId" title="${message(code: 'escravoMaquina.escravoId.label', default: 'Escravo Id')}" />
					
						<g:sortableColumn property="identificador" title="${message(code: 'escravoMaquina.identificador.label', default: 'Identificador')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'escravoMaquina.descricao.label', default: 'Descricao')}" />
					
						<th><g:message code="escravoMaquina.maquina.label" default="Maquina" /></th>
					
					
						<th class="center" colspan="1"><g:message code="default.table.edit.label" default="Editar"/></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${escravoMaquinaInstanceList}" status="i" var="escravoMaquinaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: escravoMaquinaInstance, field: "escravoId")}</td>
					
						<td>${fieldValue(bean: escravoMaquinaInstance, field: "identificador")}</td>
					
						<td>${fieldValue(bean: escravoMaquinaInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: escravoMaquinaInstance, field: "maquina")}</td>
					
						<td class="center">
							<g:link action="edit" id="${escravoMaquinaInstance.id}" class="btn-action glyphicons pencil btn-success"><i></i></g:link>				

							<g:link action="show" id="${escravoMaquinaInstance.id}" class="btn-action glyphicons eye_open btn-success"><i></i></g:link>			
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="separator bottom"></div>
			
			<custom:paginate total="${escravoMaquinaInstanceCount ?: 0}"/>
			
		</div>
	</body>
</html>

