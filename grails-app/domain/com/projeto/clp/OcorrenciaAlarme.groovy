package com.projeto.clp

class OcorrenciaAlarme {
	
	String motivoAlarme
	String solucaoAplicada
	UsuarioMovel usuarioMovel
	EstadoOcorrenciaAlarme estado
	
	static belongsTo = [alarme: Alarme]

    static constraints = {
		usuarioMovel nullable: true
		motivoAlarme nullable: false, blank: false
		solucaoAplicada blank:true,  nullable: true
		estado nullable: false 
    }
	
	String toString(){
		"Alarme: ${alarme}, Motivo: ${motivoAlarme}, Estado: ${estado}"
	}
}
