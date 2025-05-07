import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'home_page.dart';

class RegistrationForm extends StatefulWidget {
  final bool isAprendiz;
  final Map<String, String> userData;

  const RegistrationForm({
    super.key,
    required this.isAprendiz,
    required this.userData,
  });

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String? _selectedDiscapacidad;
  String? _selectedEtnia;
  String? _selectedGenero;
  String? _selectedTipoDocumento;
  final TextEditingController _numeroDocumentoController =
      TextEditingController();
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1000,
      maxHeight: 1000,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _numeroDocumentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isAprendiz
              ? 'Registro de Aprendiz'
              : 'Registro de Administrador',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF39A900),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          // Background curve
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(300),
                  topRight: Radius.circular(300),
                ),
              ),
            ),
          ),

          // Form content
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Show data from first screen
                Card(
                  margin: const EdgeInsets.only(bottom: 30),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Información Básica',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF39A900),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('Nombres: ${widget.userData['nombres']}'),
                        Text('Apellidos: ${widget.userData['apellidos']}'),
                        Text('Email: ${widget.userData['email']}'),
                        Text('Teléfono: ${widget.userData['telefono']}'),
                      ],
                    ),
                  ),
                ),

                // Discapacidades dropdown
                const Text(
                  'Discapacidades',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none,
                      hintText: 'Seleccionar',
                    ),
                    value: _selectedDiscapacidad,
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedDiscapacidad = newValue;
                      });
                    },
                    items:
                        <String>[
                          'Ninguna',
                          'Visual',
                          'Auditiva',
                          'Motriz',
                          'Otra',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),

                const SizedBox(height: 20),

                // Etnia dropdown
                const Text(
                  'Etnia',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none,
                      hintText: 'Seleccionar',
                    ),
                    value: _selectedEtnia,
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedEtnia = newValue;
                      });
                    },
                    items:
                        <String>[
                          'Mestizo',
                          'Indígena',
                          'Afrodescendiente',
                          'Caucásico',
                          'Otro',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),

                const SizedBox(height: 20),

                // Género dropdown
                const Text(
                  'Género',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none,
                      hintText: 'Seleccionar',
                    ),
                    value: _selectedGenero,
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedGenero = newValue;
                      });
                    },
                    items:
                        <String>[
                          'Masculino',
                          'Femenino',
                          'No binario',
                          'Prefiero no decir',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),

                const SizedBox(height: 20),

                // Tipo de Documento dropdown
                const Text(
                  'Tipo de Documento',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      border: InputBorder.none,
                      hintText: 'Seleccionar',
                    ),
                    value: _selectedTipoDocumento,
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedTipoDocumento = newValue;
                      });
                    },
                    items:
                        <String>[
                          'DNI',
                          'Pasaporte',
                          'Cédula',
                          'Otro',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                  ),
                ),

                const SizedBox(height: 20),

                // Número de Documento text field
                const Text(
                  'Número de Documento',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _numeroDocumentoController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 40),

                // Adjuntar Foto button
                Center(
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: _getImage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF008037),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 15,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Adjuntar Foto',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 10),
                            if (_image == null) ...[
                              const Icon(
                                Icons.close,
                                color: Colors.red,
                                size: 24,
                              ),
                            ] else ...[
                              const Icon(
                                Icons.check,
                                color: Colors.green,
                                size: 24,
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        '(Tamaño Máximo 500kb)',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Registrate button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Complete registration and process all form data
                      _completeRegistration();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.black, width: 1),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'Registrate',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                ),

                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _completeRegistration() {
    // Validate form
    if (_selectedTipoDocumento == null ||
        _numeroDocumentoController.text.isEmpty ||
        _selectedGenero == null ||
        _selectedEtnia == null ||
        _selectedDiscapacidad == null) {
      // Show error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Información Incompleta'),
            content: const Text(
              'Por favor complete todos los campos del formulario.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Combine data from both forms
    final Map<String, dynamic> completeData = {
      ...widget.userData,
      'tipo_documento': _selectedTipoDocumento,
      'numero_documento': _numeroDocumentoController.text,
      'genero': _selectedGenero,
      'etnia': _selectedEtnia,
      'discapacidad': _selectedDiscapacidad,
      'es_aprendiz': widget.isAprendiz,
      'foto': _image?.path,
    };

    // Aquí normalmente enviarías los datos al backend
    // Para esta implementación, mostraremos un mensaje de éxito y navegaremos al HomePage
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registro Exitoso'),
          content: const Text(
            'Su información ha sido registrada correctamente.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Cerrar el diálogo
                Navigator.of(context).pop();

                // Navegar a la página de inicio con los datos del usuario
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => const HomePage(
                          // Podrías pasar datos del usuario aquí si es necesario
                        ),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
