import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_movie_list/Movies/provider/movie_get_detail_provider.dart';
import 'package:my_movie_list/Movies/provider/movie_get_now_playing_provider.dart';
import 'package:my_movie_list/Movies/provider/movie_get_popular_provider.dart';
import 'package:my_movie_list/Movies/provider/movie_get_top_rated_provider.dart';
import 'package:my_movie_list/Movies/provider/movie_get_upcoming_provider.dart';
import 'package:my_movie_list/Movies/provider/movie_search_provider.dart';
import 'package:my_movie_list/Movies/repositories/movie_repository.dart';
import 'package:my_movie_list/Movies/repositories/movie_repository_impl.dart';

import 'app_constanst.dart';

final sl = GetIt.instance;

void setup() {
  // Register Provider
  sl.registerFactory<MovieGetUpcomingProvider>(
    () => MovieGetUpcomingProvider(sl()),
  );
  sl.registerFactory<MovieGetTopRatedProvider>(
    () => MovieGetTopRatedProvider(sl()),
  );
  sl.registerFactory<MovieGetPopularProvider>(
    () => MovieGetPopularProvider(sl()),
  );
  sl.registerFactory<MovieGetNowPlayingProvider>(
    () => MovieGetNowPlayingProvider(sl()),
  );
  sl.registerFactory<MovieGetDetailProvider>(
    () => MovieGetDetailProvider(sl()),
  );
  sl.registerFactory<MovieSearchProvider>(
    () => MovieSearchProvider(sl()),
  );

  // Register Repository
  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(sl()));

  // Register Http Client (DIO)
  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        queryParameters: {'api_key': AppConstants.apiKey},
      ),
    ),
  );
}
