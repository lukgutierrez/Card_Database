// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cards.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardAdapter extends TypeAdapter<Card> {
  @override
  final int typeId = 1;

  @override
  Card read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Card(
      numbercard: fields[0] as String,
      datecard: fields[1] as String,
      cvccard: fields[2] as String,
      peoplecard: fields[3] as String,
      dnipeople: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Card obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.numbercard)
      ..writeByte(1)
      ..write(obj.datecard)
      ..writeByte(2)
      ..write(obj.cvccard)
      ..writeByte(3)
      ..write(obj.peoplecard)
      ..writeByte(4)
      ..write(obj.dnipeople);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
