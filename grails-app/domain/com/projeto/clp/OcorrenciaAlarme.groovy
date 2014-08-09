package com.projeto.clp

class OcorrenciaAlarme {
	
	String motivoAlarme
	String solucaoAplicada
	String motivoAlarmeTecnico
	UsuarioMovel usuarioMovel
	EstadoOcorrenciaAlarme estado
	Set fotos

	static belongsTo = [alarme: Alarme]
	static hasMany = [fotos: Foto]

    static constraints = {
		usuarioMovel nullable: true
		motivoAlarme nullable: false, blank: false
		motivoAlarmeTecnico nullable: true, blank: true
		solucaoAplicada blank:true,  nullable: true
		estado nullable: false 
    }

	String toString(){
		"Alarme: ${alarme}, Motivo: ${motivoAlarme}, Estado: ${estado}"
	}
}
