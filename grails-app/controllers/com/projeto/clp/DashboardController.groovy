package com.projeto.clp

import com.projeto.clp.type.EstadoOcorrenciaType

class DashboardController {

	def dashboardService
	def springSecurityService
	
    def index() { 

    	def usuario = springSecurityService.currentUser

    	def list = []

    	if(usuario instanceof Entidade){
    		list = dashboardService.getUnidadesNegocioPorEntidade()

    		return [maquinasUnidadeNegocioList: list,
			    	usuariosMoveisUnidadeNegocioList: list,
			    	ocorrenciasAbertasList: list,
			    	ocorrenciasFechadasList: list]
    	}
    	else if(usuario instanceof Administrador){
    		list = dashboardService.getEntidadesNegocio()

    		return [maquinasEntidadeList: list,
    				usuariosMoveisEntidadeNegocioList: list,
    				ocorrenciasAbertasList: list,
			    	ocorrenciasFechadasList: list]
    	}
    	
    }
}
