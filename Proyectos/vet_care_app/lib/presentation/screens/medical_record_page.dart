import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_care_app/models/medical_record.dart';
import 'package:vet_care_app/models/patient.dart';
import 'package:vet_care_app/presentation/widgets/layout_widget.dart';
import 'package:vet_care_app/providers/patients_provider.dart';

class MedicalRecordPage extends StatelessWidget {
  final Patient patient;
  const MedicalRecordPage({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    final patientProvider = context.watch<PatientsProvider>();
    final updatedPatient = patientProvider.getPatientById(patient.id);

    return LayoutWidget(
      title: 'Historial',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          _buildPatientInfo(updatedPatient, context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Historial Clínico',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
          Expanded(
            child: updatedPatient.medicalRecords.isEmpty
                ? const Center(
                    child: Text('No hay registros clínicos',
                        style: TextStyle(fontSize: 16)))
                : ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: updatedPatient.medicalRecords.length,
                    itemBuilder: (context, index) {
                      final record = updatedPatient.medicalRecords[index];
                      return _buildRecordCard(context, updatedPatient.id, record);
                    },
                  ),
          ),
        ],
      ),
      floating: FloatingActionButton.extended(
        onPressed: () => _showAddRecordDialog(context:  context),
        label: const Text('Añadir registro'),
        icon: const Icon(Icons.add),
      ),  
    );
  }

  Widget _buildPatientInfo(Patient patient,context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 233, 220, 254),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(31, 0, 0, 0),
            blurRadius: 6,
            offset: Offset(3, 9),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Datos del Clínico',
              style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 24
                  ),
            ),
          _infoText('Nombre', patient.name,context),
          _infoText('Especie', patient.species,context),
            _infoText('Raza', patient.breed!,context),
            _infoText('Nacimiento', patient.Date (patient.birthDate!),context),
          _infoText('Propietario', patient.owner,context),
        ],
      ),
    );
  }

  Widget _infoText(String label, String value, context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  Widget _buildRecordCard(BuildContext context, String patientId, MedicalRecord record) {
    return GestureDetector(
      onTap: (){
        _showAddRecordDialog(context:  context,record: record);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        elevation: 3,
        child: Dismissible(
          key: Key(record.id),
          direction: DismissDirection.endToStart,
          background: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 141, 12, 12),
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20.0),
            child: const Icon(Icons.delete_forever, color: Colors.white, size: 30),
          ),
          confirmDismiss: (_) => _confirmDeleteDialog(context),
          onDismissed: (_) {
            context.read<PatientsProvider>().removeMedicalRecord(patientId, record.id);
          },
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            title:Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(_formatDateTime(record.date),
                  style: TextStyle(color: Colors.grey.shade600)),
            ), 
            subtitle: Text(record.description,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            leading: const Icon(Icons.medical_services_outlined, color: Colors.teal),
          ),
        ),
      ),
    );
  }

  void _showAddRecordDialog({required BuildContext context, MedicalRecord? record=null}) {
    final descriptionController = TextEditingController();
    descriptionController.text=record?.description??'';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Nueva entrada clínica'),
        content: TextField(
          controller: descriptionController,
          decoration: const InputDecoration(
            labelText: 'Descripción',
            border: OutlineInputBorder(),
          ),
          maxLines: 4,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            onPressed: () {
              final text = descriptionController.text.trim();
              if (text.isNotEmpty) {
                final newRecord = MedicalRecord(
                  id: record?.id??patient.medicalRecords.length.toString(),
                  date: DateTime.now(),
                  description: text,
                );
                if(record!=null){
                  context.read<PatientsProvider>().updateMedicalRecord(patient, newRecord);

                }else{
                context.read<PatientsProvider>().addMedicalRecord(patient, newRecord);

                }
                Navigator.pop(context);
              }
            },
            label: Text(record==null?'Guardar':'Actualizar'),
          ),
        ],
      ),
    );
  }

  Future<bool?> _confirmDeleteDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Eliminar registro'),
        content: const Text('¿Deseas eliminar este registro clínico?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancelar')),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );
  }



  String _formatDateTime(DateTime date) =>patient.Date(date);
}
