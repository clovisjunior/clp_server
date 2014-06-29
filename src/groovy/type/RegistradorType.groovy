package type

import com.serotonin.modbus4j.code.RegisterRange;

enum RegistradorType{

	COIL_STATUS(RegisterRange.COIL_STATUS, "Status do Coil"),
	INPUT_STATUS(RegisterRange.INPUT_STATUS, "Status de Entrada"),
	HOLDING_REGISTER(RegisterRange.HOLDING_REGISTER, "Registrador Holding"),
	INPUT_REGISTER(RegisterRange.INPUT_REGISTER, "Registrador de Entrada")

	private final Integer id
	private final String descricao

	RegistradorType(Integer id, String descricao){
		this.id = id
		this.descricao = descricao
	}

	static RegistradorType[] list(){
		[COIL_STATUS, INPUT_STATUS, HOLDING_REGISTER, INPUT_REGISTER]
	}
	
	static get(Integer id){
		return values().find{it.id == id}
	}

	public String descricao(){
		return descricao
	}

	public Integer id(){
		return id
	}
	
}
