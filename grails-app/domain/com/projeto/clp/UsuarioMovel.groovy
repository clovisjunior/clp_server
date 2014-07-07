package com.projeto.clp

class UsuarioMovel extends Usuario {
	
	Departamento departamento
	Set maquinas
	Set dispositivosMoveis
	
	static belongsTo = [departamento: Departamento]
	static hasMany = [
						maquinas: Maquina,
						dispositivosMoveis: DispositivoMovel
					 ]

    static constraints = {
    }
	
	String toString(){
		"${username} [${departamento?.nome}]"
	}
}
