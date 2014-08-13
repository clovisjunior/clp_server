package com.projeto.clp

import com.projeto.clp.type.EstadoOcorrenciaType

import grails.transaction.Transactional

@Transactional
class DashboardService {

	def springSecurityService

    def getUnidadesNegocioPorEntidade() {

    	def usuario = springSecurityService.currentUser

    	def unidades = UnidadeDeNegocio.findAllByEntidade(usuario)

    	return unidades

    }

    def getEntidadesNegocio() {
    	def usuario = springSecurityService.currentUser

    	def entidades = Entidade.findAllByAdministrador(usuario)

    	return entidades
    }
}
