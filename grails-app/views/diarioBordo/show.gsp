
<%@ page import="com.projeto.clp.DiarioBordo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'diarioBordo.label', default: 'DiarioBordo')}" />
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
						<ol class="property-list diarioBordo">
						
							<g:if test="${diarioBordoInstance?.dataHora}">
							<li class="fieldcontain">
								<span id="dataHora-label" class="property-label"><g:message code="diarioBordo.dataHora.label" default="Data Hora" /></span>
								
									<span class="property-value" aria-labelledby="dataHora-label"><g:formatDate date="${diarioBordoInstance?.dataHora}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${diarioBordoInstance?.descricao}">
							<li class="fieldcontain">
								<span id="descricao-label" class="property-label"><g:message code="diarioBordo.descricao.label" default="Descricao" /></span>
								
									<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${diarioBordoInstance}" field="descricao"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${diarioBordoInstance?.fotos}">
							<li class="fieldcontain">
								<span id="fotos-label" class="property-label"><g:message code="diarioBordo.fotos.label" default="Fotos" /></span>
								
									<g:each in="${diarioBordoInstance.fotos}" var="f">
									<span class="property-value" aria-labelledby="fotos-label"><g:link controller="foto" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${diarioBordoInstance?.maquina}">
							<li class="fieldcontain">
								<span id="maquina-label" class="property-label"><g:message code="diarioBordo.maquina.label" default="Maquina" /></span>
								
									<span class="property-value" aria-labelledby="maquina-label"><g:link controller="maquina" action="show" id="${diarioBordoInstance?.maquina?.id}">${diarioBordoInstance?.maquina?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${diarioBordoInstance?.usuarioMovel}">
							<li class="fieldcontain">
								<span id="usuarioMovel-label" class="property-label"><g:message code="diarioBordo.usuarioMovel.label" default="Usuario Movel" /></span>
								
									<span class="property-value" aria-labelledby="usuarioMovel-label"><g:link controller="usuarioMovel" action="show" id="${diarioBordoInstance?.usuarioMovel?.id}">${diarioBordoInstance?.usuarioMovel?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:diarioBordoInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-primary btn-icon glyphicons circle_plus" action="create"><i></i> <g:message code="default.add.label" default="Adicionar" args="[entityName]"/></g:link>
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${diarioBordoInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>
