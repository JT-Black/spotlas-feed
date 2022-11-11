import 'package:spotlas_feed/data_layer/spotlas_model.dart';
import 'data_provider.dart';

class DataRepository {
  final _dataProvider = DataProvider();

  Future<List<SpotlasModel>> fetchFeedList() {
    return _dataProvider.fetchFeedList();
  }
}

class NetworkError extends Error {}
