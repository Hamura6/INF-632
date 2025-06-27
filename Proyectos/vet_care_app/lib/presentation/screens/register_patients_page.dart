import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_care_app/models/patient.dart';
import 'package:vet_care_app/presentation/widgets/date_widget.dart';
import 'package:vet_care_app/presentation/widgets/drop_down_widget.dart';
import 'package:vet_care_app/presentation/widgets/layout_widget.dart';
import 'package:vet_care_app/providers/patients_provider.dart';

class RegisterPatientsPage extends StatefulWidget {
  final Patient? patient;

  const RegisterPatientsPage({super.key, this.patient = null});

  @override
  State<RegisterPatientsPage> createState() => _RegisterPatientsPageState();
}

class _RegisterPatientsPageState extends State<RegisterPatientsPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late String _species;
  late TextEditingController _breedController;
  late TextEditingController _ownerController;
  DateTime? _birthDate;
  late TextEditingController _birthDateController;


  @override
  void initState() {
    super.initState();

    final patient = widget.patient;

    _nameController = TextEditingController(text: patient?.name ?? '');
    _species = patient?.species ??'Gato';
    _breedController = TextEditingController(text: patient?.breed ?? '');
    _ownerController = TextEditingController(text: patient?.owner ?? '');
    _birthDate = patient?.birthDate;

    _birthDateController = TextEditingController(
      text:
          _birthDate != null
              ? '${_birthDate!.day.toString().padLeft(2, '0')}/'
                  '${_birthDate!.month.toString().padLeft(2, '0')}/'
                  '${_birthDate!.year}'
              : '',
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _breedController.dispose();
    _ownerController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  void _savePatient() {
    if (_formKey.currentState!.validate()) {
      final provider = Provider.of<PatientsProvider>(context, listen: false);
      final newPatient = Patient(
        id: widget.patient?.id ?? provider.getInt().toString(),
        name: _nameController.text.trim(),
        species: _species,
        breed:
            _breedController.text.trim().isEmpty
                ? null
                : _breedController.text.trim(),
        birthDate: _birthDate,
        owner: _ownerController.text.trim(),
      );

      // Aquí activa update o add según corresponda

      if (widget.patient != null) {
        provider.updatePatient(widget.patient?.Id, newPatient);
      } else {
        provider.addPatient(newPatient);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.patient != null;

    return LayoutWidget(
      title: isEdit ? 'Editar paciente' : 'Registrar paciente',
      content: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 16   ,
            children: [
              // Nombre
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
                validator:
                    (value) =>
                        (value == null || value.isEmpty)
                            ? 'Ingrese el nombre'
                            : null,
              ),

              // Especie (dropdown)
              DropDownWidget(
                label: 'Categoría',
                items: ['Gato', 'Perro', 'Ave', 'Hamster', 'Conejo', 'Pez'],
                selected: _species,
                onChanged: (value) {
                    setState(() {
                      _species = value??'Gato';
                    });

                },
              ),

              // Raza
              TextFormField(
                controller: _breedController,
                decoration: InputDecoration(
                  labelText: 'Raza (opcional)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),

              // Propietario
              TextFormField(
                controller: _ownerController,
                decoration: InputDecoration(
                  labelText: 'Propietario',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
                validator:
                    (value) =>
                        (value == null || value.isEmpty)
                            ? 'Ingrese propietario'
                            : null,
              ),

              // Fecha de nacimiento
              DateWidget(
                birthDateController: _birthDateController,
                onChanged: (value) {
                  setState(() {
                    _birthDate = value;
                  });
                },
              ),


              // Botón guardar/actualizar
              FilledButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 5,
                ),
                onPressed: _savePatient,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 7,
                  children: [
                    Icon(Icons.file_copy),
                    Text(
                      isEdit ? 'Actualizar' : 'Guardar',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
