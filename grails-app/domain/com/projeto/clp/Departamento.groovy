package com.projeto.clp

class Departamento {
	
	String nome
	UnidadeDeNegocio unidadeNegocio
	
	//Set maquinas
	//Set usuariosMoveis
	
	static belongsTo = [unidadeNegocio: UnidadeDeNegocio]
	static hasMany = [maquinas: Maquina,
					  usuariosMoveis: UsuarioMovel,
					  dispositivosMoveis: DispositivoMovel]

    static constraints = {
		nome nullable: false, blank: false
    }
	
	String toString(){
		"${nome} [${unidadeNegocio?.nome}]"
	}
}
