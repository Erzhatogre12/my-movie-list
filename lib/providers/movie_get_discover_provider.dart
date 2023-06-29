import 'package:flutter/material.dart';
import 'package:my_movie_list/model/movie_model.dart';
import 'package:my_movie_list/repositories/movie_repository.dart';

class MovieGetDiscoverProvide with ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieGetDiscoverProvide(this._movieRepository);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<MovieModel> _movies = [];
  List<MovieModel> get movies => _movies;

  void getDicover(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final result = await _movieRepository.getDiscover();

    result.fold(
      (errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );

        _isLoading = false;
        notifyListeners();
      },
      (response) {
        _movies.clear();
        _movies.addAll(response.results);

        _isLoading = false;
        notifyListeners();
      },
    );
  }
}
