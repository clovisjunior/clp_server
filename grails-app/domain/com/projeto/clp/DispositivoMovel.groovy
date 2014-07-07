package com.projeto.clp

class DispositivoMovel {
	
	String descricao
	String imei
	
    static constraints = {
		descricao blank: false, nullable: false
		imei blank: false, nullable: false
    }
	
	String toString(){
		"${descricao} [${imei}]"
	}
}
