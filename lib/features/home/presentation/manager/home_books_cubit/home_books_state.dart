part of 'home_books_cubit.dart';

sealed class HomeBooksState {}

final class HomeBooksInitial extends HomeBooksState {}

final class HomeBooksLoading extends HomeBooksState {}

final class HomeBooksSuccess extends HomeBooksState {
  final List<BookEntity> books;

  HomeBooksSuccess({required this.books});
}

final class HomeBooksFailure extends HomeBooksState {
  final String errMessage;

  HomeBooksFailure({required this.errMessage});
}
