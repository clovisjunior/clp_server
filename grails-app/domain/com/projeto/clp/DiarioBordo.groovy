package com.projeto.clp

class DiarioBordo {

	Maquina maquina
	UsuarioMovel usuarioMovel
	Date dataHora
	String descricao
	Set fotos

	static belongsTo = [maquina: Maquina]
	static hasMany = [fotos: Foto]

    static constraints = {
    }
}
