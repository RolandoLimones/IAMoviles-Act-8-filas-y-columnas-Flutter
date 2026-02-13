import 'package:flutter/material.dart';

void main() {
  runApp(const AppPetco());
}

class AppPetco extends StatelessWidget {
  const AppPetco({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const PetcoFilaColumna(),
    );
  }
}

class PetcoFilaColumna extends StatelessWidget {
  const PetcoFilaColumna({super.key});

  @override
  Widget build(BuildContext context) {
    // Colores base de la marca
    const Color azulOscuro = Color(0xFF1A237E);
    const Color rojoPastel = Color(0xFFFFADAD);

    // Lista de categorías de animales
    final List<Map<String, dynamic>> categorias = [
      {'nombre': 'Alimentos', 'icono': Icons.restaurant, 'color': Color(0xFFB39DDB)}, // Morado pastel
      {'nombre': 'Juguetes', 'icono': Icons.toys, 'color': Color(0xFF80CBC4)},     // Verde agua pastel
      {'nombre': 'Medicamentos', 'icono': Icons.medication, 'color': Color(0xFFF48FB1)}, // Rosa pastel
      {'nombre': 'Animales', 'icono': Icons.pets, 'color': Color(0xFF90CAF9)},     // Azul pastel
      {'nombre': 'Sucursales', 'icono': Icons.storefront, 'color': Color.fromARGB(255, 250, 182, 81)}, // Naranja pastel
      {'nombre': 'Consultas', 'icono': Icons.event_available, 'color': Color.fromARGB(255, 150, 218, 152)}, // Verde pastel
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Petco Contreras",
          style: TextStyle(color: azulOscuro, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: rojoPastel,
        elevation: 0,
        actions: const [
          Icon(Icons.inventory_2, color: azulOscuro),
          SizedBox(width: 15),
          Icon(Icons.medical_services, color: azulOscuro),
          SizedBox(width: 15),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          // Esto evita que los cuadros sean gigantes en Web
          constraints: const BoxConstraints(maxWidth: 600),
          child: GridView.builder(
            padding: const EdgeInsets.all(25),
            itemCount: categorias.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Dos columnas
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1, // Mantiene los cuadros cuadrados
            ),
            itemBuilder: (context, index) {
              final cat = categorias[index];
              return buildAnimalCard(
                cat['nombre'],
                cat['icono'],
                cat['color'],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildAnimalCard(String nombre, IconData icono, Color fondo) {
    // Definimos un color pastel para el contenido (blanco con opacidad o crema)
    const Color colorTextoIcono = Color(0xFFFDFDFD);

    return Container(
      decoration: BoxDecoration(
        color: fondo,
        borderRadius: BorderRadius.circular(25), // Bordes redondeados
        boxShadow: [
          BoxShadow(
            color: fondo.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icono,
            size: 50,
            color: colorTextoIcono.withOpacity(0.9),
          ),
          const SizedBox(height: 12),
          Text(
            nombre,
            style: TextStyle(
              color: colorTextoIcono,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}