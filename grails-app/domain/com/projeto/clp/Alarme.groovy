package com.projeto.clp

class Alarme {

	Maquina maquina
	EscravoMaquina escravoMaquina
	RegistradorEscravo registradorEscravo
	String minimo
	String maximo
	String identificador
	
	//Set ocorrencias
	
	static hasMany = [ocorrencias: OcorrenciaAlarme]
	static belongsTo = [maquina: Maquina]
	
    static constraints = {
		maquina nullable: false
		registradorEscravo nullable: false 
		escravoMaquina nullable: false
		identificador nullable: false
    }
	
	String toString(){
		"${registradorEscravo}, Minimo: ${minimo}, Maximo, ${maximo}"
	}
}
