package com.projeto.clp

import type.DadoType;
import type.RegistradorType;

class RegistradorEscravo {
	
	EscravoMaquina escravoMaquina
	String identificador
	Integer tipo
	Integer tipoDado
	Integer endereco = new Integer(0)
	
	static belongsTo = [escravoMaquina: EscravoMaquina]

    static constraints = {
		identificador nullable: false, blank: false
		endereco range: 0..65535 
    }
	
	String toString(){
		"Id: ${identificador}, Endereco: ${endereco}, Tipo: ${RegistradorType.get(tipo).descricao}, Tipo Dado: ${DadoType.get(tipoDado).descricao}, Escravo:  [${escravoMaquina?.identificador}]"
	}
}
