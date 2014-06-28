<table class="table table-bordered table-condensed table-striped table-vertical-center checkboxs js-table-sortable">
	<thead >
		<tr>
			<g:sortableColumn property="escravoId" title="${message(code: 'escravoMaquina.escravoId.label', default: 'Escravo Id')}" />
		
			<g:sortableColumn property="identificador" title="${message(code: 'escravoMaquina.identificador.label', default: 'Identificador')}" />
		
			<g:sortableColumn property="descricao" title="${message(code: 'escravoMaquina.descricao.label', default: 'Descricao')}" />
		
			<th class="center" colspan="1"><g:message code="default.table.show.label" default="Mostrar"/></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${escravos}" status="i" var="escravoMaquinaInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			
				<td>${fieldValue(bean: escravoMaquinaInstance, field: "escravoId")}</td>
			
				<td>${fieldValue(bean: escravoMaquinaInstance, field: "identificador")}</td>
			
				<td>${fieldValue(bean: escravoMaquinaInstance, field: "descricao")}</td>
			
				<td class="center">
					<g:link controller="escravoMaquina" action="show" id="${escravoMaquinaInstance.id}" class="btn-action glyphicons eye_open btn-success"><i></i></g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
