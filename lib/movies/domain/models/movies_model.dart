

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'movies_model.g.dart';
@HiveType(typeId: 0)
class MoviesModel extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  String backdropPath;
  @HiveField(2)
  String posterPath;
  @HiveField(3)
  List<int> genreIds;
  @HiveField(4)
  String title;
  @HiveField(5)
  String overview;
  @HiveField(6)
  double voteAverage;
  @HiveField(7)
  String releaseDate;

  MoviesModel(
      this.id,
      this.backdropPath,
      this.posterPath,
      this.genreIds,
      this.title,
      this.overview,
      this.voteAverage,
      this.releaseDate);
}

class ResultsModel extends Equatable{
  List<MoviesModel> results;

  ResultsModel(this.results);

  @override
  List<Object> get props => [results];
}
