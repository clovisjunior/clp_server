package com.projeto.clp

class Administrador extends Usuario{
	
	Set entidades
	
	static hasMany = [entidades: Entidade]
	
	static constraints = {
	}
	
	String toString(){
		username
	}
}
