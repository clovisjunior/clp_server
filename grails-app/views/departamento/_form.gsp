<%@ page import="com.projeto.clp.Departamento" %>




<div class="control-group">
	<label class="control-label" for="nome">
		<g:message code="departamento.nome.label" default="Nome" />
	</label>
	<div class="controls">
		<g:textField name="nome" required="" value="${departamentoInstance?.nome}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="maquinas">
		<g:message code="departamento.maquinas.label" default="Maquinas" />
	</label>
	<div class="controls">
		
<ul class="one-to-many">
<g:each in="${departamentoInstance?.maquinas?}" var="m">
    <li><g:link controller="maquina" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="maquina" action="create" params="['departamento.id': departamentoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'maquina.label', default: 'Maquina')])}</g:link>
</li>
</ul>

	</div>
</div>



<div class="control-group">
	<label class="control-label" for="unidadeNegocio">
		<g:message code="departamento.unidadeNegocio.label" default="Unidade Negocio" />
	</label>
	<div class="controls">
		<g:select id="unidadeNegocio" name="unidadeNegocio.id" from="${com.projeto.clp.UnidadeDeNegocio.list()}" optionKey="id" required="" value="${departamentoInstance?.unidadeNegocio?.id}" class="many-to-one"/>
	</div>
</div>


