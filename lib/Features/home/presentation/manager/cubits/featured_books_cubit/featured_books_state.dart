part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksCubitState {}

final class FeaturedBooksCubitInitial extends FeaturedBooksCubitState {}
final class FeaturedBooksCubitLoading extends FeaturedBooksCubitState {}
final class FeaturedBooksCubitSuccess extends FeaturedBooksCubitState {
  final List<BookEntity> books;

  FeaturedBooksCubitSuccess({required this.books});
}
final class FeaturedBooksCubitFailure extends FeaturedBooksCubitState {
  final String errorMessage;

  FeaturedBooksCubitFailure(this.errorMessage);
}
