import 'package:hive/hive.dart';
import 'medical_record.dart';
import 'package:intl/intl.dart';
part 'patient.g.dart';

@HiveType(typeId: 0)
class Patient extends HiveObject {
  @HiveField(0)
  final String id;


  @HiveField(1)
  String name;

  @HiveField(2)
  String species;

  @HiveField(3)
  String? breed;

  @HiveField(4)
  DateTime? birthDate;

  @HiveField(5)
  String owner;

  @HiveField(6)
  List<MedicalRecord> medicalRecords;

  Patient({
    required this.id,
    required this.name,
    required this.species,
    this.breed,
    this.birthDate,
    required this.owner,
    List<MedicalRecord>? medicalRecords,
  }) : medicalRecords = medicalRecords ?? [];

  Patient copyWith({
    String? name,
    String? species,
    String? breed,
    DateTime? birthDate,
    String? owner,
  }) {
    return Patient(
      id: id,
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      birthDate: birthDate ?? this.birthDate,
      owner: owner ?? this.owner,
      medicalRecords: medicalRecords,
    );
  }
  get Id=>id??0;


String Date(DateTime? date) {
  if (date == null) return 'Sin fecha';
  return DateFormat('dd/MM/yyyy – HH:mm').format(date);
}
}
