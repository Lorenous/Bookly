import 'package:bookly/core/error/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchRelatedBooksUseCase extends UseCase<List<BookEntity>, void> {
  final HomeRepo _homeRepo;

  FetchRelatedBooksUseCase({required HomeRepo homeRepo}) : _homeRepo = homeRepo;
  @override
  Future<Either<Failure, List<BookEntity>>> call([void param]) async =>
      await _homeRepo.fetchRelatedBooks();
}
