package com.projeto.clp

import com.projeto.clp.type.EstadoOcorrenciaType

class OcorrenciaTagLib {
    static defaultEncodeAs = 'html'
    //static encodeAsForTags = [tagName: 'raw']

    static namespace = 'ocorrencia'

    def ocorrenciaService

    def quantidadeAbertas = {attrs ->
    	out << ocorrenciaService.quantidadeOcorrencias(EstadoOcorrenciaType.ABERTO)
    }

    def quantidadeFechadas = {attrs ->
    	out << ocorrenciaService.quantidadeOcorrencias(EstadoOcorrenciaType.FECHADO)
    }
}
