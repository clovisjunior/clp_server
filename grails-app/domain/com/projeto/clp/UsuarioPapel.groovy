package com.projeto.clp

import org.apache.commons.lang.builder.HashCodeBuilder

class UsuarioPapel implements Serializable{

    private static final long serialVersionUID = 1

	Usuario usuario
	Papel papel

	boolean equals(other) {
		if (!(other instanceof UsuarioPapel)) {
			return false
		}

		other.usuario?.id == usuario?.id &&
			other.papel?.id == papel?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (usuario) builder.append(usuario.id)
		if (papel) builder.append(papel.id)
		builder.toHashCode()
	}

	static UsuarioPapel get(long usuarioId, long papelId) {
		UsuarioPapel.where {
			usuario == Usuario.load(usuarioId) &&
			papel == Papel.load(papelId)
		}.get()
	}

	static UsuarioPapel create(Usuario usuario, Papel papel, boolean flush = false) {
		new UsuarioPapel(usuario: usuario, papel: papel).save(flush: flush, insert: true)
	}

	static boolean remove(Usuario u, Papel r, boolean flush = false) {

		int rowCount = UsuarioPapel.where {
			usuario == Usuario.load(u.id) &&
			papel == Papel.load(r.id)
		}.deleteAll()

		rowCount > 0
	}

	static void removeAll(Usuario u) {
		Usuario.where {
			Usuario == Usuario.load(u.id)
		}.deleteAll()
	}

	static void removeAll(Papel r) {
		UsuarioPapel.where {
			papel == Papel.load(r.id)
		}.deleteAll()
	}

	static mapping = {
		id composite: ['papel', 'usuario']
		version false
	}
}
