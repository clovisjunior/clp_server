package com.projeto.clp

import java.util.ArrayList
import java.util.List

import com.serotonin.modbus4j.ModbusFactory
import com.serotonin.modbus4j.ModbusMaster
import com.serotonin.modbus4j.code.DataType
import com.serotonin.modbus4j.code.RegisterRange
import com.serotonin.modbus4j.exception.ModbusInitException
import com.serotonin.modbus4j.ip.IpParameters

import grails.transaction.Transactional

import com.serotonin.modbus4j.exception.ModbusInitException

import com.projeto.clp.type.DadoType

import com.projeto.clp.Maquina

@Transactional
class ModbusService {

	boolean testarConexao(Maquina maquina){
		
		def master = init(maquina)

        try {
            master.init()
			return true
        }
		catch(ModbusInitException e){
			return false
		}
        finally {
            master.destroy()
        }
		
		return false
	}
	
	def pesquisarEscravos(Maquina maquina){
		
		ModbusMaster master = init(maquina)
		
		try {
			master.init()
			
			//def escravos = master.scanForSlaveNodes()
			
			def escravos = []
			(1..7).each{
				if(master.testSlaveNode(it)){
					escravos << it
				}
			}
			
			return escravos
		}
		catch(Exception e){
			return null
		}
		finally {
			master.destroy()
		}
		
		return null
		
	}
	
	def lerDadoRegistrador(RegistradorEscravo registrador){
		ModbusMaster master = init(registrador?.escravoMaquina?.maquina)
		
		try {
			master.init()
			
			return master.getValue(registrador.escravoMaquina.escravoId, registrador.tipo, registrador.endereco, registrador.tipoDado)
			
		}
		catch(ModbusInitException e){
			return "Offline"
		}
		catch(Exception e){				
			return e.message
		}
		finally {
			master.destroy()
		}
		
		return null
	}

	def atualizarValorRegistrador(RegistradorEscravo registrador, Object novoValor){
		ModbusMaster master = init(registrador?.escravoMaquina?.maquina)
		
		try {
			master.init()

			master.setValue(registrador.escravoMaquina.escravoId, registrador.tipo, 
							registrador.endereco, 
							registrador.tipoDado, 
							getTipoValor(registrador, novoValor));

			return true
			
		}
		catch(ModbusInitException e){
			return "Offline"
		}
		catch(Exception e){			
			return false
		}
		finally {
			master.destroy()
		}
		
		return false
	}
	
	ModbusMaster init(Maquina maquina){
		ModbusFactory factory = new ModbusFactory()
		
		IpParameters params = new IpParameters()
		params.setHost(maquina.ip)
		params.setPort(maquina.porta)
		params.setEncapsulated(maquina.isEncapsulado)
		ModbusMaster master = factory.createTcpMaster(params, true)
		
		master.setRetries(0)
		master.setTimeout(2000)
		
		return master
	}

	def getTipoValor(RegistradorEscravo registrador, Object valor){

		//Inteiros
		if(registrador.tipoDado == DadoType.TWO_BYTE_INT_UNSIGNED.id
			|| registrador.tipoDado == DadoType.TWO_BYTE_INT_SIGNED.id
			|| registrador.tipoDado == DadoType.FOUR_BYTE_INT_UNSIGNED.id
			|| registrador.tipoDado == DadoType.FOUR_BYTE_INT_SIGNED.id
			|| registrador.tipoDado == DadoType.FOUR_BYTE_INT_UNSIGNED_SWAPPED.id
			|| registrador.tipoDado == DadoType.FOUR_BYTE_INT_SIGNED_SWAPPED.id) {
			
			valor = valor as Integer
		
		}
		else{
			//Binario
			if(registrador.tipoDado == DadoType.BINARY.id) {
				
				if(valor == "true" || valor == "TRUE" || valor == "1"){
					valor = Boolean.TRUE
				}
				else{
					return Boolean.FALSE	
				}						
				
			}
			else{
				//Floats
				if(registrador.tipoDado == DadoType.FOUR_BYTE_FLOAT.id
					|| registrador.tipoDado == DadoType.FOUR_BYTE_FLOAT_SWAPPED.id
					|| registrador.tipoDado == DadoType.EIGHT_BYTE_INT_UNSIGNED.id
					|| registrador.tipoDado == DadoType.EIGHT_BYTE_INT_SIGNED.id
					|| registrador.tipoDado == DadoType.EIGHT_BYTE_INT_UNSIGNED_SWAPPED.id
					|| registrador.tipoDado == DadoType.EIGHT_BYTE_INT_SIGNED_SWAPPED.id
					|| registrador.tipoDado == DadoType.EIGHT_BYTE_FLOAT.id
					|| registrador.tipoDado == DadoType.EIGHT_BYTE_FLOAT_SWAPPED.id){
					
					valor = valor as Float
					
				}
			}
			
		}

		return valor
	}
	
	
}
