import 'package:flutter/material.dart';
import 'package:sena/screens/lista_aprendiz.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
                  // Profile Picture
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const ClipOval(
                      child: Icon(Icons.person, size: 40, color: Color(0xFF33A02C)),
                    ),
                  ),
                  const SizedBox(width: 15),
                  // Name and ID
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Wilson Duarte',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'ID:3435525',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Notification Icon
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Stack(
                      children: [
                        const Center(
                          child: Icon(
                            Icons.notifications_outlined,
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Message Icon
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Espacio para separar de la cabecera
            const SizedBox(height: 40),

            // Botones en forma de triángulo
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Línea 1
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navegamos a ListaAprendiz cuando se hace clic en este botón
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ListaAprendiz(),
                              ),
                            );
                          },
                          child: _buildDiamondMenuItem(
                            icon: Icons.badge_outlined,
                            label: 'Aprendiz\nRegistrado',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // Línea 2
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildDiamondMenuItem(
                          icon: Icons.person_outline_outlined,
                          label: 'Novedades de\naprendiz',
                          iconWithClock: true,
                        ),
                        _buildDiamondMenuItem(
                          icon: Icons.person_off_outlined,
                          label: 'Reportes de\nAprendices',
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    // Línea 3
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildDiamondMenuItem(
                          icon: Icons.calendar_today_outlined,
                          label: 'Solicitud de\nPermisos',
                        ),
                        _buildDiamondMenuItem(
                          icon: Icons.assignment_outlined,
                          label: 'Reportes',
                        ),
                        _buildDiamondMenuItem(
                          icon: Icons.casino_outlined,
                          label: 'Casino',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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

  static Widget _buildDiamondMenuItem({
    required IconData icon,
    required String label,
    bool iconWithClock = false,
  }) {
    return Transform.rotate(
      angle: 45 * 3.14159 / 180,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: const Color(0xFF33A02C),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Transform.rotate(
          angle: -45 * 3.14159 / 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconWithClock)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFFCCEBC5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        icon,
                        color: const Color(0xFF33A02C),
                        size: 24,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: const Color(0xFFCCEBC5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.access_time,
                          color: Color(0xFF33A02C),
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                )
              else
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCCEBC5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFF33A02C),
                    size: 24,
                  ),
                ),
              const SizedBox(height: 5),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}