<%@ page import="com.projeto.clp.DispositivoMovel" %>




<div class="control-group">
	<label class="control-label" for="descricao">
		<g:message code="dispositivoMovel.descricao.label" default="Descricao" />
	</label>
	<div class="controls">
		<g:textField name="descricao" required="" value="${dispositivoMovelInstance?.descricao}"/>
	</div>
</div>


