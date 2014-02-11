<%@ page import="com.projeto.clp.Entidade" %>



<div class="fieldcontain ${hasErrors(bean: entidadeInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="entidade.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${entidadeInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entidadeInstance, field: 'usuario', 'error')} ">
	<label for="usuario">
		<g:message code="entidade.usuario.label" default="Usuário" />
		
	</label>
	<g:textField name="usuario" value="${entidadeInstance?.usuario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entidadeInstance, field: 'senha', 'error')} ">
	<label for="senha">
		<g:message code="entidade.senha.label" default="Senha" />
		
	</label>
	<g:passwordField name="senha" value="${entidadeInstance?.senha}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: entidadeInstance, field: 'unidadesNegocios', 'error')} ">
	<label for="unidadesNegocios">
		<g:message code="entidade.unidadesNegocios.label" default="Unidades Negocios" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${entidadeInstance?.unidadesNegocios?}" var="u">
    <li><g:link controller="unidadeDeNegocio" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="unidadeDeNegocio" action="create" params="['entidade.id': entidadeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'unidadeDeNegocio.label', default: 'UnidadeDeNegocio')])}</g:link>
</li>
</ul>

</div>

