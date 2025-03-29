import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_home_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_books_state.dart';

class HomeBooksCubit extends Cubit<HomeBooksState> {
  HomeBooksCubit({required FetchHomeBooksUseCase fetchHomeBooksUseCase})
      : _fetchHomeBooksUseCase = fetchHomeBooksUseCase,
        super(HomeBooksInitial());

  final FetchHomeBooksUseCase _fetchHomeBooksUseCase;
  Future<void> fetchHomeBooks() async {
    emit(HomeBooksLoading());
    final result = await _fetchHomeBooksUseCase.call();
    result.fold(
      (failure) => emit(
        HomeBooksFailure(errMessage: failure.errMessage),
      ),
      (books) => emit(
        HomeBooksSuccess(books: books),
      ),
    );
  }
}
