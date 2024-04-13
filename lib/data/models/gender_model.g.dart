// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FaceRegonationModelAdapter extends TypeAdapter<FaceRegonationModel> {
  @override
  final int typeId = 0;

  @override
  FaceRegonationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FaceRegonationModel(
      result_image: fields[0] as String,
      faces: (fields[1] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, FaceRegonationModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.result_image)
      ..writeByte(1)
      ..write(obj.faces);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FaceRegonationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
