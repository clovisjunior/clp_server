package com.projeto.clp

class Alarme {

	Maquina maquina
	EscravoMaquina escravoMaquina
	RegistradorEscravo registradorEscravo
	String minimo
	String maximo
	
	Set ocorrencias
	
	static hasMany = [ocorrencias: OcorrenciaAlarme]
	
    static constraints = {
		maquina nullable: false
		registradorEscravo nullable: false 
		escravoMaquina nullable: false
    }
	
	String toString(){
		"${registradorEscravo}, Minimo: ${minimo}, Maximo, ${maximo}"
	}
}
