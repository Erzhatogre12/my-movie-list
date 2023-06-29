import 'package:dartz/dartz.dart';
import 'package:my_movie_list/model/movie_model.dart';

abstract class MovieRepository {
  Future<Either<String, MovieResponseModel>> getDiscover({int page = 1});
}
