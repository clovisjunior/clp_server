package com.projeto.clp

class MaquinaPorta {
	
	Maquina maquina
	Integer endereco
	String identificador
	String descricao
	Boolean apenasLeitura = Boolean.FALSE
	String tipoValor
	
	static belongsTo = [maquina: Maquina]

    static constraints = {
    }
	
	String toString(){
		"${identificador} [${maquina?.identificador}]"
	}
}
