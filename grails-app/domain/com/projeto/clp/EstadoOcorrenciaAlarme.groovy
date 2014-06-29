package com.projeto.clp

class EstadoOcorrenciaAlarme {
	
	String descricao

    static constraints = {
		descricao blank:false, nullable: false
    }
	
	String toString() {
		descricao
	}
}
