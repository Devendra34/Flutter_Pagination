
import 'package:pagination/models/photos.dart';
import 'package:pagination/resources/api_provider.dart';

class Repository {
  final apiProvider = PhotoApiProvider();

  Future<Photos> fetchPhotos(int page) => apiProvider.fetchPhotos(page);
}