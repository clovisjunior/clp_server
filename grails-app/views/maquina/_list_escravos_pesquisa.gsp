<table class="table table-bordered table-condensed table-striped table-vertical-center checkboxs js-table-sortable">
	<thead >
		<tr>
		
			<g:sortableColumn property="escravoId" title="${message(code: 'escravoMaquina.escravoId.label', default: 'Escravo Id')}" />
		
			<g:sortableColumn property="identificador" title="${message(code: 'escravoMaquina.identificador.label', default: 'Identificador')}" />
		
			<g:sortableColumn property="descricao" title="${message(code: 'escravoMaquina.descricao.label', default: 'Descricao')}" />
		
			<th class="center" colspan="1"><g:message code="default.table.add.label" default="Adicionar"/></th>
		</tr>
	</thead>
	<tbody>
		<g:each in="${escravoMaquinaList}" status="i" var="escravoMaquinaInstance">
			<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
			
				<td>${fieldValue(bean: escravoMaquinaInstance, field: "escravoId")}</td>
			
				<td><g:field type="text" name="identificador${escravoMaquinaInstance?.escravoId}" value="${fieldValue(bean: escravoMaquinaInstance, field: "identificador")}" placeholder="Identificador"/></td>
			
				<td><g:field type="text" name="descricao${escravoMaquinaInstance?.escravoId}" value="${fieldValue(bean: escravoMaquinaInstance, field: "descricao")}" placeholder="Descrição"/></td>
			
				<td class="center">
					<g:link url="#" onClick="addEscravo(${escravoMaquinaInstance?.escravoId}, ${escravoMaquinaInstance?.maquina?.id});" class="btn-action glyphicons btn-success circle_plus"><i></i></g:link>
				</td>
			</tr>
		</g:each>
	</tbody>
</table>
					
