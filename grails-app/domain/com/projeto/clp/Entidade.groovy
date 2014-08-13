package com.projeto.clp

class Entidade extends Usuario {
	
	String nome
	Set unidadesNegocios

	static belongsTo = [administrador: Administrador]
	
	static hasMany = [unidadesNegocios: UnidadeDeNegocio]

    static constraints = {
		nome nullable: false, blank: false
    }
	
	String toString(){
		nome
	}
}
