package com.projeto.clp.type

enum EstadoOcorrenciaType {

	ABERTO(0, "Aberto"),  
	FECHADO(1, "Fechado")

	private final Integer id
	private final String descricao

	EstadoOcorrenciaType(Integer id, String descricao){
		this.id = id
		this.descricao = descricao
	}

	static EstadoOcorrenciaType[] list(){
		[ABERTO,  FECHADO]
	}
	
	static get(Integer id){
		return values().find{it.id == id}
	}

	public String descricao(){
		return descricao
	}

	public Integer id(){
		return id
	}
}
