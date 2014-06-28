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
		catch(ModbusInitException e){
			return null
		}
		finally {
			master.destroy()
		}
		
		return null
		
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
	
}
