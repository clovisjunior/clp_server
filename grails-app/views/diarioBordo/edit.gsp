<%@ page import="com.projeto.clp.DiarioBordo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'diarioBordo.label', default: 'DiarioBordo')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="heading-buttons">
			<h2><g:message code="default.edit.label" args="[entityName]" /></h2>
			
			<div class="buttons pull-right">
				<g:link action="index" params="['maquina.id': diarioBordoInstance.maquina.id]" class="btn btn-default btn-icon glyphicons circle_arrow_left">
					<i></i>	<g:message code="default.back.label" default="Voltar"/>
				</g:link>
			</div>
			<div class="clearfix"></div>
		</div>
		
		<div class="separator bottom"></div>
		
		<div class="innerLR">
		
			<!-- Mensagem -->
			<g:if test="${flash.message}">
				<div class="alert ${flash.messageTypeClass}">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<strong><g:message default="Atenção !" code="alert.warning"/></strong> ${flash.message}
				</div>
			</g:if>
			<g:hasErrors bean="${diarioBordoInstance}">
				<div class="alert alert-error">
					<g:eachError bean="${diarioBordoInstance}" var="error">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong><g:message error="${error}"/></strong>
					</g:eachError>
				</div>
			</g:hasErrors>
			<!-- //END Mensagem -->
			
			<g:form url="[resource:diarioBordoInstance, action:'update']" method="PUT"  class="form-horizontal" style="margin-bottom: 0;">
				<g:hiddenField name="version" value="${diarioBordoInstance?.version}" />
				
				<!-- Widget -->
				<div class="widget">
					<!-- Widget heading -->
					<div class="widget-head">
						<h4 class="heading"><g:message code="default.create.head.label"/></h4>
					</div>
					<!-- // Widget heading END -->
			
					<div class="widget-body">
					
						<!-- Row -->
						<div class="row-fluid">
							<g:render template="form"/>
						</div>
						
						
					</div>
					<!-- // Widget heading END -->
				</div>
				
			</g:form>
		</div>
	</body>
</html>
