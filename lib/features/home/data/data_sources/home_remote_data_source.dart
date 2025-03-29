import 'package:bookly/core/constants/hive_boxes.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/functions/save_books.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchHomeBooks();
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchRelatedBooks();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService _apiService;

  HomeRemoteDataSourceImpl({required ApiService apiService})
      : _apiService = apiService;
  @override
  Future<List<BookEntity>> fetchHomeBooks() async {
    var data = await _apiService.get(
        endPoint: 'volumes?q=subject:Novels&filter=free-ebooks');
    List<BookEntity> books = getBooksList(data);
    saveBooksData(books, boxName: HiveBoxes.homeBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await _apiService.get(
        endPoint: 'volumes?q=subject:Novels&filter=free-ebooks&orderBy=newest');
    List<BookEntity> books = getBooksList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchRelatedBooks() async {
    var data = await _apiService.get(
        endPoint:
            'volumes?q=subject:Novels&filter=free-ebooks&orderBy=relevance');
    List<BookEntity> books = getBooksList(data);
    return books;
  }
}

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  for (var book in data['items']) {
    books.add(BookModel.fromJson(book));
  }
  return books;
}
