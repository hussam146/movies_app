

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class DetailsModel extends Equatable{

  int id;
  String posterPath;
  String backdropPath;
  String title;
  List<Genres> genres;
  String releaseDate;
  double voteAverage;
  String overview;

  DetailsModel(this.id, this.posterPath, this.backdropPath, this.title,
      this.genres, this.releaseDate, this.voteAverage, this.overview);

  @override
  List<Object?> get props => [id,posterPath ,backdropPath,title,genres,releaseDate,voteAverage,overview];

}

class Genres extends Equatable{
  int id;
  String name;

  Genres(this.id, this.name);

  @override
  List<Object?> get props => [id, name];
}