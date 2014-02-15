<%@ page import="com.projeto.clp.Entidade" %>




<div class="control-group">
	<label class="control-label" for="nome">
		<g:message code="entidade.nome.label" default="Nome" />
	</label>
	<div class="controls">
		<g:textField name="nome" required="" value="${entidadeInstance?.nome}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="usuario">
		<g:message code="entidade.usuario.label" default="Usuario" />
	</label>
	<div class="controls">
		<g:textField name="usuario" maxlength="15" required="" value="${entidadeInstance?.usuario}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="senha">
		<g:message code="entidade.senha.label" default="Senha" />
	</label>
	<div class="controls">
		<g:field type="password" name="senha" maxlength="15" required="" value="${entidadeInstance?.senha}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="unidadesNegocios">
		<g:message code="entidade.unidadesNegocios.label" default="Unidades Negocios" />
	</label>
	<div class="controls">
		
<ul class="one-to-many">
<g:each in="${entidadeInstance?.unidadesNegocios?}" var="u">
    <li><g:link controller="unidadeDeNegocio" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="unidadeDeNegocio" action="create" params="['entidade.id': entidadeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'unidadeDeNegocio.label', default: 'UnidadeDeNegocio')])}</g:link>
</li>
</ul>

	</div>
</div>


