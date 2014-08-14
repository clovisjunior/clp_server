<%@ page import="com.projeto.clp.Alarme" %>

<div class="control-group">
	<label class="control-label" for="maquina">
		<g:message code="alarme.maquina.label" default="Maquina" />
	</label>
	<div class="controls">
		<g:select id="maquina" name="maquina.id" from="${maquinas}" 
				  optionKey="id" required="" value="${alarmeInstance?.maquina?.id}" class="many-to-one"
				  noSelection="${['0':'Selecione']}"
				  onchange="${remoteFunction(action: 'preecherEscravos', controller: 'alarme', 
				  							 update: 'selectEscravoMaquina', params: '\'maquinaId=\' + this.value',
				  							 onComplete: '$(\'#escravoMaquina\').change();', 
				  							 onLoading: 'showSpinner();',
				  							 onLoaded: 'hideSpinner();')}"
				  />
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="escravoMaquina">
		<g:message code="alarme.escravoMaquina.label" default="Escravo Maquina" />
	</label>
	<div class="controls" id="selectEscravoMaquina">
		<g:render template="select_escravos" model="[escravos: escravos]"></g:render>
	</div>
	<div id="spinner_escravos" style="display: none;">
	   <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Pesquisando ..." width="16" height="16" />
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="registradorEscravo">
		<g:message code="alarme.registradorEscravo.label" default="Registrador Escravo" />
	</label>
	<div class="controls" id="selectRegistradores">
		<g:render template="select_registradores" model="[registradores: registradores]"></g:render>
	</div>
	<div id="spinner_registradores" style="display: none;">
	   <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Pesquisando ..." width="16" height="16" />
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="minimo">
		<g:message code="alarme.minimo.label" default="Minimo" />
	</label>
	<div class="controls">
		<g:textField required="" name="minimo" value="${alarmeInstance?.minimo}"/>
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="maximo">
		<g:message code="alarme.maximo.label" default="Maximo" />
	</label>
	<div class="controls">
		<g:textField required="" name="maximo" value="${alarmeInstance?.maximo}"/>
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="identificador">
		<g:message code="alarme.identificador.label" default="Identificador" />
	</label>
	<div class="controls">
		<g:textField required="" name="identificador" value="${alarmeInstance?.identificador}"/>
	</div>
</div>

<g:javascript>

function showSpinner() {
   $('#spinner_escravos').show(); 
   $('#spinner_registradores').show(); 
}

function hideSpinner() {
   $('#spinner_escravos').hide(); 
   $('#spinner_registradores').hide(); 
}

</g:javascript>
