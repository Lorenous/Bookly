import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit({required FetchNewestBooksUseCase fetchNewestBooksUseCase})
      : _fetchNewestBooksUseCase = fetchNewestBooksUseCase,
        super(NewestBooksInitial());
  final FetchNewestBooksUseCase _fetchNewestBooksUseCase;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    final result = await _fetchNewestBooksUseCase.call();
    result.fold(
      (failure) => emit(NewestBooksFailure(errMessage: failure.errMessage)),
      (books) => emit(NewestBooksSuccess(books: books)),
    );
  }
}
