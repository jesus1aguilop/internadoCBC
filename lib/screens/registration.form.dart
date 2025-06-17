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

  void _completeRegistration() {
    if (_selectedTipoDocumento == null ||
        _numeroDocumentoController.text.isEmpty ||
        _selectedGenero == null ||
        _selectedEtnia == null ||
        _selectedDiscapacidad == null) {
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Información Incompleta'),
              content: const Text(
                'Por favor complete todos los campos del formulario.',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      );
      return;
    }

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

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Registro Exitoso'),
            content: const Text(
              'Su información ha sido registrada correctamente.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String tituloAppBar;
    if (widget.isAprendiz) {
      tituloAppBar = 'Registro de Aprendiz';
    } else if (widget.userData['rol'] == 'cocina') {
      tituloAppBar = 'Registro Cocina';
    } else {
      tituloAppBar = 'Registro de Administrador';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(tituloAppBar, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF39A900),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
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
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: const EdgeInsets.only(bottom: 30),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
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
                _buildDropdown(
                  'Discapacidad',
                  _selectedDiscapacidad,
                  ['Ninguna', 'Visual', 'Auditiva', 'Motriz', 'Otra'],
                  (val) => setState(() => _selectedDiscapacidad = val),
                ),
                const SizedBox(height: 20),
                _buildDropdown(
                  'Etnia',
                  _selectedEtnia,
                  [
                    'Mestizo',
                    'Indígena',
                    'Afrodescendiente',
                    'Caucásico',
                    'Otro',
                  ],
                  (val) => setState(() => _selectedEtnia = val),
                ),
                const SizedBox(height: 20),
                _buildDropdown(
                  'Género',
                  _selectedGenero,
                  ['Masculino', 'Femenino', 'No binario', 'Prefiero no decir'],
                  (val) => setState(() => _selectedGenero = val),
                ),
                const SizedBox(height: 20),
                _buildDropdown(
                  'Tipo de Documento',
                  _selectedTipoDocumento,
                  ['DNI', 'Pasaporte', 'Cédula', 'Otro'],
                  (val) => setState(() => _selectedTipoDocumento = val),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Número de Documento',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _numeroDocumentoController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
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
                            Icon(
                              _image == null ? Icons.close : Icons.check,
                              color: _image == null ? Colors.red : Colors.green,
                              size: 24,
                            ),
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
                Center(
                  child: ElevatedButton(
                    onPressed: _completeRegistration,
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

  Widget _buildDropdown(
    String label,
    String? currentValue,
    List<String> options,
    void Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
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
            value: currentValue,
            icon: const Icon(Icons.arrow_drop_down),
            isExpanded: true,
            onChanged: onChanged,
            items:
                options.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
