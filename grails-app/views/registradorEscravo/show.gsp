
<%@ page import="com.projeto.clp.RegistradorEscravo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'registradorEscravo.label', default: 'RegistradorEscravo')}" />
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
						<ol class="property-list registradorEscravo">
						
							<g:if test="${registradorEscravoInstance?.offset}">
							<li class="fieldcontain">
								<span id="offset-label" class="property-label"><g:message code="registradorEscravo.offset.label" default="Offset" /></span>
								
									<span class="property-value" aria-labelledby="offset-label"><g:fieldValue bean="${registradorEscravoInstance}" field="offset"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${registradorEscravoInstance?.escravoMaquina}">
							<li class="fieldcontain">
								<span id="escravoMaquina-label" class="property-label"><g:message code="registradorEscravo.escravoMaquina.label" default="Escravo Maquina" /></span>
								
									<span class="property-value" aria-labelledby="escravoMaquina-label"><g:link controller="escravoMaquina" action="show" id="${registradorEscravoInstance?.escravoMaquina?.id}">${registradorEscravoInstance?.escravoMaquina?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${registradorEscravoInstance?.tipo}">
							<li class="fieldcontain">
								<span id="tipo-label" class="property-label"><g:message code="registradorEscravo.tipo.label" default="Tipo" /></span>
								
									<span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${registradorEscravoInstance}" field="tipo"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${registradorEscravoInstance?.tipoDado}">
							<li class="fieldcontain">
								<span id="tipoDado-label" class="property-label"><g:message code="registradorEscravo.tipoDado.label" default="Tipo Dado" /></span>
								
									<span class="property-value" aria-labelledby="tipoDado-label"><g:fieldValue bean="${registradorEscravoInstance}" field="tipoDado"/></span>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:registradorEscravoInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-primary btn-icon glyphicons circle_plus" action="create"><i></i> <g:message code="default.add.label" default="Adicionar" args="[entityName]"/></g:link>
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${registradorEscravoInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>
