package com.projeto.clp

import java.util.Set;

class Usuario implements Serializable{
	
	transient springSecurityService

	String username
	String password
	String email
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static transients = ['springSecurityService']
	
	static constraints = {
		username blank: false, unique: true
		password blank: false
		email blank: false, nullable: false, email: true
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Papel> getAuthorities() {
		UsuarioPapel.findAllByUsuario(this).collect { it.papel } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
