<%@ page import="com.projeto.clp.Maquina" %>



<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'localizacaoFisica', 'error')} ">
	<label for="localizacaoFisica">
		<g:message code="maquina.localizacaoFisica.label" default="Localizacao Fisica" />
		
	</label>
	<g:textField name="localizacaoFisica" value="${maquinaInstance?.localizacaoFisica}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'ip', 'error')} required">
	<label for="ip">
		<g:message code="maquina.ip.label" default="Ip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ip" required="" value="${maquinaInstance?.ip}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'modelo', 'error')} required">
	<label for="modelo">
		<g:message code="maquina.modelo.label" default="Modelo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="modelo" required="" value="${maquinaInstance?.modelo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'identificador', 'error')} required">
	<label for="identificador">
		<g:message code="maquina.identificador.label" default="Identificador" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="identificador" required="" value="${maquinaInstance?.identificador}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'departamento', 'error')} required">
	<label for="departamento">
		<g:message code="maquina.departamento.label" default="Departamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="departamento" name="departamento.id" from="${com.projeto.clp.Departamento.list()}" optionKey="id" required="" value="${maquinaInstance?.departamento?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: maquinaInstance, field: 'portas', 'error')} ">
	<label for="portas">
		<g:message code="maquina.portas.label" default="Portas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${maquinaInstance?.portas?}" var="p">
    <li><g:link controller="maquinaPorta" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="maquinaPorta" action="create" params="['maquina.id': maquinaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'maquinaPorta.label', default: 'MaquinaPorta')])}</g:link>
</li>
</ul>

</div>

