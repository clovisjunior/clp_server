package com.projeto.clp

import type.DadoType;

import com.projeto.clp.Alarme;
import com.projeto.clp.EstadoOcorrenciaAlarme;
import com.projeto.clp.UsuarioMovel;

class AlarmeJob {

	def modbusService
	def ocorrenciaService
		
    static triggers = {
		simple name: "alarmeTrigger", startDelay: 5000, repeatInterval: 500l
    }
	
	def group = "Alarmes"
	def description = "Job para verificar alarmes"

    def execute() {
        
		def alarmes = Alarme.findAll()
		
		alarmes.each{ alarme ->
			
			def registrador = alarme.registradorEscravo
			
			def valor = modbusService.lerDadoRegistrador(registrador)
			
			//Inteiros
			if(registrador.tipoDado == DadoType.TWO_BYTE_INT_UNSIGNED.id
				|| registrador.tipoDado == DadoType.TWO_BYTE_INT_SIGNED.id
				|| registrador.tipoDado == DadoType.FOUR_BYTE_INT_UNSIGNED.id
				|| registrador.tipoDado == DadoType.FOUR_BYTE_INT_SIGNED.id
				|| registrador.tipoDado == DadoType.FOUR_BYTE_INT_UNSIGNED_SWAPPED.id
				|| registrador.tipoDado == DadoType.FOUR_BYTE_INT_SIGNED_SWAPPED.id) {
				
				valor = valor as Integer
				
				if(valor < (alarme.minimo as Integer) || valor > (alarme.maximo as Integer)){
					ocorrenciaService.criarOcorrencia(alarme, valor)
				}
			}
			else{
				//Binario
				if(registrador.tipoDado == DadoType.BINARY.id) {
					
					valor = valor as Boolean
					
					if(valor == (alarme.minimo as Boolean)){
						ocorrenciaService.criarOcorrencia(alarme, valor)
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
						
						if(valor < (alarme.minimo as Float) || valor > (alarme.maximo as Float)){
							ocorrenciaService.criarOcorrencia(alarme, valor)
						}
					}
				}
				
			}
			
		}
		
    }
	
}
