import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> getHomeBooks();
  List<BookEntity> getNewestBooks();
  List<BookEntity> getRelatedBooks();
}

class HomeLocalDataSorceImp implements HomeLocalDataSource {
  @override
  List<BookEntity> getHomeBooks() {
    // TODO: implement getHomeBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> getNewestBooks() {
    // TODO: implement getNewestBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> getRelatedBooks() {
    // TODO: implement getRelatedBooks
    throw UnimplementedError();
  }
}
