import 'package:bookly_clean_arch/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_clean_arch/Features/home/data/data_sources/home_remote_data_soure.dart';
import 'package:bookly_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_clean_arch/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSoure homeRemoteDataSoure;

  HomeRepoImpl({required this.homeLocalDataSource, required this.homeRemoteDataSoure});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var booksList = homeLocalDataSource.fetchFeaturedBooks();
      if (booksList.isNotEmpty) {
        return (Right(booksList));
      }
      var booksListRemote = await homeRemoteDataSoure.fetchFeaturedBooks();
      return (Right(booksListRemote));
    } catch (e) {
      
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    try {
  var booksList = homeLocalDataSource.fetchNewestBooks();
  if (booksList.isNotEmpty) {
    return right(booksList);
  }
  var booksListRemote =await homeRemoteDataSoure.fetchNewestBooks();
  return right( booksListRemote);
}  catch (e) {
      return left(ServerFailure(e.toString()));
}
    
  }
}
