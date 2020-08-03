
import 'dart:convert';

import 'package:http/http.dart';
import 'package:pagination/models/photos.dart';
import 'package:pagination/models/response_model.dart';

class PhotoApiProvider {

  Client client = Client();
  final _apiKey = '6f102c62f41998d151e5a1b48713cf13';


   Future<Photos> fetchPhotos(int page) async {
     final response = await client.get('https://api.flickr.com/services/rest/'+
         '?method=flickr.photos.getRecent'+
         '&format=json&nojsoncallback=1&extras=url_s'+
         '&api_key=$_apiKey'+
         '&per_page=20'+
         '&page=$page');
     print(response.body.toString());
     if (response.statusCode == 200) {
       return ResponseModel.fromJson(json.decode(response.body)).photos;
     } else {
       throw Exception('Error ${response.statusCode}: Failed to load post');
     }
   }
}