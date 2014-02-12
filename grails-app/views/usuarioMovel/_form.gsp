<%@ page import="com.projeto.clp.UsuarioMovel" %>



<div class="fieldcontain ${hasErrors(bean: usuarioMovelInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="usuarioMovel.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="usuario" required="" value="${usuarioMovelInstance?.usuario}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioMovelInstance, field: 'senha', 'error')} required">
	<label for="senha">
		<g:message code="usuarioMovel.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="password" name="senha" required="" value="${usuarioMovelInstance?.senha}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioMovelInstance, field: 'departamento', 'error')} required">
	<label for="departamento">
		<g:message code="usuarioMovel.departamento.label" default="Departamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="departamento" name="departamento.id" from="${com.projeto.clp.Departamento.list()}" optionKey="id" required="" value="${usuarioMovelInstance?.departamento?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioMovelInstance, field: 'maquinas', 'error')} ">
	<label for="maquinas">
		<g:message code="usuarioMovel.maquinas.label" default="Maquinas" />
		
	</label>
	<g:select name="maquinas" from="${com.projeto.clp.Maquina.list()}" multiple="multiple" optionKey="id" size="5" value="${usuarioMovelInstance?.maquinas*.id}" class="many-to-many"/>
</div>

