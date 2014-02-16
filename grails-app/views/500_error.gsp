<!DOCTYPE html>
<html>
	<head>
		<title><g:if env="development">Grails Runtime Exception</g:if><g:else>Error</g:else></title>
		<meta name="layout" content="main">
		<g:if env="development"><link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css"></g:if>
	</head>
	<body>
		<g:if env="development">
			<g:renderException exception="${exception}" />
		</g:if>
		<g:else>
			<!-- Box -->
			<div class="hero-unit well">
			<h1>Ouch! <span>erro 500</span></h1>
			<hr class="separator" />
				<!-- Row -->
				<div class="row-fluid row-merge">
				
					<!-- Column -->
					<div class="span12">
						<div class="innerAll center">
							<p>Isso é difícil de falar, mas tivemos um problema interno :(</p>
						</div>
					</div>
					<!-- // Column END -->
					
				</div>
				<!-- // Row END -->
				
			</div>
		</g:else>
	</body>
</html>
