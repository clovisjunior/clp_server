<%@ page import="com.projeto.clp.RegistradorEscravo" %>
<%@ page import="com.projeto.clp.type.RegistradorType" %>
<%@ page import="com.projeto.clp.type.DadoType" %>



<div class="control-group">
	<label class="control-label" for="offset">
		<g:message code="registradorEscravo.identificador.label" default="Identificador" />
	</label>
	<div class="controls">
		<g:textField name="identificador" required="" value="${registradorEscravoInstance?.identificador}"/>
	</div>
</div>


<div class="control-group">
	<label class="control-label" for="offset">
		<g:message code="registradorEscravo.endereco.label" default="Endereço" />
	</label>
	<div class="controls">
		<g:textField name="endereco" required="" value="${registradorEscravoInstance?.endereco}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="escravoMaquina">
		<g:message code="registradorEscravo.escravoMaquina.label" default="Escravo Maquina" />
	</label>
	<div class="controls">
		<g:select id="escravoMaquina" name="escravoMaquina.id" from="${com.projeto.clp.EscravoMaquina.list()}" optionKey="id" required="" value="${registradorEscravoInstance?.escravoMaquina?.id}" class="many-to-one"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="tipo">
		<g:message code="registradorEscravo.tipo.label" default="Tipo" />
	</label>
	<div class="controls">
		<g:select id="tipo" name="tipo" from="${RegistradorType.list()}"
                  optionKey="id" optionValue="descricao" value="${registradorEscravoInstance?.tipo}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="tipoDado">
		<g:message code="registradorEscravo.tipoDado.label" default="Tipo Dado" />
	</label>
	<div class="controls">
		<g:select id="tipoDado" name="tipoDado" from="${DadoType.list()}"
                  optionKey="id" optionValue="descricao" value="${registradorEscravoInstance?.tipoDado}"/>
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="tipoDado">
		<g:message code="registradorEscravo.isSomenteLeitura.label" default="Somente Leitura" />
	</label>
	<div class="controls">
		<g:select id="isSomenteLeitura" name="isSomenteLeitura" from="${['Sim', 'Não']}"
			      keys="${[true, false]}" value="${registradorEscravoInstance?.isSomenteLeitura}"/>		
	</div>
</div>


