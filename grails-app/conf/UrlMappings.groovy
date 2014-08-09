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

		"/api/maquina/$id/escravo/$idEscravo/registrador/$idRegistrador/novovalor/$valor"{
			controller = "apiMaquina"
			action = "atualizarValorRegistrador"
		}

		"/api/maquina/$id/diariobordo"{
			controller = "apiMaquina"
			action = "salvarDiarioBordo"
		}

		"/api/dispositivo/$imei/gcm"{
			controller = "apiDispositivo"
			action = "registrarGCM"
		}

		"/api/ocorrencia/pendentes"{
			controller = "apiOcorrencia"
			action = "pendentes"
		}

		"/api/ocorrencia/aceitar/$id"{
			controller = "apiOcorrencia"
			action = "aceitar"
		}

		"/api/ocorrencia/caixaEntrada"{
			controller = "apiOcorrencia"
			action = "caixaEntrada"
		}

		"/api/ocorrencia/finalizar/$id"{
			controller = "apiOcorrencia"
			action = "finalizar"
		}	
		
        "/"(view:"/index")
		"500"(view:'/500_error')
		"404"(view:'/404_error')
	}
}
