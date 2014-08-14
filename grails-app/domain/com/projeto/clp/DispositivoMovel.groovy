package com.projeto.clp

class DispositivoMovel {
	
	String descricao
	String imei
	String gcmId

	static belongsTo = [departamento: Departamento]
	
    static constraints = {
		descricao blank: false, nullable: false
		imei blank: false, nullable: false
		gcmId blank: true, nullable: true
    }
	
	String toString(){
		"${descricao} [${imei}]"
	}
}
