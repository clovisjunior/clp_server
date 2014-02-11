<%@ page import="com.projeto.clp.Departamento" %>



<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="departamento.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${departamentoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'unidadeNegocio', 'error')} required">
	<label for="unidadeNegocio">
		<g:message code="departamento.unidadeNegocio.label" default="Unidade Negocio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="unidadeNegocio" name="unidadeNegocio.id" from="${com.projeto.clp.UnidadeDeNegocio.list()}" optionKey="id" required="" value="${departamentoInstance?.unidadeNegocio?.id}" class="many-to-one"/>
</div>

