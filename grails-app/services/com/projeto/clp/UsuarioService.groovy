package com.projeto.clp

import grails.transaction.Transactional

@Transactional
class UsuarioService {

	def springSecurityService

    def getUnidadesDeNegocio(Map params) {

    	def entidade = getEntidadeLogado()

        def unidadesNegocios = UnidadeDeNegocio.findAllByEntidade(entidade, params)

        return unidadesNegocios

    }

    def getUnidadesDeNegocioCount() {
    	def entidade = getEntidadeLogado()

        def qtde = UnidadeDeNegocio.countByEntidade(entidade)

        return qtde
    }

    def getMaquinas(Map params){
		def entidade = getEntidadeLogado()

		def criteria = Maquina.createCriteria()

		def maquinas = criteria.list {
			departamento{
				unidadeNegocio{
					eq("entidade", entidade)
				}
			}

			if(params?.offset){
				firstResult(params.offset as Integer)
			}

			if(params?.max){
				maxResults(params.max as Integer)
			}

			if(params?.sort && params?.order){
				order(params.sort, params.order)
			}

		}

		return maquinas

    }

    def getMaquinasCount() {

    	def entidade = getEntidadeLogado()

		def criteria = Maquina.createCriteria()

		def qtde = criteria.get {
			departamento{
				unidadeNegocio{
					eq("entidade", entidade)
				}
			}
			projections {
		        count "id"
		    }
			
		}

		return qtde

    }

    def getDepartamentos(Map params) {
    	def entidade = getEntidadeLogado()

    	def criteria = Departamento.createCriteria()

		def departamentos = criteria.list {
			unidadeNegocio{
				eq("entidade", entidade)
			}

			if(params?.offset){
				firstResult(params.offset as Integer)
			}

			if(params?.max){
				maxResults(params.max as Integer)
			}

			if(params?.sort && params?.order){
				order(params.sort, params.order)
			}
		}

		return departamentos

    }

    def getDepartamentosCount() {
    	def entidade = getEntidadeLogado()

		def criteria = Departamento.createCriteria()

		def qtde = criteria.get {
			unidadeNegocio{
				eq("entidade", entidade)
			}
			projections {
		        count "id"
		    }
			
		}

		return qtde
    }

    def getDispositivosMoveis(Map params) {
    	def entidade = getEntidadeLogado()

    	def criteria = DispositivoMovel.createCriteria()

		def dispositivosMoveis = criteria.list {
			departamento{
				unidadeNegocio{
					eq("entidade", entidade)
				}
			}

			if(params?.offset){
				firstResult(params.offset as Integer)
			}

			if(params?.max){
				maxResults(params.max as Integer)
			}

			if(params?.sort && params?.order){
				order(params.sort, params.order)
			}
		}

		return dispositivosMoveis
    }

    def getDispositivosMoveisCount() {

    	def entidade = getEntidadeLogado()

    	def criteria = DispositivoMovel.createCriteria()

		def qtde = criteria.get {
			departamento{
				unidadeNegocio{
					eq("entidade", entidade)
				}
			}
			projections {
		        count "id"
		    }
		}

		return qtde

    }

    def getUsuariosMoveis(Map params) {
		def entidade = getEntidadeLogado()

    	def criteria = UsuarioMovel.createCriteria()

		def usuariosMoveis = criteria.list {
			departamento{
				unidadeNegocio{
					eq("entidade", entidade)
				}
			}

			if(params?.offset){
				firstResult(params.offset as Integer)
			}

			if(params?.max){
				maxResults(params.max as Integer)
			}

			if(params?.sort && params?.order){
				order(params.sort, params.order)
			}
		}

		return usuariosMoveis
    }

    def getUsuariosMoveisCount() {
    	def entidade = getEntidadeLogado()

    	def criteria = UsuarioMovel.createCriteria()

		def qtde = criteria.get {
			departamento{
				unidadeNegocio{
					eq("entidade", entidade)
				}
			}
			projections {
		        count "id"
		    }
		}

		return qtde
    }

    def getAlarmes(Map params) {
		def entidade = getEntidadeLogado()

    	def criteria = Alarme.createCriteria()

		def alarmes = criteria.list {
			maquina{
				departamento{
					unidadeNegocio{
						eq("entidade", entidade)
					}
				}
			}

			if(params?.offset){
				firstResult(params.offset as Integer)
			}

			if(params?.max){
				maxResults(params.max as Integer)
			}

			if(params?.sort && params?.order){
				order(params.sort, params.order)
			}
		}

		return alarmes
    }

    def getAlarmesCount() {

    	def entidade = getEntidadeLogado()

    	def criteria = Alarme.createCriteria()

		def qtde = criteria.get {
			maquina{
				departamento{
					unidadeNegocio{
						eq("entidade", entidade)
					}
				}
			}
			projections {
		        count "id"
		    }
		}

    }

    def getOcorrencias(Map params) {
		def entidade = getEntidadeLogado()

    	def criteria = OcorrenciaAlarme.createCriteria()

		def ocorrencias = criteria.list {
			alarme {
				maquina{
					departamento{
						unidadeNegocio{
							eq("entidade", entidade)
						}
					}
				}
			}

			if(params?.offset){
				firstResult(params.offset as Integer)
			}

			if(params?.max){
				maxResults(params.max as Integer)
			}

			if(params?.sort && params?.order){
				order(params.sort, params.order)
			}
		}

		return ocorrencias
    }

    def getOcorrenciasCount() {
		def entidade = getEntidadeLogado()

    	def criteria = OcorrenciaAlarme.createCriteria()

		def qtde = criteria.get {
			alarme {
				maquina{
					departamento{
						unidadeNegocio{
							eq("entidade", entidade)
						}
					}
				}
			}
			projections {
		        count "id"
		    }
		}
    }

    def getEntidadeLogado(){
    	return springSecurityService.currentUser
    }
}
