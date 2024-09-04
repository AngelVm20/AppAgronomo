import 'package:agronomo_asistente/nutricion/nutricionMenu.dart';
import 'package:agronomo_asistente/plagas/plagas.dart';
import 'package:agronomo_asistente/recomendaciones/recomendacionesMenu.dart';
import 'package:flutter/material.dart';
import 'main.dart'; // Asegúrate de que este archivo esté en el mismo directorio

class MenuPage extends StatelessWidget {
  final String nombreUsuario;

  const MenuPage({Key? key, required this.nombreUsuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(38, 125, 153, 1),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                'assets/planta.png',
                height: 35,
              ),
            ),
            Text(
              'Bienvenido $nombreUsuario',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              _mostrarDialogoSalida(context);
            },
            child: Row(
              // Contenido del botón (texto e icono)
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'SALIR',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Positioned.fill(
            child: Image.asset(
              'assets/fondo.jpg', // Ruta de tu imagen de fondo
              fit: BoxFit.cover, // Hace que la imagen cubra toda la pantalla
            ),
          ),
          // Contenido sobre la imagen de fondo
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Alinea el texto al inicio (izquierda)
              children: <Widget>[
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    '¿En qué puedo ayudarte el día de hoy?',
                    style: TextStyle(
                      fontSize: 18, // Tamaño de fuente adaptable
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 238, 13, 6), // Color de texto
                    ),
                  ),
                ),
                const SizedBox(
                    height: 150), // Espacio entre el texto y los botones
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            // Usamos Navigator.push para navegar
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PlagasPage(), // Asegúrate de usar 'const' aquí también
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(217, 217, 217, 100),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
                          textStyle: const TextStyle(fontSize: 18),
                        ),
                        child: const Text(
                          'AGENTES BIÓTICOS',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            // Usamos Navigator.push para navegar
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NutricionPage(), // Asegúrate de usar 'const' aquí también
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(217, 217, 217, 100),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 80, vertical: 15),
                          textStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        child: const Text(
                          'NUTRICIÓN VEGETAL',
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

  void _mostrarDialogoSalida(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¿Estás seguro de querer salir?'),
          content: const Text('Iniciarás en el principio.'),
          actions: <Widget>[
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
            TextButton(
              child: const Text('Sí'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const MyApp()),
                  (Route<dynamic> route) => false,
                ); // Navega a la pantalla principal
              },
            ),
          ],
        );
      },
    );
  }
}
