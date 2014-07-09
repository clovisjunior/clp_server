package com.projeto.clp

import com.projeto.clp.type.*;

class RegistradorEscravo {
	
	EscravoMaquina escravoMaquina
	String identificador
	Integer tipo
	Integer tipoDado
	Integer endereco = new Integer(0)
	String valor
	
	static belongsTo = [escravoMaquina: EscravoMaquina]

    static constraints = {
		identificador nullable: false, blank: false
		endereco range: 0..65535 
		valor nullable: true, blank: true
    }
	
	String toString(){
		"Id: ${identificador}, Endereco: ${endereco}, Tipo: ${RegistradorType.get(tipo).descricao}, Tipo Dado: ${DadoType.get(tipoDado).descricao}, Escravo:  [${escravoMaquina?.identificador}]"
	}
}
