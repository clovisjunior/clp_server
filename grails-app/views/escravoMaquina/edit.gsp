<%@ page import="com.projeto.clp.EscravoMaquina" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'escravoMaquina.label', default: 'EscravoMaquina')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="heading-buttons">
			<h2><g:message code="default.edit.label" args="[entityName]" /></h2>
			
			<div class="buttons pull-right">
				<g:link action="index" class="btn btn-default btn-icon glyphicons circle_arrow_left">
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
			<g:hasErrors bean="${escravoMaquinaInstance}">
				<div class="alert alert-error">
					<g:eachError bean="${escravoMaquinaInstance}" var="error">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<strong><g:message error="${error}"/></strong>
					</g:eachError>
				</div>
			</g:hasErrors>
			<!-- //END Mensagem -->
			
			<g:form url="[resource:escravoMaquinaInstance, action:'update']" method="PUT"  class="form-horizontal" style="margin-bottom: 0;">
				<g:hiddenField name="version" value="${escravoMaquinaInstance?.version}" />
				
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
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<button type="submit" class="btn btn-icon btn-primary glyphicons circle_ok"><i></i><g:message code="default.button.update.label" default="Atualizar"/></button>
							<g:link controller="maquina" action="show" id="${escravoMaquinaInstance?.maquina?.id}" class="btn btn-icon btn-default glyphicons circle_remove">
								<i></i><g:message code="default.button.cancel.label" default="Cancelar"/>
							</g:link>
						</div>
					</div>
					<!-- // Widget heading END -->
				</div>
				
			</g:form>
		</div>
	</body>
</html>
