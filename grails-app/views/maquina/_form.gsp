<%@ page import="com.projeto.clp.Maquina" %>




<div class="control-group">
	<label class="control-label" for="localizacaoFisica">
		<g:message code="maquina.localizacaoFisica.label" default="Localizacao Fisica" />
	</label>
	<div class="controls">
		<g:textField name="localizacaoFisica" value="${maquinaInstance?.localizacaoFisica}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="ip">
		<g:message code="maquina.ip.label" default="Ip" />
	</label>
	<div class="controls">
		<g:textField name="ip" required="" value="${maquinaInstance?.ip}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="modelo">
		<g:message code="maquina.modelo.label" default="Modelo" />
	</label>
	<div class="controls">
		<g:textField name="modelo" required="" value="${maquinaInstance?.modelo}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="identificador">
		<g:message code="maquina.identificador.label" default="Identificador" />
	</label>
	<div class="controls">
		<g:textField name="identificador" required="" value="${maquinaInstance?.identificador}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="porta">
		<g:message code="maquina.porta.label" default="Porta" />
	</label>
	<div class="controls">
		<g:textField name="porta" required="" value="${fieldValue(bean: maquinaInstance, field: 'porta')}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="departamento">
		<g:message code="maquina.departamento.label" default="Departamento" />
	</label>
	<div class="controls">
		<g:select id="departamento" name="departamento.id" from="${com.projeto.clp.Departamento.list()}" optionKey="id" required="" value="${maquinaInstance?.departamento?.id}" class="many-to-one"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="escravos">
		<g:message code="maquina.escravos.label" default="Escravos" />
	</label>
	<div class="controls">
		
<ul class="one-to-many">
<g:each in="${maquinaInstance?.escravos?}" var="e">
    <li><g:link controller="escravoMaquina" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="escravoMaquina" action="create" params="['maquina.id': maquinaInstance?.id]" class="btn btn-primary btn-icon glyphicons circle_plus"><i></i> ${message(code: 'default.add.label', args: [message(code: 'escravoMaquina.label', default: 'EscravoMaquina')])}</g:link>

	</div>
</div>


