
											  
<table class="table table-bordered table-condensed table-striped table-vertical-center checkboxs js-table-sortable">
	<thead >
		<tr>
			<g:sortableColumn property="registrador" title="${message(code: 'registradorEscravo.label', default: 'Registrador')}" />
		
			<g:sortableColumn property="resultado" title="${message(code: 'escravo.registrador.resultado.label', default: 'Resultado')}" />
		
		</tr>
	</thead>
	<tbody>
		<tr class="'odd'">
			<td>${registrador}</td>
			<td>${resultado}</td>
		</tr>
	</tbody>
</table>

<g:formRemote name="registradorResultadoForm" 
		 	  update="list_registradores"
			  url="[controller: 'escravoMaquina', action:'adicionarRegistrador']"  
			  class="form-horizontal" style="margin-bottom: 0;">
	
	<g:hiddenField name="escravoMaquina.id" value="${registrador?.escravoMaquina?.id}"/>
	<g:hiddenField name="identificador" value="${registrador?.identificador}"/>
	<g:hiddenField name="tipo" value="${registrador.tipo}"/>
	<g:hiddenField name="tipoDado" value="${registrador.tipoDado}"/>
	<g:hiddenField name="endereco" value="${registrador.endereco}"/>
	
	<hr class="separator" />
								
	<button type="submit" class="btn btn-primary btn-icon glyphicons circle_plus"><i></i><g:message code="default.add.label" default="Adicionar" args="['Registrador']"/></button>
	
</g:formRemote>
