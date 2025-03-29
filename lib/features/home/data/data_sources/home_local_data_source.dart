import 'package:bookly/core/constants/hive_boxes.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getHomeBooks();
  List<BookEntity> getNewestBooks();
  List<BookEntity> getRelatedBooks();
}

class HomeLocalDataSorceImp implements HomeLocalDataSource {
  @override
  List<BookEntity> getHomeBooks() =>
      Hive.box<BookEntity>(HiveBoxes.homeBooks).values.toList();

  @override
  List<BookEntity> getNewestBooks() =>
      Hive.box<BookEntity>(HiveBoxes.newestBooks).values.toList();

  @override
  List<BookEntity> getRelatedBooks() =>
      Hive.box<BookEntity>(HiveBoxes.relatedBooks).values.toList();
}
