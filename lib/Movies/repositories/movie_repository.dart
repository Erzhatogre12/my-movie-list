import 'package:dartz/dartz.dart';
import 'package:my_movie_list/Movies/model/movie_detail_model.dart';
import 'package:my_movie_list/Movies/model/movie_model.dart';

abstract class MovieRepository {
  Future<Either<String, MovieResponseModel>> getTopRated({int page = 1});
  Future<Either<String, MovieResponseModel>> getPopular({int page = 1});
  Future<Either<String, MovieResponseModel>> getUpcoming({int page = 1});
  Future<Either<String, MovieResponseModel>> getNowPlaying({int page = 1});
  Future<Either<String, MovieResponseModel>> search({required String query});
  Future<Either<String, MovieDetailModel>> getDetail({required int id});
}
