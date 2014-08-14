
<%@ page import="com.projeto.clp.Departamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'departamento.label', default: 'Departamento')}" />
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
					
						<g:sortableColumn property="nome" title="${message(code: 'departamento.nome.label', default: 'Nome')}" />
					
						<th><g:message code="departamento.unidadeNegocio.label" default="Unidade Negocio" /></th>
					
					
						<th class="center" colspan="1"></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${departamentoInstanceList}" status="i" var="departamentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: departamentoInstance, field: "nome")}</td>
					
						<td>${fieldValue(bean: departamentoInstance, field: "unidadeNegocio")}</td>
					
						<td class="center">
							<g:link action="edit" id="${departamentoInstance.id}" class="btn-action glyphicons pencil btn-success" alt="Editar"><i></i></g:link>

							<g:link action="show" id="${departamentoInstance.id}" class="btn-action glyphicons eye_open btn-success" alt="Visualizar"><i></i></g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="separator bottom"></div>
			
			<custom:paginate total="${departamentoInstanceCount ?: 0}"/>
			
		</div>

		<g:javascript>

			$(function(){

				//Setar menu
				$(".menu-0 > li").each(function(){
					$(this).removeClass("active");
				});
				
				$(".menu-0 > li[id=menu_cadastros]").addClass("active");

			});
			
		</g:javascript>
	</body>
</html>
