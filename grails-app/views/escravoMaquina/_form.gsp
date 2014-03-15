<%@ page import="com.projeto.clp.EscravoMaquina" %>




<div class="control-group">
	<label class="control-label" for="escravoId">
		<g:message code="escravoMaquina.escravoId.label" default="Escravo Id" />
	</label>
	<div class="controls">
		<g:textField name="escravoId" required="" value="${escravoMaquinaInstance?.escravoId}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="identificador">
		<g:message code="escravoMaquina.identificador.label" default="Identificador" />
	</label>
	<div class="controls">
		<g:textField name="identificador" required="" value="${escravoMaquinaInstance?.identificador}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="descricao">
		<g:message code="escravoMaquina.descricao.label" default="Descricao" />
	</label>
	<div class="controls">
		<g:textField name="descricao" value="${escravoMaquinaInstance?.descricao}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="maquina">
		<g:message code="escravoMaquina.maquina.label" default="Maquina" />
	</label>
	<div class="controls">
		<g:select id="maquina" name="maquina.id" from="${com.projeto.clp.Maquina.list()}" optionKey="id" required="" value="${escravoMaquinaInstance?.maquina?.id}" class="many-to-one"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="registradores">
		<g:message code="escravoMaquina.registradores.label" default="Registradores" />
	</label>
	<div class="controls">
		
<ul class="one-to-many">
<g:each in="${escravoMaquinaInstance?.registradores?}" var="r">
    <li><g:link controller="registradorEscravo" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="registradorEscravo" action="create" params="['escravoMaquina.id': escravoMaquinaInstance?.id]" class="btn btn-primary btn-icon glyphicons circle_plus"><i></i> ${message(code: 'default.add.label', args: [message(code: 'registradorEscravo.label', default: 'RegistradorEscravo')])}</g:link>

	</div>
</div>


