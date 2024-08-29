import 'package:agronomo_asistente/nutricion/opciones/fertilidad.dart';
import 'package:agronomo_asistente/nutricion/opciones/propiedades.dart';
import 'package:flutter/material.dart';

class NutricionPage extends StatelessWidget {

  const NutricionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('NUTRICIÓN VEGETAL',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16, // Tamaño de fuente adaptable
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(38, 125, 153, 1),
      ),

      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/fondo2.jpg', // Ruta de tu imagen de fondo
              fit: BoxFit.cover, // Hace que la imagen cubra toda la pantalla
            ),
          ),
          // Contenido sobre la imagen de fondo
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto al inicio (izquierda)
              children: <Widget>[
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    '¿Qué aspecto de la nutrición vegetal te interesa explorar?',
                    style: TextStyle(
                      fontSize: 18, // Tamaño de fuente adaptable
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 7, 13, 0), // Color de texto
                    ),
                  ),
                ),
                const SizedBox(height: 100), // Espacio entre el texto y los botones
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push( // Usamos Navigator.push para navegar
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Propiedades(), 
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(217, 217, 217, 100),
                          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: const Text(
                          'PROPIEDADES DEL SUELO',
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 60),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push( // Usamos Navigator.push para navegar
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Fertilidad(), 
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(217, 217, 217, 100),
                          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        child: const Text(
                          'FERTILIDAD DEL SUELO',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 60),
                      ElevatedButton(
                        onPressed: () {
                          // Acción para el botón "Malesas"
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(217, 217, 217, 100),
                          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        child: const Text(
                          'CONSERVACION DEL SUELO',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
