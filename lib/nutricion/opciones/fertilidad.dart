import 'package:flutter/material.dart';

class Fertilidad extends StatefulWidget {
  @override
  _FertilidadState createState() => _FertilidadState();
}

class _FertilidadState extends State<Fertilidad> {
  String selectedPlaga = 'Aumentar la Materia Orgánica';
  double cultivoSize = 0;

  final List<String> plagas = ['Aumentar la Materia Orgánica', 'Equilibrar los Nutrientes', 'Mejorar la Estructura del Suelo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TRATAMIENTO DE FERTILIDAD DEL SUELO',
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
              'assets/estructura.jpg', // Ruta de tu imagen de fondo
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
                                content: Text('Por favor, selecciona una opcion'),
                              ),
                            );
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          labelText: 'Selecciona una opcion',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                _buildRecomendacionContainer(),
                
                
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
        color: Color.fromARGB(176, 255, 255, 255),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        _getRecomendacion(),
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        
      ),
    );
  }
  

  String _getRecomendacion() {
    switch (selectedPlaga) {
      case 'Aumentar la Materia Orgánica':
        return 'Para tu problema de Aumentar la Materia Orgánica debes tener en cuenta:\n'
            '* Abonos verdes: Siembra leguminosas como la alfalfa o el trébol y luego íntegralas al suelo. Estas plantas fijan nitrógeno atmosférico y aportan materia orgánica.\n'
            '* Residuos vegetales: Utiliza restos de poda, hojas secas y otros residuos vegetales para hacer abono.\n'
            '* Humus de lombriz: Es un abono orgánico muy rico en nutrientes y microorganismos, que mejora la estructura del suelo.';
      case 'Equilibrar los Nutrientes':
        return 'Para tu problema de Equilibrar los Nutrientes debes tener en cuenta:\n'
            '* Fertilizantes orgánicos: Utiliza fertilizantes orgánicos como estiércol, compost o guano para aportar nutrientes de liberación lenta y mejorar la estructura del suelo.\n'
            '* Fertilizantes minerales: Emplea fertilizantes minerales para corregir deficiencias específicas de nutrientes, pero siempre siguiendo las recomendaciones de un técnico agrícola.\n'
            '* Fertilización foliar: Aplica fertilizantes foliares para corregir deficiencias nutricionales de forma rápida, especialmente en situaciones de estrés.';
      case 'Mejorar la Estructura del Suelo':
        return 'Para tu problema de Mejorar la Estructura del Suelo debes considerar:\n'
            '* Evitar la compactación: Reduce el tráfico de maquinaria pesada en el suelo, especialmente cuando está húmedo.\n'
            '* Rotación de cultivos: Alterna diferentes cultivos para evitar la fatiga del suelo y mejorar su estructura.\n'
            '* Coberturas vegetales: Mantén el suelo cubierto con plantas o residuos vegetales para protegerlo de la erosión y mejorar su estructura.';
      default:
        return 'Selecciona una opcion ';
    }
  }

  
}
