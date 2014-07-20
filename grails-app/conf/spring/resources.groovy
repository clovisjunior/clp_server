// Place your Spring DSL code here
beans = {

	
	projetoCLPRestAuthenticationProvider(com.projeto.clp.security.ProjetoCLPRestAuthenticationProvider){
		userDetailsService = ref('userDetailsService')
	}

	credentialsExtractor(com.projeto.clp.security.ProjetoCLPJsonPayloadCredencialsExtractor){
		
	}
	
	
}
