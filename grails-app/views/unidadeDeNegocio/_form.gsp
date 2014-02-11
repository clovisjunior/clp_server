<%@ page import="com.projeto.clp.UnidadeDeNegocio" %>

<div class="fieldcontain ${hasErrors(bean: unidadeDeNegocioInstance, field: 'entidade', 'error')} required">
	<label for="entidade">
		<g:message code="unidadeDeNegocio.entidade.label" default="Entidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="entidade" name="entidade.id" from="${com.projeto.clp.Entidade.list()}" optionKey="id" required="" value="${unidadeDeNegocioInstance?.entidade?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unidadeDeNegocioInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="unidadeDeNegocio.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${unidadeDeNegocioInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: unidadeDeNegocioInstance, field: 'endereco', 'error')} ">
	<label for="endereco">
		<g:message code="unidadeDeNegocio.endereco.label" default="Endereco" />
		
	</label>
	<g:textField name="endereco" value="${unidadeDeNegocioInstance?.endereco}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: unidadeDeNegocioInstance, field: 'departamentos', 'error')} ">
	<label for="departamentos">
		<g:message code="unidadeDeNegocio.departamentos.label" default="Departamentos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${unidadeDeNegocioInstance?.departamentos?}" var="d">
    <li><g:link controller="departamento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="departamento" action="create" params="['unidadeDeNegocio.id': unidadeDeNegocioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'departamento.label', default: 'Departamento')])}</g:link>
</li>
</ul>

</div>