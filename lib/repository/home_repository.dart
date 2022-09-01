import 'package:flutter_mvvm_provider/data/network/base_api_services.dart';
import 'package:flutter_mvvm_provider/data/network/network_api_services.dart';
import 'package:flutter_mvvm_provider/model/movies_model.dart';
import 'package:flutter_mvvm_provider/res/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkAPIService();

  Future<MoviesListModel> getMoviesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppURLs.getMoviesList);
      return response = MoviesListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
