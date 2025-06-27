// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicalRecordAdapter extends TypeAdapter<MedicalRecord> {
  @override
  final int typeId = 1;

  @override
  MedicalRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicalRecord(
      id: fields[0] as String,
      date: fields[1] as DateTime,
      description: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MedicalRecord obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicalRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
