import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import '../models/patient.dart';
import '../models/medical_record.dart';

class PatientsProvider with ChangeNotifier {
  TextEditingController search = TextEditingController();
  get Search => search;
  set Search(value) {
    search = value;
    notifyListeners();
  }

  late Box<Patient> _patientsBox;
  final List<Patient> _patients = [];

  PatientsProvider() {
    _init();
  }

  Future<void> _init() async {
    // Abre la caja de pacientes (debe estar abierta antes en main)
    _patientsBox = Hive.box<Patient>('patientsBox');
    _patients.clear();
    _patients.addAll(_patientsBox.values);
    notifyListeners();
  }

  List<Patient> get patients => _patients;

  void addPatient(Patient patient) {
    _patients.add(patient);
    _patientsBox.put(patient.id, patient);
    notifyListeners();
  }

  void updatePatient(String patientId, Patient updatedPatient) {
    final index = _patients.indexWhere((p) => p.id == patientId);
    if (index != -1) {
      _patients[index] = updatedPatient;
      _patientsBox.put(patientId, updatedPatient);
      notifyListeners();
    }
  }

  void deletePatient(String patientId) {
    _patients.removeWhere((p) => p.id == patientId);
    _patientsBox.delete(patientId);
    notifyListeners();
  }

  void addMedicalRecord(Patient patient, MedicalRecord record) {
    final index = _patients.indexWhere((p) => p.id == patient.id);
    if (index != -1) {
      _patients[index].medicalRecords.add(record);
      _patientsBox.put(patient.id, _patients[index]);
      notifyListeners();
    }
  }

  void updateMedicalRecord(Patient patient, MedicalRecord record) {
    final patientIndex = _patients.indexWhere((p) => p.id == patient.id);
    if (patientIndex != -1) {
      final records = _patients[patientIndex].medicalRecords;
      final recordIndex = records.indexWhere((r) => r.id == record.id);
      if (recordIndex != -1) {
        records[recordIndex] = record;
        _patientsBox.put(patient.id, _patients[patientIndex]);
        notifyListeners();
      }
    }
  }

  void removeMedicalRecord(String patientId, String recordId) {
    final patientIndex = _patients.indexWhere((p) => p.id == patientId);
    if (patientIndex != -1) {
      _patients[patientIndex].medicalRecords.removeWhere((r) => r.id == recordId);
      _patientsBox.put(patientId, _patients[patientIndex]);
      notifyListeners();
    }
  }

  List<Patient> searchPatients(String query) {
    if (query.isEmpty) return _patients;
    return _patients.where((patient) {
      return patient.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  void filterPatients(String query) {
    notifyListeners();
  }

  Patient getPatientById(String id) {
    return _patients.firstWhere((p) => p.id == id);
  }

  int getInt() {
    return _patients.length;
  }
}