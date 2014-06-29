<g:select id="escravoMaquina" name="escravoMaquina.id" from="${escravos}" 
		  optionKey="id" required="" value="${alarmeInstance?.escravoMaquina?.id}" class="many-to-one"
		  noSelection="${['0':'...']}"
		  onchange="${remoteFunction(action: 'preecherRegistradores', controller: 'alarme', update: 'selectRegistradores', params: '\'escravoId=\' + this.value') }"/>