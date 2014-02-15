<%@ page import="com.projeto.clp.MaquinaPorta" %>




<div class="control-group">
	<label class="control-label" for="apenasLeitura">
		<g:message code="maquinaPorta.apenasLeitura.label" default="Apenas Leitura" />
	</label>
	<div class="controls">
		<g:checkBox name="apenasLeitura" value="${maquinaPortaInstance?.apenasLeitura}" />
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="descricao">
		<g:message code="maquinaPorta.descricao.label" default="Descricao" />
	</label>
	<div class="controls">
		<g:textField name="descricao" value="${maquinaPortaInstance?.descricao}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="endereco">
		<g:message code="maquinaPorta.endereco.label" default="Endereco" />
	</label>
	<div class="controls">
		<g:field name="endereco" type="number" value="${maquinaPortaInstance.endereco}" required=""/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="identificador">
		<g:message code="maquinaPorta.identificador.label" default="Identificador" />
	</label>
	<div class="controls">
		<g:textField name="identificador" value="${maquinaPortaInstance?.identificador}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="maquina">
		<g:message code="maquinaPorta.maquina.label" default="Maquina" />
	</label>
	<div class="controls">
		<g:select id="maquina" name="maquina.id" from="${com.projeto.clp.Maquina.list()}" optionKey="id" required="" value="${maquinaPortaInstance?.maquina?.id}" class="many-to-one"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="tipoValor">
		<g:message code="maquinaPorta.tipoValor.label" default="Tipo Valor" />
	</label>
	<div class="controls">
		<g:textField name="tipoValor" value="${maquinaPortaInstance?.tipoValor}"/>
	</div>
</div>


