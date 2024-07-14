class Book {
  String type;
  String name;
  String publisher;
  DateTime date;
  String imgUrl;
  num score;
  num ratings;
  String review;
  num height;
  Book(
    this.type,
    this.name,
    this.publisher,
    this.date,
    this.imgUrl,
    this.score,
    this.ratings,
    this.review,
    this.height,
  );
  static List<Book> generateBooks() {
    return [
      Book(
        'Fantasy',
        'A Fragment Away',
        'Toromo Publishers',
        DateTime(2023, 3, 23),
        'assets/images/pexels-maksim-romashkin-7108217.jpg',
        4.9,
        900,
        'This is one of the best books I have ever read',
        220.0),
    ];
  }
}
