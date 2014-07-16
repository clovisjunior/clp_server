<%@ page import="com.projeto.clp.DiarioBordo" %>




<div class="control-group">
	<label class="control-label" for="dataHora">
		<g:message code="diarioBordo.dataHora.label" default="Data Hora" />
	</label>
	<div class="controls">
		<g:datePicker name="dataHora" precision="day"  value="${diarioBordoInstance?.dataHora}"  />
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="descricao">
		<g:message code="diarioBordo.descricao.label" default="Descricao" />
	</label>
	<div class="controls">
		<g:textField name="descricao" value="${diarioBordoInstance?.descricao}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="fotos">
		<g:message code="diarioBordo.fotos.label" default="Fotos" />
	</label>
	<div class="controls">
		<g:each in="${diarioBordoInstance?.fotos}" var="foto">
			<img src="${createLink(controller:'diarioBordo', action:'viewImage', id: foto.id)}" width="400"  height="400" />
		</g:each>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="maquina">
		<g:message code="diarioBordo.maquina.label" default="Maquina" />
	</label>
	<div class="controls">
		<g:select id="maquina" name="maquina.id" from="${com.projeto.clp.Maquina.list()}" optionKey="id" required="" value="${diarioBordoInstance?.maquina?.id}" class="many-to-one"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="usuarioMovel">
		<g:message code="diarioBordo.usuarioMovel.label" default="Usuario Movel" />
	</label>
	<div class="controls">
		<g:select id="usuarioMovel" name="usuarioMovel.id" from="${com.projeto.clp.UsuarioMovel.list()}" optionKey="id" required="" value="${diarioBordoInstance?.usuarioMovel?.id}" class="many-to-one"/>
	</div>
</div>


