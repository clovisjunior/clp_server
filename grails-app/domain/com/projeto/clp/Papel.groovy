package com.projeto.clp

import java.io.Serializable;

class Papel implements Serializable{

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
