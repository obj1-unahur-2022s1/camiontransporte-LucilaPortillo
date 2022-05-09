import cosas.*

object camion {
	const objetosCargados = []
	const tara = 1000
	
	method cargar(cosa){ 
		objetosCargados.add(cosa)
		cosa.sufrirCambios()
	}
	method descargar(cosa){ objetosCargados.remove(cosa) }
	method todoPesoPar(){ return objetosCargados.all({cosa => cosa.peso().even()})}
	method hayAlgunoQuePesa(peso){ return objetosCargados.any({cosa => cosa.peso() == peso})}
	method elDeNivel(nivel){ return objetosCargados.find({cosa => cosa.nivelPeligrosidad() == nivel})}
	method pesoTotal(){ return tara + objetosCargados.sum({cosa => cosa.peso()})}
	method excedidoDePeso(){ return (self.pesoTotal() > 2500) }
	method objetosQueSuperanPeligrosidad(nivel){ return objetosCargados.filter({cosa => cosa.nivelPeligrosidad() > nivel})}
	method objetosMasPeligrososQue(cosa){ return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())}
	method puedeCircularEnRuta(nivelMaximoDePeligrosidad){ return (!self.excedidoDePeso() and !objetosCargados.all({cosa => cosa.nivelPeligrosidad() > nivelMaximoDePeligrosidad}))}
	method tieneAlgoQuePesaEntre(min, max){ return objetosCargados.any({cosa => cosa.peso().between(min,max)})}
	method cosaMasPesada(){ return objetosCargados.max({cosa => cosa.peso()})}
	method pesos(){ return objetosCargados.map({cosa => cosa.peso()}) }
	method totalBultos(){ return objetosCargados.sum({cosa => cosa.bultos()})}
	//método adicional
	method objetosCargadosActualmente() = objetosCargados
}