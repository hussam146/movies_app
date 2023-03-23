


class Review{
  AuthorDetails? authorDetails;
  String content;

  Review(this.authorDetails, this.content);
}

class AuthorDetails{
  String userName;
  double rating;
  String image;

  AuthorDetails(this.image, this.userName, this.rating);
}

class ResultReview{
  List<Review> results;

  ResultReview(this.results);
}