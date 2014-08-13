<div class="widget-head">
	<h4 class="heading glyphicons cogwheels">
		<i></i>Ocorrências Abertas
	</h4>
</div>
<div class="widget-body">
	<ul>
		<g:each in="${ocorrenciasAbertas}" var="unidade">
			<li>
			    <span>${unidade.nome}</span> 
			    
			    <ol>
			    <g:each in="${unidade.departamentos}" var="departamento">
					<li>
					    <span>${departamento.nome}</span> 

					    <ol>
					    <g:each in="${departamento.maquinas}" var="maquina">
							<li>
							    <span>${maquina.identificador}</span> 

							    <ol>
							    <g:each in="${maquina.alarmes}" var="alarme">
									<li>
									    <span>${alarme.identificador}</span> 
									    <span style="float: right; font-size: 15pt;"> 
									        ${alarme.ocorrencias?.findAll{it.estado == com.projeto.clp.type.EstadoOcorrenciaType.ABERTO}.size()}
									    </span>
									</li>			
								</g:each>
								</ol>
							   
							</li>			
						</g:each>
						</ol>

					</li>			
				</g:each>
				</ol>
			</li>			
		</g:each>
	</ul>
</div>
