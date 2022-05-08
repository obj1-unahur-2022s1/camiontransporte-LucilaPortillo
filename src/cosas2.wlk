object knightRider {
	method peso()= 500 
	method nivelPeligrosidad()= 10 
	method bultos() = 1
	method sufrirCambios(){ }
}

object bumblebee {
	var esAuto = true
	method peso()= 800 
	method bultos() = 2
	method sufrirCambios(){ self.esRobot() }	
	method nivelPeligrosidad(){ 
		if (esAuto){
			return 15
		}
		else {
			return 30
		}
	}
	//métodos adicionales
	method esRobot(){ esAuto = false }
	method esAuto(){ esAuto = true }
	method estado()= return esAuto
}

object paqueteLadrillos{
	var cantidad = 0
	method peso(){ return cantidad*2 }
	method nivelPeligrosidad(){ return 2 }
	method sufrirCambios(){ cantidad = cantidad + 12 }
	method bultos(){
		if (cantidad.between(1,100)){
			return 1
		}
		else if (cantidad.between(101,300)){
			return 2
		}
		else{
			return 3
		}
	}
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
	method bultos() = 1
	method nivelPeligrosidad(){ return 1 }
	method sufrirCambios(){ peso = peso + 20 }
	//método adicional
	method nuevoPeso(pesoNuev){
		peso = pesoNuev
	}
}

object bateriaAntiarea {
	var tieneMisiles = true
	
	method sufrirCambios(){ self.guardarMisiles() }
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
	method bultos(){
		if (tieneMisiles){
			return 2
		}
		else {
			return 1
		}
	}
	//métodos adicionales
	method guardarMisiles(){ tieneMisiles = true }
	method sacarMisiles(){ tieneMisiles = false }
}

object contenedor {
	const objetos = []
	var pesoTotalDeObjetos = 0
	var bulto = 0
	
	method peso(){ 
		objetos.forEach({objeto => pesoTotalDeObjetos = pesoTotalDeObjetos + objeto.peso()})
		return 100 + pesoTotalDeObjetos
	}
	method nivelPeligrosidad(){ 
		if (objetos.isEmpty()){
			return 0
		}
		else{
			return objetos.max({objeto => objeto.nivelPeligrosidad()}).nivelPeligrosidad()
		}
	}
	method bultos(){ 
		objetos.forEach({ objeto => bulto = bulto + objeto.bultos()})
		return bulto + 1
	}
	method sufrirCambios(){ objetos.forEach({objeto => objeto.sufrirCambios()})}
	//método adicional
	method cargar(cosa){ objetos.add(cosa) }
	method descargar(cosa){ objetos.remove(cosa) }
}

object residuosRadioactivos {
	var peso = 0
	method peso(){ return peso }
	method bultos() = 1
	method nivelPeligrosidad(){ return 200 }
	method sufrirCambios(){ peso = peso + 15 }
	//método adicional
	method nuevoPeso(pesoNuev){ peso = pesoNuev }
}

object embalajeSeguridad {
	var objetoEnvuelto = knightRider
	method peso(){ return  objetoEnvuelto.peso()}
	method bultos() = 2
	method nivelPeligrosidad(){ return objetoEnvuelto.nivelPeligrosidad() / 2 }
	method sufrirCambios(){ }
	//método adicional
	method envolverObjeto(objeto){ objetoEnvuelto = objeto}
}

