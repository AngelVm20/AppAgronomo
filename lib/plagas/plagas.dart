import 'package:agronomo_asistente/plagas/opciones/enfermedades.dart';
import 'package:agronomo_asistente/plagas/opciones/parasitos.dart';
import 'package:agronomo_asistente/plagas/opciones/plagas2.dart';
import 'package:flutter/material.dart';

class PlagasPage extends StatelessWidget {

  const PlagasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('AGENTES BIÓTICOS',
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
              'assets/fondoplaga.jpg', // Ruta de tu imagen de fondo
              fit: BoxFit.cover, // Hace que la imagen cubra toda la pantalla
            ),
          ),
          // Contenido sobre la imagen de fondo
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Alinea el texto al inicio (izquierda)
              children: <Widget>[
                const SizedBox(height: 5),
                const Center(
                  child: Text(
                    '¿Que tipo de Agente Biótico presentas?',
                    style: TextStyle(
                      fontSize: 18, // Tamaño de fuente adaptable
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 25, 49, 0), // Color de texto
                    ),
                  ),
                ),
                const SizedBox(height: 150), // Espacio entre el texto y los botones
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push( // Usamos Navigator.push para navegar
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Plagas2(), 
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(217, 217, 217, 100),
                          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: const Text(
                          'PLAGAS',
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 60),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push( // Usamos Navigator.push para navegar
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Enfermedades(), 
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(217, 217, 217, 100),
                          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        child: const Text(
                          'ENFERMEDADES',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 60),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push( // Usamos Navigator.push para navegar
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Parasitos(), 
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(217, 217, 217, 100),
                          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                        child: const Text(
                          'PARASITOS',
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
