package com.projeto.clp

class Maquina {
	
	String localizacaoFisica
	String ip
	String modelo
	String identificador
	
	Departamento departamento
	
	Set portas
	
	static belongsTo = [departamento: Departamento]
	static hasMany = [portas: MaquinaPorta]

    static constraints = {
		localizacaoFisica nullable: true, blank: true
		ip nullable: false, blank: false
		modelo nullable: false, blank: false
		identificador nullable: false, blank: false, unique: true
    }
	
	String toString(){
		"${identificador} [${departamento?.nome}]"
	}
}
