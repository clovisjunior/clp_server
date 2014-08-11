<%@ page import="com.projeto.clp.Administrador" %>




<div class="control-group">
	<label class="control-label" for="username">
		<g:message code="administrador.username.label" default="Username" />
	</label>
	<div class="controls">
		<g:textField name="username" required="" value="${administradorInstance?.username}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="password">
		<g:message code="administrador.password.label" default="Password" />
	</label>
	<div class="controls">
		<g:passwordField name="password" required="" value="${administradorInstance?.password}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="email">
		<g:message code="administrador.email.label" default="Email" />
	</label>
	<div class="controls">
		<g:field type="email" name="email" required="" value="${administradorInstance?.email}"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="accountExpired">
		<g:message code="administrador.accountExpired.label" default="Account Expired" />
	</label>
	<div class="controls">
		<g:checkBox name="accountExpired" value="${administradorInstance?.accountExpired}" />
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="accountLocked">
		<g:message code="administrador.accountLocked.label" default="Account Locked" />
	</label>
	<div class="controls">
		<g:checkBox name="accountLocked" value="${administradorInstance?.accountLocked}" />
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="enabled">
		<g:message code="administrador.enabled.label" default="Enabled" />
	</label>
	<div class="controls">
		<g:checkBox name="enabled" value="${administradorInstance?.enabled}" />
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="entidades">
		<g:message code="administrador.entidades.label" default="Entidades" />
	</label>
	<div class="controls">
		<g:select name="entidades" from="${com.projeto.clp.Entidade.list()}" multiple="multiple" optionKey="id" size="5" value="${administradorInstance?.entidades*.id}" class="many-to-many"/>
	</div>
</div>



<div class="control-group">
	<label class="control-label" for="passwordExpired">
		<g:message code="administrador.passwordExpired.label" default="Password Expired" />
	</label>
	<div class="controls">
		<g:checkBox name="passwordExpired" value="${administradorInstance?.passwordExpired}" />
	</div>
</div>


