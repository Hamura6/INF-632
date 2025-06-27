import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vet_care_app/presentation/screens/medical_record_page.dart';
import 'package:vet_care_app/presentation/screens/register_patients_page.dart';
import 'package:vet_care_app/presentation/widgets/layout_widget.dart';
import 'package:vet_care_app/presentation/widgets/patient_card.dart';
import 'package:vet_care_app/providers/patients_provider.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

@override
Widget build(BuildContext context) {
  return Consumer<PatientsProvider>(
    builder: (context, provider, child) {
      final patients = provider.Search.text.isEmpty
          ? provider.patients
          : provider.searchPatients(provider.Search.text);

      return LayoutWidget(
        title: 'Home',
        content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: provider.Search,
                decoration: InputDecoration(
                  labelText: 'Buscar pacientes',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      provider.Search.clear();
                      provider.filterPatients('');
                    },
                  ),
                ),
                onChanged: (value) {
                  provider.filterPatients(value);
                },
              ),
            ),
            Expanded(
              child: patients.isEmpty && provider.Search.text.isNotEmpty
                  ?  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sentiment_dissatisfied, size: 100,),
                        Text(
                          'No se encontraron pacientes',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary
                          ),
                        
                          ),
                      ],
                    )),
                  )
                  : ListView.builder(
                      itemCount: patients.length,
                      itemBuilder: (context, index) {
                        final patient = patients[index];
                        return PatientCard(
                          patient: patient,
                          onEdit: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RegisterPatientsPage(patient: patient),
                              ),
                            );
                          },
                          onDelete: () {
                            provider.deletePatient(patient.id);
                          },
                          onView: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MedicalRecordPage(patient: patient),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
        floating: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterPatientsPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      );
    },
  );
}
}
