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
	<div class="controls uniformjs">
	
		<g:each in="${com.projeto.clp.Maquina.list()}" var="maquina" status="i">
			<label class="checkbox">
				<g:checkBox class="checkbox" name="maquinas" value="${maquina?.id}" checked="${usuarioMovelInstance?.maquinas?.contains(maquina)}"/>${maquina}
			</label>
		</g:each>
	</div>
	<div class="controls">
		<g:link controller="maquina" action="create" params="['departamento.id': usuarioMovelInstance?.departamento?.id]" class="btn btn-primary btn-icon glyphicons circle_plus"><i></i> ${message(code: 'default.add.label', args: [message(code: 'maquina.label', default: 'Maquina')])}</g:link>
	</div>
</div>


