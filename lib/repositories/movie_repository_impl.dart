import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_movie_list/model/movie_model.dart';
import 'package:my_movie_list/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Dio _dio;

  MovieRepositoryImpl(this._dio);

  @override
  Future<Either<String, MovieResponseModel>> getDiscover({int page = 1}) async {
    try {
      final result = await _dio.get(
        '/discover/movie',
        queryParameters: {'page': page},
      );

      if (result.statusCode == 200 && result.data != null) {
        final model = MovieResponseModel.fromMap(result.data);
        return Right(model);
      }

      return left("Error get discover movies");
    } on DioException catch (e) {
      if (e.response != null) {
        return left(e.response.toString());
      }
      return left('Another on get discover movies');
    }
  }
}
