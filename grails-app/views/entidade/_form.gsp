<%@ page import="com.projeto.clp.Entidade" %>


<div class="control-group">
	<label class="control-label" for="username">
		<g:message code="entidade.username.label" default="Username" />
	</label>
	<div class="controls">
		<sec:access expression="hasRole('ROLE_ADMIN')">
			<g:textField name="username" required="" value="${entidadeInstance?.username}"/>
		</sec:access>
		<sec:access expression="hasRole('ROLE_USER')">
			<g:textField name="username" required="" value="${entidadeInstance?.username}" disabled="disabled"/>
		</sec:access>
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
		<g:message code="entidade.email.label" default="Email" />
	</label>
	<div class="controls">
		<g:field type="email" name="email" required="" value="${entidadeInstance?.email}"/>
	</div>
</div>

<div class="control-group">
	<label class="control-label" for="nome">
		<g:message code="entidade.nome.label" default="Nome" />
	</label>
	<div class="controls">
		<g:textField name="nome" required="" value="${entidadeInstance?.nome}"/>
	</div>
</div>

