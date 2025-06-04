import 'package:flutter/material.dart';
import 'package:sena/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SENA INTERNADO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF39A900),
          primary: const Color(0xFF39A900),
        ),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '¡Bienvenido!',
                  style: TextStyle(
                    color: Color(0xFF39A900),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                
                // SENA Logo - Ahora usando Image.asset
                Image.asset(
                  'assets/images/sena_logo.png',
                  width: 250,
                  height: 250,
                ),
                const SizedBox(height: 30),
                
                // INTERNADO Text
                const Text(
                  'INTERNADO',
                  style: TextStyle(
                    color: Color(0xFF39A900),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 30),
                
                // Bunk Bed Icon - Ahora usando Image.asset
                Image.asset(
                  'assets/images/bunk_bed.png',
                  width: 96,
                  height: 96,
                ),
                const SizedBox(height: 40),
                
                // Quote Text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '"Automatización y Eficiencia: hacia un internado moderno y organizado para todos".',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                
                // Buttons
                // Botón Comenzemos con navegación al login
                OutlinedButton(
                  onPressed: () {
                    // Navegar a la pantalla de login cuando se presiona el botón
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF39A900), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  child: const Text(
                    'Comenzemos',
                    style: TextStyle(
                      color: Color(0xFF39A900),
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF39A900), width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: const Size(double.infinity, 60),
                  ),
                  child: const Text(
                    'Acerca de mi',
                    style: TextStyle(
                      color: Color(0xFF39A900),
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Inscripciones button with prohibition sign
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    ElevatedButton(
                      onPressed: null, // Disabled button
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEDEDED),
                        foregroundColor: Colors.black,
                        disabledBackgroundColor: const Color(0xFFEDEDED),
                        disabledForegroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: const Size(double.infinity, 60),
                      ),
                      child: const Text(
                        'Inscripciones',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: Image.asset(
                        'assets/images/prohibition_sign.png',
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
