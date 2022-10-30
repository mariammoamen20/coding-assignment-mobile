import 'dart:convert';

import 'package:comics/data/comic_response.dart';
import 'package:comics/data/end_points.dart';
import 'package:http/http.dart' as http;


class ApiManger {
 // static var item = 615 ;
  static const String BASE_URL = 'xkcd.com';
  static Future<ComicResponse> getComicsData() async {
    var url  = Uri.https(BASE_URL , Config.comicsEndpoint);
    var response  = await http.get(url);
    var json = jsonDecode(response.body);
    ComicResponse comicResponse = ComicResponse.fromJson(json);
    return comicResponse;
  }

  static Future<ComicResponse> getCurrentComics() async {
    var url  = Uri.https(BASE_URL ,Config.currentComicEndpoint);
    var response  = await http.get(url);
    var json = jsonDecode(response.body);
    ComicResponse comicResponse = ComicResponse.fromJson(json);
    return comicResponse;
  }
}