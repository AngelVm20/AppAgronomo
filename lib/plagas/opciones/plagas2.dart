import 'package:flutter/material.dart';

class Plagas2 extends StatefulWidget {
  @override
  _Plagas2State createState() => _Plagas2State();
}

class _Plagas2State extends State<Plagas2> {
  String selectedPlaga = 'Monilla';
  double cultivoSize = 0;

  final List<String> plagas = ['Monilla', 'Pulgones', 'Cochinillas'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TRATAMIENTO DE PLAGAS',
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
          Positioned.fill(
            child: Image.asset(
              'assets/fumigando.jpeg', // Ruta de tu imagen de fondo
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
                                content: Text('Por favor, selecciona una plaga'),
                              ),
                            );
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          labelText: 'Selecciona una plaga',
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
      case 'Monilla':
        return 'Para tu problema de monilla debes aplicar TOPSIN. Ingresa la dimensión de tu cultivo en m²';
      case 'Pulgones':
        return 'Para tu problema de pulgones debes aplicar CONFIDOR. Ingresa la dimensión de tu cultivo en m²';
      case 'Cochinillas':
        return 'Para tu problema de cochinillas debes aplicar PIRAZOL. Ingresa la dimensión de tu cultivo en m²';
      default:
        return 'Selecciona una plaga';
    }
  }

  String _getCalculo() {
    if (cultivoSize == 0) return '';

    double factor = 0;
    String producto = '';
    switch (selectedPlaga) {
      case 'Monilla':
        factor = 0.5;
        producto = 'TOPSIN';
        break;
      case 'Pulgones':
        factor = 0.3;
        producto = 'CONFIDOR';
        break;
      case 'Cochinillas':
        factor = 0.9;
        producto = 'PIRAZOL';
        break;
    }
    return 'Para tu dimensión de cultivos debes fumigar con $producto, usando ${cultivoSize * factor} milímetros cúbicos.';
  }
}
