
<%@ page import="com.projeto.clp.EscravoMaquina" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'escravoMaquina.label', default: 'EscravoMaquina')}" />
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
						<ol class="property-list escravoMaquina">
						
							<g:if test="${escravoMaquinaInstance?.escravoId}">
							<li class="fieldcontain">
								<span id="escravoId-label" class="property-label"><g:message code="escravoMaquina.escravoId.label" default="Escravo Id" /></span>
								
									<span class="property-value" aria-labelledby="escravoId-label"><g:fieldValue bean="${escravoMaquinaInstance}" field="escravoId"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${escravoMaquinaInstance?.identificador}">
							<li class="fieldcontain">
								<span id="identificador-label" class="property-label"><g:message code="escravoMaquina.identificador.label" default="Identificador" /></span>
								
									<span class="property-value" aria-labelledby="identificador-label"><g:fieldValue bean="${escravoMaquinaInstance}" field="identificador"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${escravoMaquinaInstance?.descricao}">
							<li class="fieldcontain">
								<span id="descricao-label" class="property-label"><g:message code="escravoMaquina.descricao.label" default="Descricao" /></span>
								
									<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${escravoMaquinaInstance}" field="descricao"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${escravoMaquinaInstance?.maquina}">
							<li class="fieldcontain">
								<span id="maquina-label" class="property-label"><g:message code="escravoMaquina.maquina.label" default="Maquina" /></span>
								
									<span class="property-value" aria-labelledby="maquina-label"><g:link controller="maquina" action="show" id="${escravoMaquinaInstance?.maquina?.id}">${escravoMaquinaInstance?.maquina?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${escravoMaquinaInstance?.registradores}">
							<li class="fieldcontain">
								<span id="registradores-label" class="property-label"><g:message code="escravoMaquina.registradores.label" default="Registradores" /></span>
								
									<g:each in="${escravoMaquinaInstance.registradores}" var="r">
									<span class="property-value" aria-labelledby="registradores-label"><g:link controller="registradorEscravo" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:escravoMaquinaInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-primary btn-icon glyphicons circle_plus" action="create"><i></i> <g:message code="default.add.label" default="Adicionar" args="[entityName]"/></g:link>
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${escravoMaquinaInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>