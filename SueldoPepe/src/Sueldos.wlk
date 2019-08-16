object pepe{
	
	var categoria = gerente
	var bonoPresen = bonoPresentismoNormal
	var bonoResultados = bonoNulo
	var faltas = 1
	
	// PRUEBA DE COMMIT
	method categoria(cat){
		categoria=cat
	}
	method bonoPresentismo(bonoPres){
		bonoPresen=bonoPres
	}
	method bonoResultados(bonoResu){
		bonoResultados=bonoResu
	}
	method cantFalta(num){
		faltas = num
	}
	method cantidadFaltas(){
		return faltas
	}
	
	method consultarCategoria(){
		return categoria.sueldo()
	}
	method sueldoTotal(){
		return categoria.sueldo() + bonoPresen.monto(self) + bonoResultados.monto(categoria)
	}
	
}

object cadete{ 
	method sueldo(){
		return 20000
	}
}

object gerente{
	method sueldo(){
		return 15000
	}
}


object bonoResuPorcentaje{
	method monto(cat){
		return  (1.10 * cat.sueldo() ) - cat.sueldo() 
	}
}

object bonoResuMontoFijo{
	method monto(cat){
		return 800 
	}
}
object bonoNulo{
	method monto(cat){
		return 0
	}
}

object bonoPresentismoNormal {
	
	method monto(empleado) { 
		if(empleado.cantidadFaltas() == 0) {return 2000}
		else{if (empleado.cantidadFaltas() == 1) {return 100}}
		return 0
	}
}

object bonoPresentismoAjuste {
	
	method monto(empleado) { 
		if(empleado.cantidadFaltas() == 0) {return 100}
		return 0
	}
}

object bonoPresentismoDemagogico {
	
	method monto(cat) { 
		if( cat.sueldo() <= 18000 ){ return 500}
		else{return 300}
	}
}