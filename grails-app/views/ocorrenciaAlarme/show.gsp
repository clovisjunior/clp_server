
<%@ page import="com.projeto.clp.OcorrenciaAlarme" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ocorrenciaAlarme.label', default: 'OcorrenciaAlarme')}" />
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
						<ol class="property-list ocorrenciaAlarme">
						
							<g:if test="${ocorrenciaAlarmeInstance?.usuarioMovel}">
							<li class="fieldcontain">
								<span id="usuarioMovel-label" class="property-label"><g:message code="ocorrenciaAlarme.usuarioMovel.label" default="Usuario Movel" /></span>
								
									<span class="property-value" aria-labelledby="usuarioMovel-label"><g:link controller="usuarioMovel" action="show" id="${ocorrenciaAlarmeInstance?.usuarioMovel?.id}">${ocorrenciaAlarmeInstance?.usuarioMovel?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${ocorrenciaAlarmeInstance?.motivoAlarme}">
							<li class="fieldcontain">
								<span id="motivoAlarme-label" class="property-label"><g:message code="ocorrenciaAlarme.motivoAlarme.label" default="Motivo Alarme" /></span>
								
									<span class="property-value" aria-labelledby="motivoAlarme-label"><g:fieldValue bean="${ocorrenciaAlarmeInstance}" field="motivoAlarme"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${ocorrenciaAlarmeInstance?.solucaoAplicada}">
							<li class="fieldcontain">
								<span id="solucaoAplicada-label" class="property-label"><g:message code="ocorrenciaAlarme.solucaoAplicada.label" default="Solucao Aplicada" /></span>
								
									<span class="property-value" aria-labelledby="solucaoAplicada-label"><g:fieldValue bean="${ocorrenciaAlarmeInstance}" field="solucaoAplicada"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${ocorrenciaAlarmeInstance?.estado}">
							<li class="fieldcontain">
								<span id="estado-label" class="property-label"><g:message code="ocorrenciaAlarme.estado.label" default="Estado" /></span>
								
									<span class="property-value" aria-labelledby="estado-label"><g:link controller="estadoOcorrenciaAlarme" action="show" id="${ocorrenciaAlarmeInstance?.estado?.id}">${ocorrenciaAlarmeInstance?.estado?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${ocorrenciaAlarmeInstance?.alarme}">
							<li class="fieldcontain">
								<span id="alarme-label" class="property-label"><g:message code="ocorrenciaAlarme.alarme.label" default="Alarme" /></span>
								
									<span class="property-value" aria-labelledby="alarme-label"><g:link controller="alarme" action="show" id="${ocorrenciaAlarmeInstance?.alarme?.id}">${ocorrenciaAlarmeInstance?.alarme?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:ocorrenciaAlarmeInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-primary btn-icon glyphicons circle_plus" action="create"><i></i> <g:message code="default.add.label" default="Adicionar" args="[entityName]"/></g:link>
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${ocorrenciaAlarmeInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>
