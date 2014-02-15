<%@ page import="com.projeto.clp.UsuarioMovel" %>




<div class="control-group">
	<label class="control-label" for="usuario">
		<g:message code="usuarioMovel.usuario.label" default="Usuario" />
	</label>
	<div class="controls">
		<g:textField name="usuario" required="" value="${usuarioMovelInstance?.usuario}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="senha">
		<g:message code="usuarioMovel.senha.label" default="Senha" />
	</label>
	<div class="controls">
		<g:field type="password" name="senha" required="" value="${usuarioMovelInstance?.senha}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="departamento">
		<g:message code="usuarioMovel.departamento.label" default="Departamento" />
	</label>
	<div class="controls">
		<g:select id="departamento" name="departamento.id" from="${com.projeto.clp.Departamento.list()}" optionKey="id" required="" value="${usuarioMovelInstance?.departamento?.id}" class="many-to-one"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="maquinas">
		<g:message code="usuarioMovel.maquinas.label" default="Maquinas" />
	</label>
	<div class="controls">
		<g:select name="maquinas" from="${com.projeto.clp.Maquina.list()}" multiple="multiple" optionKey="id" size="5" value="${usuarioMovelInstance?.maquinas*.id}" class="many-to-many"/>
	</div>
</div>


