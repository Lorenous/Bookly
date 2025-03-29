part of 'related_books_cubit.dart';

sealed class RelatedBooksState {}

final class RelatedBooksInitial extends RelatedBooksState {}

final class RelatedBooksLoading extends RelatedBooksState {}

final class RelatedBooksSuccess extends RelatedBooksState {
  final List<BookEntity> books;

  RelatedBooksSuccess({required this.books});
}

final class RelatedBooksFailure extends RelatedBooksState {
  final String errMessage;

  RelatedBooksFailure({required this.errMessage});
}
