import com.projeto.clp.Administrador
import com.projeto.clp.Departamento
import com.projeto.clp.Entidade
import com.projeto.clp.Papel
import com.projeto.clp.UnidadeDeNegocio
import com.projeto.clp.UsuarioPapel

class BootStrap {

    def init = { servletContext ->
		
		def adminPapel = new Papel(authority: 'ROLE_ADMIN').save(flush: true)
		def userPapel = new Papel(authority: 'ROLE_USER').save(flush: true)
  
		def administrador = new Administrador(username: 'admin', password: 'admin', email: 'clovisjunior2009@gmail.com')
		administrador.save(flush: true)
  
		UsuarioPapel.create administrador, adminPapel, true
		
		Entidade entidade = new Entidade(nome: 'Renault Brasil', username: 'entidade', password: '12345', email: 'clovisjunior2009@gmail.com')
		entidade.save(flush: true)
		
		UsuarioPapel.create entidade, userPapel, true
		
		UnidadeDeNegocio unidadeNegocio = new UnidadeDeNegocio(entidade: entidade, endereco: 'BR 277', nome: 'SJP')
		unidadeNegocio.addToDepartamentos(new Departamento(nome: 'Manuteção Carroçaria'))
		unidadeNegocio.save(flush: true) 
		
    }
    def destroy = {
    }
}
