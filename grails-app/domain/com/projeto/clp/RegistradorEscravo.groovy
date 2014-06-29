package com.projeto.clp

import type.DadoType;
import type.RegistradorType;

class RegistradorEscravo {
	
	EscravoMaquina escravoMaquina
	Integer tipo
	Integer tipoDado
	Integer endereco = new Integer(0)
	
	static belongsTo = [escravoMaquina: EscravoMaquina]

    static constraints = {
		endereco range: 0..65535 
    }
	
	String toString(){
		"Endereco: ${endereco}, Tipo: ${RegistradorType.get(tipo).descricao}, Tipo Dado: ${DadoType.get(tipoDado).descricao}, Escravo:  [${escravoMaquina?.identificador}]"
	}
}
