package com.projeto.clp

class UsuarioMovel {
	
	String usuario
	String senha
	
	Departamento departamento
	Set maquinas
	//Set dispositivosMoveis
	
	static belongsTo = [departamento: Departamento]
	static hasMany = [maquinas: Maquina
					 //, dispositivosMoveis: DispositivoMovel
					 ]

    static constraints = {
		usuario nullable: false, blank: false, unique: true
		senha nullalbe: false, blank: false, password: true
    }
	
	String toString(){
		"${usuario} [${departamento?.nome}]"
	}
}
