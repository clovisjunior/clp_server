
<%@ page import="com.projeto.clp.Administrador" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'administrador.label', default: 'Administrador')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<div class="heading-buttons">
			<h2>${entityName}</h2>
			
			<div class="buttons pull-right">
				<g:link action="index" class="btn btn-default btn-icon glyphicons circle_arrow_left">
					<i></i>	<g:message code="default.list.label" default="Listagem"/>
				</g:link>
			</div>
			<div class="clearfix"></div>
		</div>
		
		<div class="separator bottom"></div>
		
		<div class="innerLR">
			<!-- Mensagem -->
			<g:if test="${flash.message}">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong><g:message default="Atenção !" code="alert.warning"/></strong> ${flash.message}
				</div>
			</g:if>
			<!-- //END Mensagem -->
			
			<!-- Widget -->
			<div class="widget">
				<!-- Widget heading -->
				<div class="widget-head">
					<h4 class="heading"><g:message code="default.show.head.label"/></h4>
				</div>
				<!-- // Widget heading END -->
		
				<div class="widget-body">
				
					<!-- Row -->
					<div class="row-fluid">
						<ol class="property-list administrador">
						
							<g:if test="${administradorInstance?.username}">
							<li class="fieldcontain">
								<span id="username-label" class="property-label"><g:message code="administrador.username.label" default="Username" /></span>
								
									<span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${administradorInstance}" field="username"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${administradorInstance?.email}">
							<li class="fieldcontain">
								<span id="email-label" class="property-label"><g:message code="administrador.email.label" default="Email" /></span>
								
									<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${administradorInstance}" field="email"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${administradorInstance?.accountExpired}">
							<li class="fieldcontain">
								<span id="accountExpired-label" class="property-label"><g:message code="administrador.accountExpired.label" default="Account Expired" /></span>
								
									<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${administradorInstance?.accountExpired}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${administradorInstance?.accountLocked}">
							<li class="fieldcontain">
								<span id="accountLocked-label" class="property-label"><g:message code="administrador.accountLocked.label" default="Account Locked" /></span>
								
									<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${administradorInstance?.accountLocked}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${administradorInstance?.enabled}">
							<li class="fieldcontain">
								<span id="enabled-label" class="property-label"><g:message code="administrador.enabled.label" default="Enabled" /></span>
								
									<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${administradorInstance?.enabled}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${administradorInstance?.entidades}">
							<li class="fieldcontain">
								<span id="entidades-label" class="property-label"><g:message code="administrador.entidades.label" default="Entidades" /></span>
								
									<g:each in="${administradorInstance.entidades}" var="e">
									<span class="property-value" aria-labelledby="entidades-label"><g:link controller="entidade" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${administradorInstance?.passwordExpired}">
							<li class="fieldcontain">
								<span id="passwordExpired-label" class="property-label"><g:message code="administrador.passwordExpired.label" default="Password Expired" /></span>
								
									<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${administradorInstance?.passwordExpired}" /></span>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:administradorInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-primary btn-icon glyphicons circle_plus" action="create"><i></i> <g:message code="default.add.label" default="Adicionar" args="[entityName]"/></g:link>
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${administradorInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>
