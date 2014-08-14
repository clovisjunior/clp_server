<%@ page import="com.projeto.clp.DispositivoMovel" %>




<div class="control-group">
	<label class="control-label" for="descricao">
		<g:message code="dispositivoMovel.descricao.label" default="Descricao" />
	</label>
	<div class="controls">
		<g:textField name="descricao" required="" value="${dispositivoMovelInstance?.descricao}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="imei">
		<g:message code="dispositivoMovel.imei.label" default="Imei" />
	</label>
	<div class="controls">
		<g:textField name="imei" required="" value="${dispositivoMovelInstance?.imei}"/>
	</div>
</div>


<div class="control-group">
	<label class="control-label" for="departamento">
		<g:message code="dispositivoMovel.departamento.label" default="Departamento" />
	</label>
	<div class="controls">
		<g:select id="departamento" name="departamento.id" from="${departamentos}" optionKey="id" required="" value="${dispositivoMovelInstance?.departamento?.id}" class="many-to-one"/>
	</div>
</div>

