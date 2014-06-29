package type

import com.serotonin.modbus4j.code.DataType;

enum DadoType {

	BINARY(DataType.BINARY, "Binário"),  
	TWO_BYTE_INT_UNSIGNED(DataType.TWO_BYTE_INT_UNSIGNED, "Inteiro de 2 bytes sem sinal"),  
	TWO_BYTE_INT_SIGNED(DataType.TWO_BYTE_INT_SIGNED, "Inteiro de 2 bytes com sinal"),  
	FOUR_BYTE_INT_UNSIGNED(DataType.FOUR_BYTE_INT_UNSIGNED, "Inteiro de 4 bytes sem sinal"),  
	FOUR_BYTE_INT_SIGNED(DataType.FOUR_BYTE_INT_SIGNED, "Inteiro de 4 bytes com sinal"),  
	FOUR_BYTE_INT_UNSIGNED_SWAPPED(DataType.FOUR_BYTE_INT_UNSIGNED_SWAPPED, "Inteiro trocado de 4 bytes sem sinal"),  
	FOUR_BYTE_INT_SIGNED_SWAPPED(DataType.FOUR_BYTE_INT_SIGNED_SWAPPED, "Inteiro trocado de 4 bytes com sinal"),  
	FOUR_BYTE_FLOAT(DataType.FOUR_BYTE_FLOAT, "Float de 4 bytes"),  
	FOUR_BYTE_FLOAT_SWAPPED(DataType.FOUR_BYTE_FLOAT_SWAPPED, "Float trocado de 4 bytes"),  
	EIGHT_BYTE_INT_UNSIGNED(DataType.EIGHT_BYTE_INT_UNSIGNED, "Inteiro de 8 bytes sem sinal"),
	EIGHT_BYTE_INT_SIGNED(DataType.EIGHT_BYTE_INT_SIGNED, "Inteiro de 8 bytes com sinal"),
	EIGHT_BYTE_INT_UNSIGNED_SWAPPED(DataType.EIGHT_BYTE_INT_UNSIGNED_SWAPPED, "Inteiro trocado de 8 bytes sem sinal"),
	EIGHT_BYTE_INT_SIGNED_SWAPPED(DataType.EIGHT_BYTE_INT_SIGNED_SWAPPED, "Inteiro de 8 trocado bytes com sinal"),
	EIGHT_BYTE_FLOAT(DataType.EIGHT_BYTE_FLOAT, "Float de 8 bytes"),
	EIGHT_BYTE_FLOAT_SWAPPED(DataType.EIGHT_BYTE_FLOAT_SWAPPED, "Float trocado de 8 bytes"),
	TWO_BYTE_BCD(DataType.TWO_BYTE_BCD, "BCD de 2 bytes"),
	FOUR_BYTE_BCD(DataType.FOUR_BYTE_BCD, "BCD de 4 bytes")

	private final Integer id
	private final String descricao

	DadoType(Integer id, String descricao){
		this.id = id
		this.descricao = descricao
	}

	static DadoType[] list(){
		[
			BINARY,  
			TWO_BYTE_INT_UNSIGNED,  
			TWO_BYTE_INT_SIGNED,  
			FOUR_BYTE_INT_UNSIGNED,  
			FOUR_BYTE_INT_SIGNED,  
			FOUR_BYTE_INT_UNSIGNED_SWAPPED,  
			FOUR_BYTE_INT_SIGNED_SWAPPED,  
			FOUR_BYTE_FLOAT,  
			FOUR_BYTE_FLOAT_SWAPPED,  
			EIGHT_BYTE_INT_UNSIGNED,
			EIGHT_BYTE_INT_SIGNED,
			EIGHT_BYTE_INT_UNSIGNED_SWAPPED,
			EIGHT_BYTE_INT_SIGNED_SWAPPED,
			EIGHT_BYTE_FLOAT,
			EIGHT_BYTE_FLOAT_SWAPPED,
			TWO_BYTE_BCD,
			FOUR_BYTE_BCD
		]
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
