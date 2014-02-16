
<%@ page import="com.projeto.clp.Departamento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'departamento.label', default: 'Departamento')}" />
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
						<ol class="property-list departamento">
						
							<g:if test="${departamentoInstance?.nome}">
							<li class="fieldcontain">
								<span id="nome-label" class="property-label"><g:message code="departamento.nome.label" default="Nome" /></span>
								
									<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${departamentoInstance}" field="nome"/></span>
								
							</li>
							</g:if>
						
							<g:if test="${departamentoInstance?.maquinas}">
							<li class="fieldcontain">
								<span id="maquinas-label" class="property-label"><g:message code="departamento.maquinas.label" default="Maquinas" /></span>
								
									<g:each in="${departamentoInstance.maquinas}" var="m">
									<span class="property-value" aria-labelledby="maquinas-label"><g:link controller="maquina" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
							<g:if test="${departamentoInstance?.unidadeNegocio}">
							<li class="fieldcontain">
								<span id="unidadeNegocio-label" class="property-label"><g:message code="departamento.unidadeNegocio.label" default="Unidade Negocio" /></span>
								
									<span class="property-value" aria-labelledby="unidadeNegocio-label"><g:link controller="unidadeDeNegocio" action="show" id="${departamentoInstance?.unidadeNegocio?.id}">${departamentoInstance?.unidadeNegocio?.encodeAsHTML()}</g:link></span>
								
							</li>
							</g:if>
						
							<g:if test="${departamentoInstance?.usuariosMoveis}">
							<li class="fieldcontain">
								<span id="usuariosMoveis-label" class="property-label"><g:message code="departamento.usuariosMoveis.label" default="Usuarios Moveis" /></span>
								
									<g:each in="${departamentoInstance.usuariosMoveis}" var="u">
									<span class="property-value" aria-labelledby="usuariosMoveis-label"><g:link controller="usuarioMovel" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
									</g:each>
								
							</li>
							</g:if>
						
						</ol>
						
						<hr class="separator" />
				
						<!-- Form actions -->
						<div class="form-actions">
							<g:form url="[resource:departamentoInstance, action:'delete']" method="DELETE">
								<g:link class="btn btn-primary btn-icon glyphicons circle_plus" action="create"><i></i> <g:message code="default.add.label" default="Adicionar" args="[entityName]"/></g:link>
								<g:link class="btn btn-icon btn-primary glyphicons pencil" action="edit" resource="${departamentoInstance}"><i></i><g:message code="default.button.edit.label" default="Editar" /></g:link>
								<button class="btn btn-icon btn-danger glyphicons delete" type="submit"  onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" ><i></i><g:message code="default.button.delete.label" default="Deletar"/></button>
							</g:form>
						</div>
						
					</div>
				</div>
			</div>
		
		</div>
	
	</body>
</html>
