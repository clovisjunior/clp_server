package com.projeto.clp

class UnidadeDeNegocio {
	
	String nome
	String endereco
	
	Entidade entidade
	
	static belongsTo = [entidade: Entidade]
	static hasMany = [departamentos: Departamento]

    static constraints = {
		nome nullable: false, blank: false
		endereco nullable: true, blank: true
    }
	
	String toString(){
		"${nome} [${entidade?.nome}]"
	}
}
