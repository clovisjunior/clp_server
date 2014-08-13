package com.projeto.clp

class UnidadeDeNegocio {
	
	String nome
	String endereco
	
	Entidade entidade
	
	//Set departamentos
	
	static belongsTo = [entidade: Entidade]
	static hasMany = [departamentos: Departamento]

    static constraints = {
		nome nullable: false, blank: false
    }
	
	String toString(){
		"${nome} [${entidade?.nome}]"
	}
}
