// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';
// movie data
@JsonSerializable()
class MoviesResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "genre_ids")
  List<int>? genreIds;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "release_date")
  String? releaseDate;

  MoviesResponse(this.id, this.backdropPath, this.posterPath, this.genreIds,
      this.title, this.overview, this.voteAverage, this.releaseDate);

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

@JsonSerializable()
class ResultsResponse {
  @JsonKey(name: "results")
  List<MoviesResponse>? results;

  ResultsResponse(this.results);

  factory ResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsResponseToJson(this);
}

// movie details
@JsonSerializable()
class DetailsResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "genres")
  List<GenresResponse>? genres;
  @JsonKey(name: "release_date")
  String? releaseDate;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "overview")
  String? overview;

  DetailsResponse(this.id, this.posterPath, this.backdropPath, this.title,
      this.genres, this.releaseDate, this.voteAverage, this.overview);

  factory DetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsResponseToJson(this);
}

@JsonSerializable()
class GenresResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;

  GenresResponse(this.id, this.name);

  factory GenresResponse.fromJson(Map<String, dynamic> json) =>
      _$GenresResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenresResponseToJson(this);
}

// reviews on movie
@JsonSerializable()
class ReviewResponse {
  @JsonKey(name: "author_details")
  AuthorReviewResponse? authorDetails;
  @JsonKey(name: "content")
  String? content;

  ReviewResponse(this.authorDetails, this.content);

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);
}

@JsonSerializable()
class AuthorReviewResponse {
  @JsonKey(name: "username")
  String? userName;
  @JsonKey(name: "rating")
  double? rating;
  @JsonKey(name: "avatar_path")
  String? image;

  AuthorReviewResponse(this.image, this.userName, this.rating);

  factory AuthorReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorReviewResponseToJson(this);

}

@JsonSerializable()
class ResultReviewResponse {
  @JsonKey(name: "results")
  List<ReviewResponse>? results;

  ResultReviewResponse(this.results);

  factory ResultReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultReviewResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResultReviewResponseToJson(this);
}

// cast movie
@JsonSerializable()
class CastResponse{
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "profile_path")
  String? image;

  CastResponse(this.image, this.name);

  factory CastResponse.fromJson(Map<String, dynamic> json) =>_$CastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CastResponseToJson(this);
}

@JsonSerializable()
class ResultCastResponse{
  @JsonKey(name: "cast")
  List<CastResponse>? cast;

  ResultCastResponse(this.cast);

  factory ResultCastResponse.fromJson(Map<String, dynamic> json) =>_$ResultCastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResultCastResponseToJson(this);
}