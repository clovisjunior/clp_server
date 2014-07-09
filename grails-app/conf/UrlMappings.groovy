class UrlMappings {

	static mappings = {
        
		"/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
		
		"/api/maquina"{
			controller = "apiMaquina"
			action = "index"
		}
		
		"/api/maquina/$id"{
			controller = "apiMaquina"
			action = "escravos"
		}
		
		"/api/maquina/$id/escravo/$idEscravo"{
			controller = "apiMaquina"
			action = "registradores"
		}
		
        "/"(view:"/index")
		"500"(view:'/500_error')
		"404"(view:'/404_error')
	}
}
