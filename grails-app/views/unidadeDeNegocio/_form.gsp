<%@ page import="com.projeto.clp.UnidadeDeNegocio" %>




<div class="control-group">
	<label class="control-label" for="nome">
		<g:message code="unidadeDeNegocio.nome.label" default="Nome" />
	</label>
	<div class="controls">
		<g:textField name="nome" required="" value="${unidadeDeNegocioInstance?.nome}"/>
	</div>
</div>


<div class="control-group">
	<label class="control-label" for="endereco">
		<g:message code="unidadeDeNegocio.endereco.label" default="Endereco" />
	</label>
	<div class="controls">
		<g:textField name="endereco" required="" value="${unidadeDeNegocioInstance?.endereco}"/>
	</div>
</div>


<div class="control-group">
	<label class="control-label" for="departamentos">
		<g:message code="unidadeDeNegocio.departamentos.label" default="Departamentos" />
	</label>
	<div class="controls">
		
<ul class="one-to-many">
<g:each in="${unidadeDeNegocioInstance?.departamentos?}" var="d">
    <li><g:link controller="departamento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="departamento" action="create" params="['unidadeDeNegocio.id': unidadeDeNegocioInstance?.id]" class="btn btn-primary btn-icon glyphicons circle_plus"><i></i> ${message(code: 'default.add.label', args: [message(code: 'departamento.label', default: 'Departamento')])}</g:link>

	</div>
</div>


