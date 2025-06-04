import 'package:flutter/material.dart';
import 'package:sena/screens/registration.form.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final Color senaGreen = const Color(0xFF39A900);
  bool isAprendiz = true;

  // Form controllers
  final TextEditingController _nombresController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nombresController.dispose();
    _apellidosController.dispose();
    _emailController.dispose();
    _telefonoController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top curved section with green background
            Container(
              color: senaGreen,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Login/Register toggle button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _buildToggleButton(context),
                  ),

                  // Registration type selection
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Aprendiz option
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAprendiz = true;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                  ),
                                  color: isAprendiz ? senaGreen : Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Registro del',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Aprendiz',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Administrador option
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isAprendiz = false;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                  ),
                                  color: !isAprendiz ? senaGreen : Colors.white,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Registro del',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Administrador',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
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

                  // Curved bottom edge
                  Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                        topRight: Radius.circular(200),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Form section
            Stack(
              alignment: Alignment.center,
              children: [
                // Background watermark
                Positioned(
                  child: Opacity(
                    opacity: 0.1,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: senaGreen,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),

                // Form fields
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildTextField(
                        'Nombres',
                        controller: _nombresController,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        'Apellidos',
                        controller: _apellidosController,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField('E-mail', controller: _emailController),
                      const SizedBox(height: 20),
                      _buildTextField(
                        'Teléfono',
                        controller: _telefonoController,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        'Contraseña',
                        isPassword: true,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        'Repetir Contraseña',
                        isPassword: true,
                        controller: _confirmPasswordController,
                      ),
                      const SizedBox(height: 40),

                      // Seguir button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to the next registration screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => RegistrationForm(
                                      isAprendiz: isAprendiz,
                                      userData: {
                                        'nombres': _nombresController.text,
                                        'apellidos': _apellidosController.text,
                                        'email': _emailController.text,
                                        'telefono': _telefonoController.text,
                                      },
                                    ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: senaGreen,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text(
                            'Seguir',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: senaGreen, width: 2),
      ),
      child: Row(
        children: [
          // Login button (inactive)
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Return to login screen
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(48),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          // Register button (active)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: senaGreen,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(48),
                ),
              ),
              alignment: Alignment.center,
              child: const Text(
                'Registrate',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String hint, {
    bool isPassword = false,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black54, fontSize: 16),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: senaGreen),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }
}
