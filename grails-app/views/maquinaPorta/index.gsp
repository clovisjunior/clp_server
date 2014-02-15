
<%@ page import="com.projeto.clp.MaquinaPorta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maquinaPorta.label', default: 'MaquinaPorta')}" />
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
					
						<g:sortableColumn property="apenasLeitura" title="${message(code: 'maquinaPorta.apenasLeitura.label', default: 'Apenas Leitura')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'maquinaPorta.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="endereco" title="${message(code: 'maquinaPorta.endereco.label', default: 'Endereco')}" />
					
						<g:sortableColumn property="identificador" title="${message(code: 'maquinaPorta.identificador.label', default: 'Identificador')}" />
					
						<th><g:message code="maquinaPorta.maquina.label" default="Maquina" /></th>
					
						<g:sortableColumn property="tipoValor" title="${message(code: 'maquinaPorta.tipoValor.label', default: 'Tipo Valor')}" />
					
					
						<th class="center" colspan="1"><g:message code="default.table.edit.label" default="Editar"/></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${maquinaPortaInstanceList}" status="i" var="maquinaPortaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:formatBoolean boolean="${maquinaPortaInstance.apenasLeitura}" /></td>
					
						<td>${fieldValue(bean: maquinaPortaInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: maquinaPortaInstance, field: "endereco")}</td>
					
						<td>${fieldValue(bean: maquinaPortaInstance, field: "identificador")}</td>
					
						<td>${fieldValue(bean: maquinaPortaInstance, field: "maquina")}</td>
					
						<td>${fieldValue(bean: maquinaPortaInstance, field: "tipoValor")}</td>
					
						<td class="center">
							<g:link action="edit" id="${maquinaPortaInstance.id}" class="btn-action glyphicons pencil btn-success"><i></i></g:link>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
			
			<div class="separator bottom"></div>
			
			<custom:paginate total="${maquinaPortaInstanceCount ?: 0}"/>
			
		</div>
	</body>
</html>
