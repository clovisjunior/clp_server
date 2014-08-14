import com.projeto.clp.*
import com.projeto.clp.type.DadoType
import com.projeto.clp.type.*

import grails.plugin.springsecurity.SpringSecurityUtils

class BootStrap {

    def init = { servletContext ->

		def adminPapel = new Papel(authority: 'ROLE_ADMIN').save(flush: true)
		def userPapel = new Papel(authority: 'ROLE_USER').save(flush: true)
		def userMovelPapel = new Papel(authority: 'ROLE_USER_MOVEL').save(flush: true)
		
		def administrador = new Administrador(username: 'admin', password: 'admin', email: 'clovisjunior2009@gmail.com')
		administrador.save(flush: true)
  
		UsuarioPapel.create administrador, adminPapel, true

		/*
		
		Entidade entidade = new Entidade(nome: 'Renault Brasil', username: 'entidade', password: '12345', email: 'clovisjunior2009@gmail.com', administrador: administrador)
		entidade.save(flush: true)

		administrador.addToEntidades(entidade)
		administrador.save(flush: true)
		
		UsuarioPapel.create entidade, userPapel, true
		
		UnidadeDeNegocio unidadeNegocio = new UnidadeDeNegocio(entidade: entidade, endereco: 'BR 277', nome: 'SJP')
		unidadeNegocio.addToDepartamentos(new Departamento(nome: 'Manuteção Carroçaria'))
		unidadeNegocio.save(flush: true) 
		
		Departamento departamento = Departamento.get(1)
		
		UsuarioMovel usuarioMovel1 = new UsuarioMovel(username: "usuario1", password: "123", email: "clovisjunior2009@gmail.com", departamento: departamento)
		usuarioMovel1.save flush: true
		
		UsuarioPapel.create usuarioMovel1, userMovelPapel, true
		
		Maquina maquina = new Maquina(localizacaoFisica: 'Piso L3', ip: 'localhost', modelo: 'XPTO', porta: 502, departamento: departamento, identificador: 'CLP_9019')
		maquina.save(flush: true)
		
		usuarioMovel1.maquinas = []
		usuarioMovel1.maquinas << maquina
		
		DispositivoMovel dispositivoMovel = new DispositivoMovel(descricao: "Nexus 4", imei: "000000000000000")		
		dispositivoMovel.save(flush: true)
		
		DispositivoMovel dispositivoMovel2 = new DispositivoMovel(descricao: "Tablet", imei: "1234567890")
		dispositivoMovel2.save(flush: true)
		
		DispositivoMovel dispositivoMovel3 = new DispositivoMovel(descricao: "Nexus 4", imei: "356489055985191")
		dispositivoMovel3.save(flush: true)
		
		usuarioMovel1.dispositivosMoveis = []
		usuarioMovel1.dispositivosMoveis << dispositivoMovel
		usuarioMovel1.dispositivosMoveis << dispositivoMovel3
		
		usuarioMovel1.save flush: true
		
		EscravoMaquina escravoMaquina = new EscravoMaquina(maquina: maquina, escravoId: 1, identificador: "IDX_01", descricao: "Maquiná PPP")
		escravoMaquina.save flush: true
		
		RegistradorEscravo registrador = new RegistradorEscravo(escravoMaquina: escravoMaquina, identificador: "Luz", tipo: RegistradorType.COIL_STATUS.id, tipoDado: DadoType.BINARY.id, endereco: 0)
		registrador.save flush: true
		
		RegistradorEscravo registrador2 = new RegistradorEscravo(escravoMaquina: escravoMaquina, identificador: "Temperatura", tipo: RegistradorType.HOLDING_REGISTER.id, tipoDado: DadoType.TWO_BYTE_INT_UNSIGNED.id, endereco: 0)
		registrador2.save flush: true
		
		Alarme alarme = new Alarme(maquina: maquina, escravoMaquina: escravoMaquina, registradorEscravo: registrador2, minimo: '20', maximo: '30', identificador: "Temperatura < 20 ou > 30")
		alarme.save flush: true
		
		Alarme alarme2 = new Alarme(maquina: maquina, escravoMaquina: escravoMaquina, registradorEscravo: registrador, minimo: '1', maximo: '1', identificador: "Luz desligada")
		alarme2.save flush: true		

		OcorrenciaAlarme ocorrencia1 = new OcorrenciaAlarme(motivoAlarme: "Motivo", solucaoAplicada: "Solucao", motivoAlarmeTecnico: "", usuarioMovel: usuarioMovel1, estado: EstadoOcorrenciaType.ABERTO, dataAbertura: new Date().minus(2), alarme: alarme2)
		OcorrenciaAlarme ocorrencia2 = new OcorrenciaAlarme(motivoAlarme: "Motivo", solucaoAplicada: "Solucao", motivoAlarmeTecnico: "", usuarioMovel: usuarioMovel1, estado: EstadoOcorrenciaType.ABERTO, dataAbertura: new Date().minus(2), alarme: alarme2)
		OcorrenciaAlarme ocorrencia3 = new OcorrenciaAlarme(motivoAlarme: "Motivo", solucaoAplicada: "Solucao", motivoAlarmeTecnico: "", usuarioMovel: usuarioMovel1, estado: EstadoOcorrenciaType.FECHADO, dataAbertura: new Date().minus(2), alarme: alarme2)

		OcorrenciaAlarme ocorrencia4 = new OcorrenciaAlarme(motivoAlarme: "Motivo", solucaoAplicada: "Solucao", motivoAlarmeTecnico: "", usuarioMovel: usuarioMovel1, estado: EstadoOcorrenciaType.ABERTO, dataAbertura: new Date().minus(1), alarme: alarme2)
		OcorrenciaAlarme ocorrencia5 = new OcorrenciaAlarme(motivoAlarme: "Motivo", solucaoAplicada: "Solucao", motivoAlarmeTecnico: "", usuarioMovel: usuarioMovel1, estado: EstadoOcorrenciaType.ABERTO, dataAbertura: new Date().minus(1), alarme: alarme2)
		OcorrenciaAlarme ocorrencia6 = new OcorrenciaAlarme(motivoAlarme: "Motivo", solucaoAplicada: "Solucao", motivoAlarmeTecnico: "", usuarioMovel: usuarioMovel1, estado: EstadoOcorrenciaType.FECHADO, dataAbertura: new Date().minus(1), alarme: alarme2)
		OcorrenciaAlarme ocorrencia7 = new OcorrenciaAlarme(motivoAlarme: "Motivo", solucaoAplicada: "Solucao", motivoAlarmeTecnico: "", usuarioMovel: usuarioMovel1, estado: EstadoOcorrenciaType.FECHADO, dataAbertura: new Date().minus(1), alarme: alarme2)

		OcorrenciaAlarme ocorrencia8 = new OcorrenciaAlarme(motivoAlarme: "Motivo", solucaoAplicada: "Solucao", motivoAlarmeTecnico: "", usuarioMovel: usuarioMovel1, estado: EstadoOcorrenciaType.ABERTO, dataAbertura: new Date(), alarme: alarme)
		OcorrenciaAlarme ocorrencia9 = new OcorrenciaAlarme(motivoAlarme: "Motivo", solucaoAplicada: "Solucao", motivoAlarmeTecnico: "", usuarioMovel: usuarioMovel1, estado: EstadoOcorrenciaType.ABERTO, dataAbertura: new Date(), alarme: alarme)
		OcorrenciaAlarme ocorrencia10 = new OcorrenciaAlarme(motivoAlarme: "Motivo", solucaoAplicada: "Solucao", motivoAlarmeTecnico: "", usuarioMovel: usuarioMovel1, estado: EstadoOcorrenciaType.ABERTO, dataAbertura: new Date(), alarme: alarme)

		ocorrencia1.save(flush: true)
		ocorrencia2.save(flush: true)
		ocorrencia3.save(flush: true)
		ocorrencia4.save(flush: true)
		ocorrencia5.save(flush: true)
		ocorrencia6.save(flush: true)
		ocorrencia7.save(flush: true)
		ocorrencia8.save(flush: true)
		ocorrencia9.save(flush: true)
		ocorrencia10.save(flush: true)
		*/
		
    }
    def destroy = {
    }
}
