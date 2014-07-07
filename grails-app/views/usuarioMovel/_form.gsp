<%@ page import="com.projeto.clp.UsuarioMovel" %>




<div class="control-group">
	<label class="control-label" for="username">
		<g:message code="usuarioMovel.username.label" default="Username" />
	</label>
	<div class="controls">
		<g:textField name="username" required="" value="${usuarioMovelInstance?.username}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="password">
		<g:message code="usuarioMovel.password.label" default="Password" />
	</label>
	<div class="controls">
		<g:field type="password" name="password" required="" value="${usuarioMovelInstance?.password}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="email">
		<g:message code="usuarioMovel.email.label" default="Email" />
	</label>
	<div class="controls">
		<g:field type="email" name="email" required="" value="${usuarioMovelInstance?.email}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="accountExpired">
		<g:message code="usuarioMovel.accountExpired.label" default="Account Expired" />
	</label>
	<div class="controls">
		<g:checkBox name="accountExpired" value="${usuarioMovelInstance?.accountExpired}" />
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="accountLocked">
		<g:message code="usuarioMovel.accountLocked.label" default="Account Locked" />
	</label>
	<div class="controls">
		<g:checkBox name="accountLocked" value="${usuarioMovelInstance?.accountLocked}" />
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
	<label class="control-label" for="dispositivosMoveis">
		<g:message code="usuarioMovel.dispositivosMoveis.label" default="Dispositivos Moveis" />
	</label>
	<div class="controls">
		<g:select name="dispositivosMoveis" from="${com.projeto.clp.DispositivoMovel.list()}" multiple="multiple" optionKey="id" size="5" value="${usuarioMovelInstance?.dispositivosMoveis*.id}" class="many-to-many"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="enabled">
		<g:message code="usuarioMovel.enabled.label" default="Enabled" />
	</label>
	<div class="controls">
		<g:checkBox name="enabled" value="${usuarioMovelInstance?.enabled}" />
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



<div class="control-group">
	<label class="control-label" for="passwordExpired">
		<g:message code="usuarioMovel.passwordExpired.label" default="Password Expired" />
	</label>
	<div class="controls">
		<g:checkBox name="passwordExpired" value="${usuarioMovelInstance?.passwordExpired}" />
	</div>
</div>


