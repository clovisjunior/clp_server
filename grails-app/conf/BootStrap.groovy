import java.util.Set;

import type.DadoType;
import type.RegistradorType;

import com.projeto.clp.*

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
		
		EscravoMaquina escravoMaquina = new EscravoMaquina(maquina: maquina, escravoId: 1, identificador: "IDX_01", descricao: "Maquiná PPP")
		escravoMaquina.save flush: true
		
		RegistradorEscravo registrador = new RegistradorEscravo(escravoMaquina: escravoMaquina, identificador: "Luz", tipo: RegistradorType.COIL_STATUS.id, tipoDado: DadoType.BINARY.id, endereco: 0)
		registrador.save flush: true
		
		RegistradorEscravo registrador2 = new RegistradorEscravo(escravoMaquina: escravoMaquina, identificador: "Temperatura", tipo: RegistradorType.HOLDING_REGISTER.id, tipoDado: DadoType.TWO_BYTE_INT_UNSIGNED.id, endereco: 0)
		registrador2.save flush: true
		
		Alarme alarme = new Alarme(maquina: maquina, escravoMaquina: escravoMaquina, registradorEscravo: registrador2, minimo: '20', maximo: '30')
//		alarme.save flush: true
		
		Alarme alarme2 = new Alarme(maquina: maquina, escravoMaquina: escravoMaquina, registradorEscravo: registrador, minimo: '0', maximo: '0')
//		alarme2.save flush: true

		EstadoOcorrenciaAlarme estado1 = new EstadoOcorrenciaAlarme(descricao: "Aberto")
		estado1.save flush: true
		
		EstadoOcorrenciaAlarme estado2 = new EstadoOcorrenciaAlarme(descricao: "Fechado")
		estado2.save flush: true
		
		
    }
    def destroy = {
    }
}
