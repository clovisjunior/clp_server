
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
					
						<g:sortableColumn property="username" title="${message(code: 'entidade.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'entidade.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="nome" title="${message(code: 'entidade.nome.label', default: 'Nome')}" />
					
						<th class="center" colspan="1"><g:message code="default.table.edit.label" default="Editar"/></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${entidadeInstanceList}" status="i" var="entidadeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: entidadeInstance, field: "username")}</td>
					
						<td>${fieldValue(bean: entidadeInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: entidadeInstance, field: "nome")}</td>
					
						<td class="center">
							<g:link action="edit" id="${entidadeInstance.id}" class="btn-action glyphicons pencil btn-success"><i></i></g:link>

							<g:link action="show" id="${entidadeInstance.id}" class="btn-action glyphicons eye_open btn-success"><i></i></g:link>
							
						</td>

					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="separator bottom"></div>
			
			<custom:paginate total="${entidadeInstanceCount ?: 0}"/>
			
		</div>

		<g:javascript>

			$(function(){

				//Setar menu
				$(".menu-0 > li").each(function(){
					$(this).removeClass("active");
				});
								

			});

		</g:javascript>

	</body>
</html>
