<%@ page import="com.projeto.clp.type.RegistradorType" %>
<%@ page import="com.projeto.clp.type.DadoType" %>

<table class="table table-bordered table-condensed table-striped table-vertical-center checkboxs js-table-sortable">
	<thead >
		<tr>
		
			<g:sortableColumn property="identificador" title="${message(code: 'registradorEscravo.identificador.label', default: 'Identificador')}" />
					
			<g:sortableColumn property="endereco" title="${message(code: 'registradorEscravo.endereco.label', default: 'Endereço')}" />
		
			<g:sortableColumn property="tipo" title="${message(code: 'registradorEscravo.tipo.label', default: 'Tipo')}" />
		
			<g:sortableColumn property="tipoDado" title="${message(code: 'registradorEscravo.tipoDado.label', default: 'Tipo Dado')}" />

			<g:sortableColumn property="isSomenteLeitura" title="${message(code: 'registradorEscravo.isSomenteLeitura.label', default: 'Somente Leitura')}" />		
		
			<th class="center" colspan="1"><g:message code="default.table.edit.label" default="Editar"/></th>
		</tr>
	</thead>
	<tbody>
	<g:each in="${escravoMaquinaInstance?.registradores}" status="i" var="registradorEscravoInstance">
		<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
		
			<td>${fieldValue(bean: registradorEscravoInstance, field: "identificador")}</td>
		
			<td>${fieldValue(bean: registradorEscravoInstance, field: "endereco")}</td>
		
			<td>${RegistradorType.get(registradorEscravoInstance?.tipo).descricao}</td>
			
			<td>${DadoType.get(registradorEscravoInstance?.tipoDado).descricao}</td>

			<td>${fieldValue(bean: registradorEscravoInstance, field: "isSomenteLeitura")}</td>
		
			<td class="center">
				<g:link action="edit" controller="registradorEscravo" id="${registradorEscravoInstance.id}" class="btn-action glyphicons pencil btn-success"><i></i></g:link>
			</td>
		</tr>
	</g:each>
	</tbody>
</table>