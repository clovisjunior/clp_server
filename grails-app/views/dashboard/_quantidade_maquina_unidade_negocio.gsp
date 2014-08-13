<div class="widget-head">
	<h4 class="heading glyphicons cogwheels">
		<i></i>Quantidade Máquinas
	</h4>
</div>
<div class="widget-body">
	<ul>
		<g:each in="${maquinasUnidadeNegocio}" var="unidade">
			<li>
			    <span>${unidade.nome}</span> 
			    
			    <ol>
			    <g:each in="${unidade.departamentos}" var="departamento">
					<li>
					    <span>${departamento.nome}</span> 
					    <span style="float: right; font-size: 15pt;"> 
					        ${departamento?.maquinas?.size()}
					    </span>
					</li>			
				</g:each>
				</ol>
			</li>			
		</g:each>
	</ul>
</div>
