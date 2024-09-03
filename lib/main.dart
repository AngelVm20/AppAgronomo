import 'package:flutter/material.dart';
import 'menu.dart'; // Asegúrate de tener el archivo menu.dart creado

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agroconsult',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AgroConsult'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nombreUsuarioController =
      TextEditingController();

  void _continuar() {
    String nombreUsuario = _nombreUsuarioController.text;
    if (nombreUsuario.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MenuPage(nombreUsuario: nombreUsuario),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, ingresa tu nombre')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 1,
        toolbarHeight: 120,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 40,
            color: Color(0xFF264653),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.white,
                Colors.white,
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // Envolvemos el contenido en un SingleChildScrollView
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  // Limitamos el tamaño de la imagen
                  height: 200, // Ajusta la altura según sea necesario
                  child: Image.asset(
                    'assets/señor.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'AgriConsult la solución inteligente para el cuidado de tus plantas.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF264653),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ingresa tu nombre para continuar',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF264653),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _nombreUsuarioController,
                  decoration: const InputDecoration(
                    hintText: 'Ingresa tu nombre',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 75, 255, 47)),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _continuar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(217, 217, 217, 100),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  child: const Text(
                    'CONTINUAR',

                    ///
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
