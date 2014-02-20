package com.projeto.clp

class DispositivoMovel {
	
	String descricao
	
	static belongsTo = UsuarioMovel

    static constraints = {
		descricao blank:false, nullable: false
    }
	
	String toString(){
		descricao
	}
}
