package com.projeto.clp

class Departamento {
	
	String nome
	UnidadeDeNegocio unidadeNegocio
	
	Set maquinas
	
	static belongsTo = [unidadeNegocio: UnidadeDeNegocio]
	static hasMany = [maquinas: Maquina]

    static constraints = {
		nome nullable: false, blank: false
    }
	
	String toString(){
		"${nome} [${unidadeNegocio?.nome}]"
	}
}
