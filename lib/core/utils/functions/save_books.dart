import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

void saveBooksData(List<BookEntity> books, {required String boxName}) {
  Hive.box<BookEntity>(boxName).addAll(books);
}
