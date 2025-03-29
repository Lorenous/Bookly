import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class BookEntity extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String authorName;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final num price;
  @HiveField(4)
  final num ratingAvg;
  @HiveField(5)
  final num ratingCount;

  BookEntity({
    required this.title,
    required this.authorName,
    required this.price,
    required this.ratingAvg,
    required this.ratingCount,
    required this.image,
  });
}
