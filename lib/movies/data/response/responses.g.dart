// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) =>
    MoviesResponse(
      json['id'] as int?,
      json['backdrop_path'] as String?,
      json['poster_path'] as String?,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['title'] as String?,
      json['overview'] as String?,
      (json['vote_average'] as num?)?.toDouble(),
      json['release_date'] as String?,
    );

Map<String, dynamic> _$MoviesResponseToJson(MoviesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'genre_ids': instance.genreIds,
      'title': instance.title,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'release_date': instance.releaseDate,
    };

ResultsResponse _$ResultsResponseFromJson(Map<String, dynamic> json) =>
    ResultsResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => MoviesResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsResponseToJson(ResultsResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

DetailsResponse _$DetailsResponseFromJson(Map<String, dynamic> json) =>
    DetailsResponse(
      json['id'] as int?,
      json['poster_path'] as String?,
      json['backdrop_path'] as String?,
      json['title'] as String?,
      (json['genres'] as List<dynamic>?)
          ?.map((e) => GenresResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['release_date'] as String?,
      (json['vote_average'] as num?)?.toDouble(),
      json['overview'] as String?,
    );

Map<String, dynamic> _$DetailsResponseToJson(DetailsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'title': instance.title,
      'genres': instance.genres,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
    };

GenresResponse _$GenresResponseFromJson(Map<String, dynamic> json) =>
    GenresResponse(
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$GenresResponseToJson(GenresResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) =>
    ReviewResponse(
      json['author_details'] == null
          ? null
          : AuthorReviewResponse.fromJson(
              json['author_details'] as Map<String, dynamic>),
      json['content'] as String?,
    );

Map<String, dynamic> _$ReviewResponseToJson(ReviewResponse instance) =>
    <String, dynamic>{
      'author_details': instance.authorDetails,
      'content': instance.content,
    };

AuthorReviewResponse _$AuthorReviewResponseFromJson(
        Map<String, dynamic> json) =>
    AuthorReviewResponse(
      json['avatar_path'] as String?,
      json['username'] as String?,
      (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AuthorReviewResponseToJson(
        AuthorReviewResponse instance) =>
    <String, dynamic>{
      'username': instance.userName,
      'rating': instance.rating,
      'avatar_path': instance.image,
    };

ResultReviewResponse _$ResultReviewResponseFromJson(
        Map<String, dynamic> json) =>
    ResultReviewResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => ReviewResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultReviewResponseToJson(
        ResultReviewResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

CastResponse _$CastResponseFromJson(Map<String, dynamic> json) => CastResponse(
      json['profile_path'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$CastResponseToJson(CastResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_path': instance.image,
    };

ResultCastResponse _$ResultCastResponseFromJson(Map<String, dynamic> json) =>
    ResultCastResponse(
      (json['cast'] as List<dynamic>?)
          ?.map((e) => CastResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultCastResponseToJson(ResultCastResponse instance) =>
    <String, dynamic>{
      'cast': instance.cast,
    };
