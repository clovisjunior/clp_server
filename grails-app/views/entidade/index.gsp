
<%@ page import="com.projeto.clp.Entidade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entidade.label', default: 'Entidade')}" />
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
					
						<g:sortableColumn property="nome" title="${message(code: 'entidade.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="usuario" title="${message(code: 'entidade.usuario.label', default: 'Usuario')}" />
					
						<g:sortableColumn property="senha" title="${message(code: 'entidade.senha.label', default: 'Senha')}" />
					
					
						<th class="center" colspan="1"><g:message code="default.table.edit.label" default="Editar"/></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${entidadeInstanceList}" status="i" var="entidadeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: entidadeInstance, field: "nome")}</td>
					
						<td>${fieldValue(bean: entidadeInstance, field: "usuario")}</td>
					
						<td>${fieldValue(bean: entidadeInstance, field: "senha")}</td>
					
						<td class="center">
							<g:link action="edit" id="${entidadeInstance.id}" class="btn-action glyphicons pencil btn-success"><i></i></g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="separator bottom"></div>
			
			<custom:paginate total="${entidadeInstanceCount ?: 0}"/>
			
		</div>
	</body>
</html>
