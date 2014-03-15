
<%@ page import="com.projeto.clp.Maquina" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maquina.label', default: 'Maquina')}" />
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
						<ol class="property-list maquina">
						
							<g:if test="${maquinaInstance?.localizacaoFisica}">
							<li class="fieldcontain">
								<span id="localizacaoFisica-label" class="property-label"><g:message code="maquina.localizacaoFisica.label" default="Localizacao Fisica" /></span>
								
									<span class="property-value" aria-labelledby="localizacaoFisica-label"><g:fieldValue bean="${maquinaInstance}" field="localizacaoFisica"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaInstance?.ip}">
							<li class="fieldcontain">
								<span id="ip-label" class="property-label"><g:message code="maquina.ip.label" default="Ip" /></span>
								
									<span class="property-value" aria-labelledby="ip-label"><g:fieldValue bean="${maquinaInstance}" field="ip"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaInstance?.modelo}">
							<li class="fieldcontain">
								<span id="modelo-label" class="property-label"><g:message code="maquina.modelo.label" default="Modelo" /></span>
								
									<span class="property-value" aria-labelledby="modelo-label"><g:fieldValue bean="${maquinaInstance}" field="modelo"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaInstance?.identificador}">
							<li class="fieldcontain">
								<span id="identificador-label" class="property-label"><g:message code="maquina.identificador.label" default="Identificador" /></span>
								
									<span class="property-value" aria-labelledby="identificador-label"><g:fieldValue bean="${maquinaInstance}" field="identificador"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaInstance?.porta}">
							<li class="fieldcontain">
								<span id="porta-label" class="property-label"><g:message code="maquina.porta.label" default="Porta" /></span>
								
									<span class="property-value" aria-labelledby="porta-label"><g:fieldValue bean="${maquinaInstance}" field="porta"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaInstance?.departamento}">
							<li class="fieldcontain">
								<span id="departamento-label" class="property-label"><g:message code="maquina.departamento.label" default="Departamento" /></span>
								
									<span class="property-value" aria-labelledby="departamento-label"><g:link controller="departamento" action="show" id="${maquinaInstance?.departamento?.id}">${maquinaInstance?.departamento?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaInstance?.escravos}">
							<li class="fieldcontain">
								<span id="escravos-label" class="property-label"><g:message code="maquina.escravos.label" default="Escravos" /></span>
								
									<g:each in="${maquinaInstance.escravos}" var="e">
									<span class="property-value" aria-labelledby="escravos-label"><g:link controller="escravoMaquina" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:maquinaInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-primary btn-icon glyphicons circle_plus" action="create"><i></i> <g:message code="default.add.label" default="Adicionar" args="[entityName]"/></g:link>
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${maquinaInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>
