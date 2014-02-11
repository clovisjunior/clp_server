<%@ page import="com.projeto.clp.MaquinaPorta" %>



<div class="fieldcontain ${hasErrors(bean: maquinaPortaInstance, field: 'apenasLeitura', 'error')} ">
	<label for="apenasLeitura">
		<g:message code="maquinaPorta.apenasLeitura.label" default="Apenas Leitura" />
		
	</label>
	<g:checkBox name="apenasLeitura" value="${maquinaPortaInstance?.apenasLeitura}" />
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaPortaInstance, field: 'descricao', 'error')} ">
	<label for="descricao">
		<g:message code="maquinaPorta.descricao.label" default="Descricao" />
		
	</label>
	<g:textField name="descricao" value="${maquinaPortaInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaPortaInstance, field: 'endereco', 'error')} required">
	<label for="endereco">
		<g:message code="maquinaPorta.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="endereco" type="number" value="${maquinaPortaInstance.endereco}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaPortaInstance, field: 'identificador', 'error')} ">
	<label for="identificador">
		<g:message code="maquinaPorta.identificador.label" default="Identificador" />
		
	</label>
	<g:textField name="identificador" value="${maquinaPortaInstance?.identificador}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaPortaInstance, field: 'maquina', 'error')} required">
	<label for="maquina">
		<g:message code="maquinaPorta.maquina.label" default="Maquina" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="maquina" name="maquina.id" from="${com.projeto.clp.Maquina.list()}" optionKey="id" required="" value="${maquinaPortaInstance?.maquina?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaPortaInstance, field: 'tipoValor', 'error')} ">
	<label for="tipoValor">
		<g:message code="maquinaPorta.tipoValor.label" default="Tipo Valor" />
		
	</label>
	<g:textField name="tipoValor" value="${maquinaPortaInstance?.tipoValor}"/>
</div>

