import 'package:flutter/material.dart';
import 'package:sena/screens/perfil_aprendiz.dart';

class ListaAprendiz extends StatefulWidget {
  const ListaAprendiz({super.key});

  @override
  State<ListaAprendiz> createState() => _ListaAprendizState();
}

class _ListaAprendizState extends State<ListaAprendiz> {
  // Para controlar qué elementos están expandidos
  List<bool> expandedItems = List.generate(11, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF33A02C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Funcionalidad para volver a la página anterior
                    Navigator.pop(context); 
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Volver',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Lista de Aprendices',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Filter Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('FILTRAR'),
            ),
          ),
          
          // List of apprentices
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFC3E5B2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                itemCount: 11,
                itemBuilder: (context, index) {
                  final isFirst = index == 0;
                  final name = isFirst 
                    ? 'Camilo Andres Hernandez Navarro'
                    : 'Nombres y Apellidos';
                    
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey, width: 0.5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFF1E1E1E),
                                ),
                              ),
                            ),
                            // Flecha desplegable
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  expandedItems[index] = !expandedItems[index];
                                });
                              },
                              child: Icon(
                                expandedItems[index] 
                                  ? Icons.keyboard_arrow_up 
                                  : Icons.keyboard_arrow_down,
                                color: const Color(0xFF33A02C),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
                      // Panel desplegable
                      if (expandedItems[index])
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          color: const Color(0xFFA7D99C),
                          child: Column(
                            children: [
                              _buildOptionItem(
                                context, 
                                'Ver perfil', 
                                Icons.person,
                                () {
                                  // Modificado para navegar a GeneralAprendiz en lugar de PerfilAprendiz
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const GeneralAprendiz(),
                                    ),
                                  );
                                }
                              ),
                              _buildOptionItem(
                                context, 
                                'Editar datos', 
                                Icons.edit,
                                () {
                                  // Acción para editar datos
                                }
                              ),
                              _buildOptionItem(
                                context, 
                                'Ver asistencia', 
                                Icons.calendar_today,
                                () {
                                  // Acción para ver asistencia
                                }
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          color: Color(0xFF33A02C),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(Icons.home_outlined, color: Colors.white, size: 30),
            Icon(Icons.edit_note, color: Colors.white, size: 30),
            Icon(Icons.access_time, color: Colors.white, size: 30),
            Icon(Icons.settings, color: Colors.white, size: 30),
          ],
        ),
      ),
    );
  }

  // Widget para crear cada elemento de opción en el panel desplegable
  Widget _buildOptionItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF33A02C), size: 18),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF1E1E1E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Agregamos la clase GeneralAprendiz para que el código compile correctamente
class GeneralAprendiz extends StatelessWidget {
  const GeneralAprendiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF33A02C),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            child: Row(
              children: [
                
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Volver',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Aprendiz Registrado',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Filter Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('FILTRAR'),
            ),
          ),
          
          // Profile Card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF33A02C),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Camilo Andres Hernandez Navarro',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          '-',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            'assets/images/persona.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Camilo Andres Hernandez Navarro',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text('Tel: 321455663'),
                              const Text('Ficha: 2877051'),
                              const Text('Edad: 19'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton.icon(
                                    onPressed: () {
                                      Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => const PerfilAprendiz()),
                                      );
                                    },
                                    label: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: const Color(0xFF39A900),
                                        ),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 12,
                                          color: Color(0xFF39A900),
                                        ),
                                      ),
                                    ),
                                    icon: const Text(
                                      'Ver Mas',
                                      style: TextStyle(
                                        color: Color(0xFF39A900),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // List of other apprentices
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFC3E5B2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nombres y Apellidos',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1E1E1E),
                          ),
                        ),
                        Text(
                          '+',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Footer
          Container(
  height: 70,
  decoration: const BoxDecoration(
    color: Color(0xFF33A02C),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const [
      Icon(Icons.home_outlined, color: Colors.white, size: 30),
      Icon(Icons.edit_note, color: Colors.white, size: 30),
      Icon(Icons.access_time, color: Colors.white, size: 30),
      Icon(Icons.settings, color: Colors.white, size: 30),
    ],
  ),
),

        ],
      ),
    );
  }
}