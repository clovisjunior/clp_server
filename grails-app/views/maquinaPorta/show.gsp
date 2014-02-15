
<%@ page import="com.projeto.clp.MaquinaPorta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'maquinaPorta.label', default: 'MaquinaPorta')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<div class="heading-buttons">
			<h2>${entityName}</h2>
			
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
						<ol class="property-list maquinaPorta">
						
							<g:if test="${maquinaPortaInstance?.apenasLeitura}">
							<li class="fieldcontain">
								<span id="apenasLeitura-label" class="property-label"><g:message code="maquinaPorta.apenasLeitura.label" default="Apenas Leitura" /></span>
								
									<span class="property-value" aria-labelledby="apenasLeitura-label"><g:formatBoolean boolean="${maquinaPortaInstance?.apenasLeitura}" /></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaPortaInstance?.descricao}">
							<li class="fieldcontain">
								<span id="descricao-label" class="property-label"><g:message code="maquinaPorta.descricao.label" default="Descricao" /></span>
								
									<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${maquinaPortaInstance}" field="descricao"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaPortaInstance?.endereco}">
							<li class="fieldcontain">
								<span id="endereco-label" class="property-label"><g:message code="maquinaPorta.endereco.label" default="Endereco" /></span>
								
									<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${maquinaPortaInstance}" field="endereco"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaPortaInstance?.identificador}">
							<li class="fieldcontain">
								<span id="identificador-label" class="property-label"><g:message code="maquinaPorta.identificador.label" default="Identificador" /></span>
								
									<span class="property-value" aria-labelledby="identificador-label"><g:fieldValue bean="${maquinaPortaInstance}" field="identificador"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaPortaInstance?.maquina}">
							<li class="fieldcontain">
								<span id="maquina-label" class="property-label"><g:message code="maquinaPorta.maquina.label" default="Maquina" /></span>
								
									<span class="property-value" aria-labelledby="maquina-label"><g:link controller="maquina" action="show" id="${maquinaPortaInstance?.maquina?.id}">${maquinaPortaInstance?.maquina?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${maquinaPortaInstance?.tipoValor}">
							<li class="fieldcontain">
								<span id="tipoValor-label" class="property-label"><g:message code="maquinaPorta.tipoValor.label" default="Tipo Valor" /></span>
								
									<span class="property-value" aria-labelledby="tipoValor-label"><g:fieldValue bean="${maquinaPortaInstance}" field="tipoValor"/></span>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:maquinaPortaInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${maquinaPortaInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>
