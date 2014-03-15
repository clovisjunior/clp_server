package com.projeto.clp

class EscravoMaquina {
	
	Maquina maquina
	Integer escravoId
	String identificador
	String descricao
	Set registradores
	
	static belongsTo = [maquina: Maquina]
	static hasMany = [registradores: RegistradorEscravo]
	
    static constraints = {
		escravoId nullable: false, blank: false, range: 0..247
		identificador nullable: false, blank: false
		descricao nullable: true, blank: true
    }
	
	String toString(){
		"${identificador}(${escravoId}) [${maquina?.identificador}]"
	}
}
