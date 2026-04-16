import 'package:bookly_clean_arch/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_clean_arch/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch/core/utils/api_service.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSoure {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSoureImpl extends HomeRemoteDataSoure {
  final ApiService apiService;
  HomeRemoteDataSoureImpl(this.apiService);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async{
    List<BookEntity> books = [];
    
   var data = await apiService.get(endPoint: 'volumes?filter=free-ebooks&q=programming');
   getBooksList(data, books);
   return books;
  }

  void getBooksList(Map<String, dynamic> data, List<BookEntity> books) {
    for(var item in data['items']){
     books.add(BookModel.fromJson(item));
    }
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}
