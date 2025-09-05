object luke {
    var auto = alambiqueVeloz
    var cantLugaresVisitados = 0
    var ultimoLugarVisitado = paris
    var recuerdo = llaveroEiffel

    method cambiarAuto(nuevoAuto) {auto = nuevoAuto}
    method puedeViajar(unAuto) = unAuto.condicion()
    method viajar(unaCiudad, unAuto) {
        if(self.puedeViajar(unAuto)){
            unAuto.sufrirConsecuencia(unaCiudad)
            recuerdo = unaCiudad.recuerdo()
            ultimoLugarVisitado = unaCiudad
            cantLugaresVisitados = cantLugaresVisitados + 1
        }
    } 
    method cantLugaresVisitados() = cantLugaresVisitados
    method recuerdo() = recuerdo
}

object alambiqueVeloz {
    var combustible = 100

    method combustible() = combustible
    method cargarCombustible(cantidad) {combustible = combustible + cantidad}
    method puedeViajar(unaCiudad) {
        unaCiudad.condicion()
    }
    method esRapido() = true
    method sufrirConsecuencia(unaCiudad) {
        unaCiudad.consecuencia(self)
    }
}

object paris {
    method recuerdo () = llaveroEiffel
    method condicion(unAuto) = unAuto.combustible() > 150
    method consecuencia(unAuto) {unAuto.combustible() - 150}
}

object llaveroEiffel {}

object buenosAires {
    var presidente = "cristina"

    method cambiarPresidente(nuevoPresidente) {presidente = nuevoPresidente}
    method recuerdo () {
        if (presidente == "cristina") {
            return mateConYerba
        } else {
            return mateSinYerba
        }
    }
    method condicion(unAuto) = unAuto.esRapido()
}

object mateConYerba {}
object mateSinYerba {}

object bagdad {
    var recuerdo = bidonPetroleo

    method recuerdo() = recuerdo
    method cambiarRecuerdo(nuevoRecuerdo) {recuerdo = nuevoRecuerdo} 
    method condicion(unAuto) {}
}

object bidonPetroleo {}

object lasVegas {
    var ciudadConmemorada = buenosAires
    method recuerdo() = ciudadConmemorada.recuerdo()
    method cambiarCiudad(nuevaCiudad) {ciudadConmemorada = nuevaCiudad}
    method condicion(unAuto) {
        ciudadConmemorada.condicion(unAuto)
    }
}
