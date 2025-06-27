import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vet_care_app/models/medical_record.dart';
import 'package:vet_care_app/models/patient.dart';
import 'package:vet_care_app/presentation/screens/home_page.dart';
import 'package:vet_care_app/providers/patients_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PatientAdapter());
  Hive.registerAdapter(MedicalRecordAdapter());
  await Hive.openBox<Patient>('patientsBox');
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => PatientsProvider(),
      child: const MainApp(),
    ),
  );
}


class MainApp extends StatelessWidget { 
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
