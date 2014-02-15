import com.projeto.clp.Departamento
import com.projeto.clp.Entidade;
import com.projeto.clp.UnidadeDeNegocio;

class BootStrap {

    def init = { servletContext ->
		
		Entidade entidade = new Entidade(nome: "Renault Brasil", usuario: "renaut.brasil", senha: "12345")
		entidade.save(true)
		
		UnidadeDeNegocio unidadeNegocio = new UnidadeDeNegocio(entidade: entidade, endereco: "BR 277", nome: "SJP")
		unidadeNegocio.addToDepartamentos(new Departamento(nome: "Manuteção Carroçaria"))
		unidadeNegocio.save(true) 
		
    }
    def destroy = {
    }
}
