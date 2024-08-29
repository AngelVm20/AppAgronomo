import 'package:flutter/material.dart';

class Propiedades extends StatefulWidget {
  @override
  _PropiedadesState createState() => _PropiedadesState();
}

class _PropiedadesState extends State<Propiedades> {
  String selectedPlaga = 'Capacidad de Intercambio Catiónico';
  double cultivoSize = 0;

  final List<String> plagas = ['Capacidad de Intercambio Catiónico', 'pH del suelo', 'Contenido de materia orgánica'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TRATAMIENTO DE PROPIEDADES DEL SUELO',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14, // Tamaño de fuente adaptable
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(38, 125, 153, 1),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/compost.jpg', // Ruta de tu imagen de fondo
              fit: BoxFit.cover, // Hace que la imagen cubra toda la pantalla
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonFormField<String>(
                        value: selectedPlaga,
                        items: plagas.map((plaga) {
                          return DropdownMenuItem<String>(
                            value: plaga,
                            child: Text(plaga),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedPlaga = value;
                            });
                          } else {
                            // Mostrar un mensaje de error o realizar otra acción
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Por favor, selecciona una propiedad a tratar'),
                              ),
                            );
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          labelText: 'Selecciona una propiedad a tratar',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                _buildRecomendacionContainer(),
                SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dimensión del Cultivo (m²)',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 8.0),
                      TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            cultivoSize = double.tryParse(value) ?? 0;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                _buildRecomendacionContainerCalculo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecomendacionContainer() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(152, 255, 255, 255),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        _getRecomendacion(),
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        
      ),
    );
  }
  Widget _buildRecomendacionContainerCalculo() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color.fromARGB(152, 255, 255, 255),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        _getCalculo(),
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
    );
  }
  

  String _getRecomendacion() {
    switch (selectedPlaga) {
      case 'Capacidad de Intercambio Catiónico':
        return 'Para tu problema de Capacidad de Intercambio Catiónico debes aplicar Compost. Ingresa la dimensión de tu cultivo en m²';
      case 'pH del suelo':
        return 'Para tu problema de pH del suelo debes aplicar Caliza. Ingresa la dimensión de tu cultivo en m²';
      case 'Contenido de materia orgánica':
        return 'Para tu problema de Contenido de materia orgánica debes aplicar Residuos vegetales. Ingresa la dimensión de tu cultivo en m²';
      default:
        return 'Selecciona una enfermedad';
    }
  }

  String _getCalculo() {
    if (cultivoSize == 0) return '';

    double factor = 0;
    String producto = '';
    switch (selectedPlaga) {
      case 'Capacidad de Intercambio Catiónico':
        factor = 0.32;
        producto = 'Compost';
        break;
      case 'pH del suelo':
        factor = 0.45;
        producto = 'Caliza';
        break;
      case 'Contenido de materia orgánica':
        factor = 0.15;
        producto = 'Residuos vegetales';
        break;
    }
    return 'Para tu dimensión de cultivos debes fumigar con $producto, usando ${cultivoSize * factor} milímetros cúbicos.';
  }
}
