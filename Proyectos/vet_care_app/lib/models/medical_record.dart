import 'package:hive/hive.dart';

part 'medical_record.g.dart';

@HiveType(typeId: 1) // Usa un typeId único, diferente al de Patient
class MedicalRecord {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final String description;

  MedicalRecord({
    required this.id,
    required this.date,
    required this.description,
  });
}
