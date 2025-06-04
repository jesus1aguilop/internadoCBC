import 'package:flutter/material.dart';

class PerfilAprendiz extends StatelessWidget {
  const PerfilAprendiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header (Barra verde con botón "Volver")
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
                  onTap: () => Navigator.pop(context),
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
                  'Perfil Aprendiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Contenido principal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Tarjeta de perfil (foto + nombre)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF39A900),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          // Foto de perfil (reemplaza con tu asset)
                          Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/persona.png', 
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(Icons.person, size: 40),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Camilo Andres',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Hernández Navarro',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Habitación Nº10',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Secciones colapsables
                    _buildCollapsibleSection(context, 'Datos personales'),
                    const SizedBox(height: 12),
                    _buildCollapsibleSection(context, 'Materiales Otorgados'),
                    const SizedBox(height: 12),
                    _buildCollapsibleSection(context, 'Datos Emergencia'),
                    const SizedBox(height: 12),
                    _buildCollapsibleSection(context, 'Discapacidades'),
                    const SizedBox(height: 12),
                    _buildCollapsibleSection(context, 'Salud'),
                  ],
                ),
              ),
            ),
          ),

          // Footer (Barra inferior de navegación)
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

  // Widget para secciones colapsables (sin cambios)
  Widget _buildCollapsibleSection(BuildContext context, String title) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF1E1E1E),
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF1E1E1E),
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Text(
                'Contenido de $title',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1E1E1E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}