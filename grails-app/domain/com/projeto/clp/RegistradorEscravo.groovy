package com.projeto.clp

import type.DadoType;
import type.RegistradorType;

class RegistradorEscravo {
	
	EscravoMaquina escravoMaquina
	Integer tipo
	Integer tipoDado
	Integer offset = new Integer(0)
	
	static belongsTo = [escravoMaquina: EscravoMaquina]

    static constraints = {
		offset range: 0..65535 
    }
	
	String toString(){
		"${tipo} - ${tipoDado} offset: ${offset} [${escravoMaquina?.identificador}]"
	}
}
