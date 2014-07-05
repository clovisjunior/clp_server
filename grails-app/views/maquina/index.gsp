
<%@ page import="com.projeto.clp.Maquina" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maquina.label', default: 'Maquina')}" />
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
					
						<g:sortableColumn property="localizacaoFisica" title="${message(code: 'maquina.localizacaoFisica.label', default: 'Localizacao Fisica')}" />
					
						<g:sortableColumn property="ip" title="${message(code: 'maquina.ip.label', default: 'Ip')}" />
					
						<g:sortableColumn property="isEncapsulado" title="${message(code: 'maquina.isEncapsulado.label', default: 'Is Encapsulado')}" />
					
						<g:sortableColumn property="modelo" title="${message(code: 'maquina.modelo.label', default: 'Modelo')}" />
					
						<g:sortableColumn property="identificador" title="${message(code: 'maquina.identificador.label', default: 'Identificador')}" />
					
						<g:sortableColumn property="porta" title="${message(code: 'maquina.porta.label', default: 'Porta')}" />
					
					
						<th class="center" colspan="1"><g:message code="default.table.action.label" default="Ações"/></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${maquinaInstanceList}" status="i" var="maquinaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: maquinaInstance, field: "localizacaoFisica")}</td>
					
						<td>${fieldValue(bean: maquinaInstance, field: "ip")}</td>
					
						<td><g:formatBoolean boolean="${maquinaInstance.isEncapsulado}" /></td>
					
						<td>${fieldValue(bean: maquinaInstance, field: "modelo")}</td>
					
						<td>${fieldValue(bean: maquinaInstance, field: "identificador")}</td>
					
						<td>${fieldValue(bean: maquinaInstance, field: "porta")}</td>
					
						<td class="center">
							<g:link action="edit" id="${maquinaInstance.id}" class="btn-action glyphicons pencil btn-success"><i></i></g:link>
							<g:link action="show" id="${maquinaInstance.id}" class="btn-action glyphicons eye_open btn-success"><i></i></g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="separator bottom"></div>
			
			<custom:paginate total="${maquinaInstanceCount ?: 0}"/>
			
		</div>
	</body>
</html>
