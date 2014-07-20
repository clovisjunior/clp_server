package com.projeto.clp

class UsuarioMovel extends Usuario {
	
	Departamento departamento
		
	static belongsTo = [departamento: Departamento]
	static hasMany = [maquinas: Maquina, dispositivosMoveis: DispositivoMovel ]

	static mappings = {
		dispositivosMoveis lazy: false
	}

    static constraints = {
    }
	
	
	String toString(){
		"${username} [${departamento?.nome}]"
	}
}
