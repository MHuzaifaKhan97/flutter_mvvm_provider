import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/data/response/api_response.dart';
import 'package:flutter_mvvm_provider/model/movies_model.dart';
import 'package:flutter_mvvm_provider/repository/home_repository.dart';

class HomeviewModel with ChangeNotifier {
  final _homeRepository = HomeRepository();
  APIResponse<MoviesListModel> moviesList = APIResponse.loading();

  setMovieList(APIResponse<MoviesListModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> getMoviesList() async {
    setMovieList(APIResponse.loading());
    await _homeRepository.getMoviesList().then((value) {
      setMovieList(APIResponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieList(APIResponse.error(error.toString()));
    });
  }
}
