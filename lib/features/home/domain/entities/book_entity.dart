class BookEntity {
  final String title;
  final String authorName;
  final num price;
  final num ratingAvg;
  final num ratingCount;

  BookEntity({
    required this.title,
    required this.authorName,
    required this.price,
    required this.ratingAvg,
    required this.ratingCount,
  });
}
