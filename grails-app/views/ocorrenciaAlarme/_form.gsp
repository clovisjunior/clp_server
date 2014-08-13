<%@ page import="com.projeto.clp.OcorrenciaAlarme" %>




<div class="control-group">
	<label class="control-label" for="usuarioMovel">
		<g:message code="ocorrenciaAlarme.usuarioMovel.label" default="Usuario Movel" />
	</label>
	<div class="controls">
		<g:select id="usuarioMovel" name="usuarioMovel.id" from="${com.projeto.clp.UsuarioMovel.list()}" optionKey="id" value="${ocorrenciaAlarmeInstance?.usuarioMovel?.id}" class="many-to-one" noSelection="['null': '']"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="motivoAlarme">
		<g:message code="ocorrenciaAlarme.motivoAlarme.label" default="Motivo Alarme" />
	</label>
	<div class="controls">
		<g:textField name="motivoAlarme" required="" value="${ocorrenciaAlarmeInstance?.motivoAlarme}"/>
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="motivoAlarmeTecnico">
		<g:message code="ocorrenciaAlarme.motivoAlarmeTecnico.label" default="Motivo Alarme Técnico" />
	</label>
	<div class="controls">
		<g:textField name="motivoAlarmeTecnico" required="" value="${ocorrenciaAlarmeInstance?.motivoAlarmeTecnico}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="solucaoAplicada">
		<g:message code="ocorrenciaAlarme.solucaoAplicada.label" default="Solucao Aplicada" />
	</label>
	<div class="controls">
		<g:textField name="solucaoAplicada" value="${ocorrenciaAlarmeInstance?.solucaoAplicada}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="estado">
		<g:message code="ocorrenciaAlarme.estado.label" default="Estado" />
	</label>
	<div class="controls">
		<g:select id="estado" name="estado.id" from="${com.projeto.clp.type.EstadoOcorrenciaType.list()}" optionKey="id" required="" value="${ocorrenciaAlarmeInstance?.estado?.id}" class="many-to-one"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="alarme">
		<g:message code="ocorrenciaAlarme.alarme.label" default="Alarme" />
	</label>
	<div class="controls">
		<g:select id="alarme" name="alarme.id" from="${com.projeto.clp.Alarme.list()}" optionKey="id" required="" value="${ocorrenciaAlarmeInstance?.alarme?.id}" class="many-to-one"/>
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="dataAbertura">
		<g:message code="ocorrenciaAlarme.dataAbertura.label" default="Data Abertura" />
	</label>
	<div class="controls">
		<g:datePicker name="dataAbertura" readonly="readonly" value="${ocorrenciaAlarmeInstance?.dataAbertura}"  />
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="dataFechamento">
		<g:message code="ocorrenciaAlarme.dataFechamento.label" default="Data Fechamento" />
	</label>
	<div class="controls">
		<g:datePicker name="dataFechamento" disabled="disabled" value="${ocorrenciaAlarmeInstance?.dataFechamento}"  />
	</div>
</div>


<div class="control-group">
	<label class="control-label" for="fotos">
		<g:message code="ocorrenciaAlarme.fotos.label" default="Fotos" />
	</label>
	<div class="controls">
		<g:each in="${ocorrenciaAlarmeInstance?.fotos}" var="foto">
			<img src="${createLink(controller:'ocorrenciaAlarme', action:'viewImage', id: foto.id)}" width="400"  height="400" />
		</g:each>
	</div>
</div>




