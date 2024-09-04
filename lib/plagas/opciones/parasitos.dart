import 'package:flutter/material.dart';

class Parasitos extends StatefulWidget {
  @override
  _ParasitosState createState() => _ParasitosState();
}

class _ParasitosState extends State<Parasitos> {
  String selectedPlaga = 'Nematodos';
  double cultivoSize = 0;

  final List<String> plagas = ['Nematodos', ' Áfidos', 'Araña Roja'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TRATAMIENTO DE PARASITOS',
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
              'assets/parasito.png', // Ruta de tu imagen de fondo
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
                                content: Text('Por favor, selecciona un parasito'),
                              ),
                            );
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          labelText: 'Selecciona un parasito',
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
      case 'Nematodos':
        return 'Para tu problema de Nematodos debes aplicar Nematicidas. Ingresa la dimensión de tu cultivo en m²';
      case ' Áfidos':
        return 'Para tu problema de  Áfidos debes aplicar Pirimicarb. Ingresa la dimensión de tu cultivo en m²';
      case 'Araña Roja':
        return 'Para tu problema de Araña Roja debes aplicar Acaricidas. Ingresa la dimensión de tu cultivo en m²';
      default:
        return 'Selecciona una enfermedad';
    }
  }

  String _getCalculo() {
    if (cultivoSize == 0) return '';
    double factor = 0;
    String producto = '';
    double cantidad = 0;
    switch (selectedPlaga) {
      case 'Nematodos':
        factor = 0.32;
        cantidad = 0.006;
        producto = 'Nematicidas';
        break;
      case ' Áfidos':
        factor = 0.45;
        cantidad = 0.005
        producto = 'Pirimicarb';
        break;
      case 'Araña Roja':
        factor = 0.15;
        cantidad = 0.001;
        producto = 'Acaricidas';
        break;
    }
    return 'Para tu dimensión de cultivos debes fumigar con $producto, usando ${cultivoSize * factor} milímetros cúbicos, disueltos en ${cultivoSize * cantidad} litros de agua.';
  }
}