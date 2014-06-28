package com.projeto.clp

class Maquina {
	
	String localizacaoFisica
	String ip
	String modelo
	String identificador
	Integer porta = new Integer(502)
	Boolean isEncapsulado = Boolean.FALSE;
	
	Departamento departamento
	
	Set escravos
	
	static belongsTo = [departamento: Departamento]
	static hasMany = [escravos: EscravoMaquina]

    static constraints = {
		localizacaoFisica nullable: true, blank: true
		ip nullable: false, blank: false
		isEncapsulado nullable: false 
		modelo nullable: false, blank: false
		identificador nullable: false, blank: false, unique: true
		porta min:0, max: 65535
    }
	
	String toString(){
		"${identificador} [${departamento?.nome}]"
	}
}
