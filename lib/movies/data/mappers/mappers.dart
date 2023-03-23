import 'package:cinema_app/app/extensions.dart';
import 'package:cinema_app/movies/data/response/responses.dart';
import 'package:cinema_app/movies/domain/models/cast_model.dart';
import 'package:cinema_app/movies/domain/models/details_model.dart';
import 'package:cinema_app/movies/domain/models/movies_model.dart';
import 'package:cinema_app/movies/domain/models/review_model.dart';

const zero = 0;
const empty = "";
const zeroDouble = 0.0;

// mapper -> change response into model
// movie reponse mappers
extension MoviesResponseMapper on MoviesResponse? {
  MoviesModel toDomain() {
    return MoviesModel(
      this?.id.orZero() ?? zero,
      this?.backdropPath.orEmpty() ?? empty,
      this?.posterPath.orEmpty() ?? empty,
      (this?.genreIds?.map((e) => e) ?? []).cast<int>().toList(),
      this?.title.orEmpty() ?? empty,
      this?.overview.orEmpty() ?? empty,
      this?.voteAverage.orZeroDouble() ?? zeroDouble,
      this?.releaseDate.orEmpty() ?? empty,
    );
  }
}

extension ResultsResponseMapper on ResultsResponse? {
  ResultsModel toDomain() {
    List<MoviesModel> movies = (this?.results?.map((e) => e.toDomain()) ?? [])
        .cast<MoviesModel>()
        .toList();
    var data = ResultsModel(movies);
    return data;
  }
}

// details response mapper
extension DetailsResponseMapper on DetailsResponse? {
  DetailsModel toDomain() {
    return DetailsModel(
      this?.id.orZero() ?? zero,
      this?.posterPath.orEmpty() ?? empty,
      this?.backdropPath.orEmpty() ?? empty,
      this?.title.orEmpty() ?? empty,
      (this?.genres?.map((e) => e.toDomain()) ?? []).cast<Genres>().toList(),
      this?.releaseDate.orEmpty() ?? empty,
      this?.voteAverage.orZeroDouble() ?? zeroDouble,
      this?.overview.orEmpty() ?? empty,
    );
  }
}

extension GenresResponseMapper on GenresResponse? {
  Genres toDomain() {
    return Genres(this?.id.orZero() ?? zero, this?.name.orEmpty() ?? empty);
  }
}

// review response mapper
extension ReviewResponseMapper on ReviewResponse? {
  Review toDomain() {
    return Review(
        this?.authorDetails.toDomain(), this?.content.orEmpty() ?? empty);
  }
}

extension AuthorReviewResponseMapper on AuthorReviewResponse? {
  AuthorDetails toDomain() {
    return AuthorDetails(
        this?.image.orEmpty() ?? empty,
        this?.userName.orEmpty() ?? empty,
        this?.rating.orZeroDouble() ?? zeroDouble);
  }
}

extension ResultReviewResponseMapper on ResultReviewResponse? {
  ResultReview toDomain() {
    List<Review> results =
        (this?.results?.map((e) => e.toDomain()) ?? []).cast<Review>().toList();
    var data = ResultReview(results);
    return data;
  }
}

// cast response mapper
extension CstResponseMapper on CastResponse? {
  CastModel toDomain() {
    return CastModel(
        this?.name.orEmpty() ?? empty, this?.image.orEmpty() ?? empty);
  }
}

extension ResultCastMapper on ResultCastResponse? {
  ResultCast toDomain() {
    List<CastModel> result =
        (this?.cast?.map((e) => e.toDomain()) ?? []).cast<CastModel>().toList();
    var data = ResultCast(result);
    return data;
  }
}
