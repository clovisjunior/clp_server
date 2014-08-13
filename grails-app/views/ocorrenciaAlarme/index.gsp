
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
											
					
						<th><g:message code="ocorrenciaAlarme.estado.label" default="Estado" /></th>
					
						<th><g:message code="ocorrenciaAlarme.alarme.label" default="Alarme" /></th>
					
					
						<th class="center" colspan="1"></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${ocorrenciaAlarmeInstanceList}" status="i" var="ocorrenciaAlarmeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: ocorrenciaAlarmeInstance, field: "usuarioMovel")}</td>
					
						<td>${fieldValue(bean: ocorrenciaAlarmeInstance, field: "motivoAlarme")}</td>
									
					
						<td>${fieldValue(bean: ocorrenciaAlarmeInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: ocorrenciaAlarmeInstance, field: "alarme")}</td>
					
						<td class="center">
							<g:link action="edit" id="${ocorrenciaAlarmeInstance.id}" class="btn-action glyphicons pencil btn-success"><i></i></g:link>

							<g:link action="show" id="${ocorrenciaAlarmeInstance.id}" class="btn-action glyphicons eye_open btn-success"><i></i></g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="separator bottom"></div>
			
			<custom:paginate total="${ocorrenciaAlarmeInstanceCount ?: 0}"/>
			
		</div>

		<g:javascript>

			$(function(){

				//Setar menu
				$(".menu-0 > li").each(function(){
					$(this).removeClass("active");
				});
				
				$(".menu-0 > li[id=menu_ocorrencia]").addClass("active");

			});
			
		</g:javascript>

	</body>
</html>
