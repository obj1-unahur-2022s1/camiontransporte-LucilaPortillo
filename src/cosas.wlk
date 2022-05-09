object knightRider {
	method peso(){ return 500 }
	method nivelPeligrosidad(){ return 10 }
}

object bumblebee {
	var esAuto = true
	method peso(){ return 800 }
	method nivelPeligrosidad(){ 
		if (esAuto){
			return 15
		}
		else {
			return 30
		}
	}
	//métodos adicionales
	method esRobot(){
		esAuto = false
		return esAuto
	}
	method esAuto(){
		esAuto = true
		return esAuto
	}
}

object paqueteLadrillos{
	var cantidad = 0
	method peso(){ return cantidad*2 }
	method nivelPeligrosidad(){ return 2 }
	//método adicional
	method guardarLadrillos(cant){ cantidad = cant }
	method sacarLadrillos(cant){ 
		if(cant < cantidad){
			cantidad = cantidad - cant
		}
		else {
			cantidad = 0
		}
	}
}


object arena {
	var peso = 0
	method peso(){ return peso }
	method nivelPeligrosidad(){ return 1 }
	//método adicional
	method nuevoPeso(pesoNuev){
		peso = pesoNuev
	}
}

object bateriaAntiarea {
	var tieneMisiles = true
	method peso(){ 
		if (tieneMisiles){
			return 300
		}
		else {
			return 200
		}
	}
	method nivelPeligrosidad(){ 
		if (tieneMisiles){
			return 100
		}
		else {
			return 0
		}
	}
	//métodos adicionales
	method guardarMisiles(){ tieneMisiles = true }
	method sacarMisiles(){ tieneMisiles = false }
}

object contenedor {
	const objetos = []
	
	method peso(){ return 100 + objetos.sum({objeto => objeto.peso()}) }
	method nivelPeligrosidad(){ 
		if (objetos.isEmpty()){
			return 0
		}
		else{
			return objetos.max({objeto => objeto.nivelPeligrosidad()}).nivelPeligrosidad()
		}
	}
	//método adicional
	method cargar(cosa){ objetos.add(cosa) }
	method descargar(cosa){ objetos.remove(cosa) }
}

object residuosRadioactivos {
	var peso = 0
	method peso(){ return peso }
	method nivelPeligrosidad(){ return 200 }
	//método adicional
	method nuevoPeso(pesoNuev){ peso = pesoNuev }
}

object embalajeSeguridad {
	var objetoEnvuelto = knightRider
	method peso(){ return  objetoEnvuelto.peso()}
	method nivelPeligrosidad(){ return objetoEnvuelto.nivelPeligrosidad() / 2 }
	//método adicional
	method envolverObjeto(objeto){ objetoEnvuelto = objeto}
}




