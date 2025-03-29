import 'package:bookly/core/error/failure.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;

  HomeRepoImpl({
    required HomeRemoteDataSource homeRemoteDataSource,
    required HomeLocalDataSource homeLocalDataSource,
  })  : _homeRemoteDataSource = homeRemoteDataSource,
        _homeLocalDataSource = homeLocalDataSource;
  @override
  Future<Either<Failure, List<BookEntity>>> fetchHomeBooks() async {
    try {
      List<BookEntity> books;
      books = _homeLocalDataSource.getHomeBooks();
      if (books.isNotEmpty) return right(books);
      books = await _homeRemoteDataSource.fetchHomeBooks();
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
      List<BookEntity> books;
      books = _homeLocalDataSource.getNewestBooks();
      if (books.isNotEmpty) return right(books);
      books = await _homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchRelatedBooks() async {
    try {
      List<BookEntity> books;
      books = _homeLocalDataSource.getRelatedBooks();
      if (books.isNotEmpty) return right(books);
      books = await _homeRemoteDataSource.fetchRelatedBooks();
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
