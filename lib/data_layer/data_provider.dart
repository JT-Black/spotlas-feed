// import 'package:flutter/services.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:spotlas_feed/data_layer/spotlas_model.dart';

class DataProvider {
  final Dio _dio = Dio();
  final String _url = 'https://dev.api.spotlas.com/interview/feed?page=1';

  Future<List<SpotlasModel>> fetchFeedList() async {
    try {
      Response response = await _dio.get(_url);
      var data = response.data;
      // final String response = await rootBundle.loadString('assets/response.json');
      // final data = await json.decode(response);

      List<SpotlasModel> items = [];
      data.forEach((value) {
        items.add(SpotlasModel.fromJson(value));
      });
      // print(items);
      return items;
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      rethrow;
      // return SpotlasModel.withError("Data not found / Connection issue");
    }
  }
}
