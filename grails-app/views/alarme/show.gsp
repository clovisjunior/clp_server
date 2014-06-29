
<%@ page import="com.projeto.clp.Alarme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alarme.label', default: 'Alarme')}" />
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
						<ol class="property-list alarme">
						
							<g:if test="${alarmeInstance?.maquina}">
							<li class="fieldcontain">
								<span id="maquina-label" class="property-label"><g:message code="alarme.maquina.label" default="Maquina" /></span>
								
									<span class="property-value" aria-labelledby="maquina-label"><g:link controller="maquina" action="show" id="${alarmeInstance?.maquina?.id}">${alarmeInstance?.maquina?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${alarmeInstance?.registradorEscravo}">
							<li class="fieldcontain">
								<span id="registradorEscravo-label" class="property-label"><g:message code="alarme.registradorEscravo.label" default="Registrador Escravo" /></span>
								
									<span class="property-value" aria-labelledby="registradorEscravo-label"><g:link controller="registradorEscravo" action="show" id="${alarmeInstance?.registradorEscravo?.id}">${alarmeInstance?.registradorEscravo?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${alarmeInstance?.escravoMaquina}">
							<li class="fieldcontain">
								<span id="escravoMaquina-label" class="property-label"><g:message code="alarme.escravoMaquina.label" default="Escravo Maquina" /></span>
								
									<span class="property-value" aria-labelledby="escravoMaquina-label"><g:link controller="escravoMaquina" action="show" id="${alarmeInstance?.escravoMaquina?.id}">${alarmeInstance?.escravoMaquina?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${alarmeInstance?.maximo}">
							<li class="fieldcontain">
								<span id="maximo-label" class="property-label"><g:message code="alarme.maximo.label" default="Maximo" /></span>
								
									<span class="property-value" aria-labelledby="maximo-label"><g:fieldValue bean="${alarmeInstance}" field="maximo"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${alarmeInstance?.minimo}">
							<li class="fieldcontain">
								<span id="minimo-label" class="property-label"><g:message code="alarme.minimo.label" default="Minimo" /></span>
								
									<span class="property-value" aria-labelledby="minimo-label"><g:fieldValue bean="${alarmeInstance}" field="minimo"/></span>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:alarmeInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-primary btn-icon glyphicons circle_plus" action="create"><i></i> <g:message code="default.add.label" default="Adicionar" args="[entityName]"/></g:link>
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${alarmeInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>
