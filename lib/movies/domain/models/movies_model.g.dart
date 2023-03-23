// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviesModelAdapter extends TypeAdapter<MoviesModel> {
  @override
  final int typeId = 0;

  @override
  MoviesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesModel(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      (fields[3] as List).cast<int>(),
      fields[4] as String,
      fields[5] as String,
      fields[6] as double,
      fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MoviesModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.genreIds)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.overview)
      ..writeByte(6)
      ..write(obj.voteAverage)
      ..writeByte(7)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
