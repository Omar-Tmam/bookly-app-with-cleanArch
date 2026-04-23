import 'package:bloc/bloc.dart';
import 'package:bookly_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubitCubit extends Cubit<FeaturedBooksCubitState> {
  FeaturedBooksCubitCubit() : super(FeaturedBooksCubitInitial());
}
