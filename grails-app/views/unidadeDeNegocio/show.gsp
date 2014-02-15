
<%@ page import="com.projeto.clp.UnidadeDeNegocio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unidadeDeNegocio.label', default: 'UnidadeDeNegocio')}" />
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
						<ol class="property-list unidadeDeNegocio">
						
							<g:if test="${unidadeDeNegocioInstance?.nome}">
							<li class="fieldcontain">
								<span id="nome-label" class="property-label"><g:message code="unidadeDeNegocio.nome.label" default="Nome" /></span>
								
									<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${unidadeDeNegocioInstance}" field="nome"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${unidadeDeNegocioInstance?.departamentos}">
							<li class="fieldcontain">
								<span id="departamentos-label" class="property-label"><g:message code="unidadeDeNegocio.departamentos.label" default="Departamentos" /></span>
								
									<g:each in="${unidadeDeNegocioInstance.departamentos}" var="d">
									<span class="property-value" aria-labelledby="departamentos-label"><g:link controller="departamento" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${unidadeDeNegocioInstance?.endereco}">
							<li class="fieldcontain">
								<span id="endereco-label" class="property-label"><g:message code="unidadeDeNegocio.endereco.label" default="Endereco" /></span>
								
									<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${unidadeDeNegocioInstance}" field="endereco"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${unidadeDeNegocioInstance?.entidade}">
							<li class="fieldcontain">
								<span id="entidade-label" class="property-label"><g:message code="unidadeDeNegocio.entidade.label" default="Entidade" /></span>
								
									<span class="property-value" aria-labelledby="entidade-label"><g:link controller="entidade" action="show" id="${unidadeDeNegocioInstance?.entidade?.id}">${unidadeDeNegocioInstance?.entidade?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:unidadeDeNegocioInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${unidadeDeNegocioInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>
