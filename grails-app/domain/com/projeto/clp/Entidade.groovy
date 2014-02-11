package com.projeto.clp

class Entidade {
	
	String nome
	String usuario
	String senha
	Set unidadesNegocios
	
	static hasMany = [unidadesNegocios: UnidadeDeNegocio]

    static constraints = {
		nome nullable: false, blank: false
		usuario nullable: false, blank: false, unique: true, size: 5..15
		senha nullable: false, blank: false, size: 5..15, password: true
    }
	
	String toString(){
		nome
	}
}
