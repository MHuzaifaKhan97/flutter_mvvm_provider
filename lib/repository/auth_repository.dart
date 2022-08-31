import 'package:flutter_mvvm_provider/data/network/base_api_services.dart';
import 'package:flutter_mvvm_provider/data/network/network_api_services.dart';
import 'package:flutter_mvvm_provider/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkAPIService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppURLs.login, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerAPI(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppURLs.register, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
