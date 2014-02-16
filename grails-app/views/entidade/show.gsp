
<%@ page import="com.projeto.clp.Entidade" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'entidade.label', default: 'Entidade')}" />
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
						<ol class="property-list entidade">
						
							<g:if test="${entidadeInstance?.nome}">
							<li class="fieldcontain">
								<span id="nome-label" class="property-label"><g:message code="entidade.nome.label" default="Nome" /></span>
								
									<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${entidadeInstance}" field="nome"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${entidadeInstance?.usuario}">
							<li class="fieldcontain">
								<span id="usuario-label" class="property-label"><g:message code="entidade.usuario.label" default="Usuario" /></span>
								
									<span class="property-value" aria-labelledby="usuario-label"><g:fieldValue bean="${entidadeInstance}" field="usuario"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${entidadeInstance?.senha}">
							<li class="fieldcontain">
								<span id="senha-label" class="property-label"><g:message code="entidade.senha.label" default="Senha" /></span>
								
									<span class="property-value" aria-labelledby="senha-label"><g:fieldValue bean="${entidadeInstance}" field="senha"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${entidadeInstance?.unidadesNegocios}">
							<li class="fieldcontain">
								<span id="unidadesNegocios-label" class="property-label"><g:message code="entidade.unidadesNegocios.label" default="Unidades Negocios" /></span>
								
									<g:each in="${entidadeInstance.unidadesNegocios}" var="u">
									<span class="property-value" aria-labelledby="unidadesNegocios-label"><g:link controller="unidadeDeNegocio" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:entidadeInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-primary btn-icon glyphicons circle_plus" action="create"><i></i> <g:message code="default.add.label" default="Adicionar" args="[entityName]"/></g:link>
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${entidadeInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>
