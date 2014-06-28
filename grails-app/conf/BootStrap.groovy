import com.projeto.clp.Administrador
import com.projeto.clp.Departamento
import com.projeto.clp.Entidade
import com.projeto.clp.Papel
import com.projeto.clp.UnidadeDeNegocio
import com.projeto.clp.UsuarioPapel
import com.projeto.clp.Maquina

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
		
		Departamento departamento = Departamento.get(1)

		Maquina maquina = new Maquina(localizacaoFisica: 'Piso L3', ip: '192.168.0.7', modelo: 'XPTO', porta: 502, departamento: departamento, identificador: 'CLP_9019')
		maquina.save(flush: true)

    }
    def destroy = {
    }
}
