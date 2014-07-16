package com.projeto.clp

class Foto {

	byte[] imagem

    static constraints = {
    	 imagem(maxSize: 1024 * 1024)
    }
}
