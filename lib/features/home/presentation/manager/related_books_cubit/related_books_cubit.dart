import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_related_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'related_books_state.dart';

class RelatedBooksCubit extends Cubit<RelatedBooksState> {
  RelatedBooksCubit(
      {required FetchRelatedBooksUseCase fetchRelatedBooksUseCase})
      : _fetchRelatedBooksUseCase = fetchRelatedBooksUseCase,
        super(RelatedBooksInitial());
  final FetchRelatedBooksUseCase _fetchRelatedBooksUseCase;
  Future<void> fetchRelatedBooks() async {
    emit(RelatedBooksLoading());
    final result = await _fetchRelatedBooksUseCase.call();
    result.fold(
      (failure) => emit(RelatedBooksFailure(errMessage: failure.errMessage)),
      (books) => emit(RelatedBooksSuccess(books: books)),
    );
  }
}
