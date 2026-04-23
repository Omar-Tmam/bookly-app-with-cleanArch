
import 'package:bloc/bloc.dart';
import 'package:bookly_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubitCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubitCubit(this.fetchFeaturedBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase fetchFeaturedBooksUseCase;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await fetchFeaturedBooksUseCase.call();
    result.fold((l) {
      emit(FeaturedBooksFailure(l.errorMessage));
    }, (r) {
      emit(FeaturedBooksSuccess(books: r));
    });
  }
}
