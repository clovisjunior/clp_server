
<%@ page import="com.projeto.clp.Alarme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alarme.label', default: 'Alarme')}" />
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
					
						<th><g:message code="alarme.maquina.label" default="Maquina" /></th>
					
						<th><g:message code="alarme.registradorEscravo.label" default="Registrador Escravo" /></th>
					
						<th><g:message code="alarme.escravoMaquina.label" default="Escravo Maquina" /></th>
					
						<g:sortableColumn property="maximo" title="${message(code: 'alarme.maximo.label', default: 'Maximo')}" />
					
						<g:sortableColumn property="minimo" title="${message(code: 'alarme.minimo.label', default: 'Minimo')}" />
					
					
						<th class="center" colspan="1"><g:message code="default.table.edit.label" default="Editar"/></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${alarmeInstanceList}" status="i" var="alarmeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: alarmeInstance, field: "maquina")}</td>
					
						<td>${fieldValue(bean: alarmeInstance, field: "registradorEscravo")}</td>
					
						<td>${fieldValue(bean: alarmeInstance, field: "escravoMaquina")}</td>
					
						<td>${fieldValue(bean: alarmeInstance, field: "maximo")}</td>
					
						<td>${fieldValue(bean: alarmeInstance, field: "minimo")}</td>
					
						<td class="center">
							<g:link action="edit" id="${alarmeInstance.id}" class="btn-action glyphicons pencil btn-success"><i></i></g:link>

							<g:link action="show" id="${alarmeInstance.id}" class="btn-action glyphicons eye_open btn-success"><i></i></g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="separator bottom"></div>
			
			<custom:paginate total="${alarmeInstanceCount ?: 0}"/>
			
		</div>

		<g:javascript>

			$(function(){

				//Setar menu
				$(".menu-0 > li").each(function(){
					$(this).removeClass("active");
				});
				
				$(".menu-0 > li[id=menu_alarme]").addClass("active");

			});
			
		</g:javascript>

	</body>
</html>
