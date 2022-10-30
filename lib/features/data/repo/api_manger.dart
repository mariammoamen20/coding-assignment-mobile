import 'dart:convert';
import 'package:comics/features/data/model/comic_response.dart';
import 'package:comics/features/data/datasource/end_points.dart';
import 'package:http/http.dart' as http;


class ApiManger {
  //current comic
/*  static Future<ComicResponse> getCurrentComics() async {
    var url  = Uri.https(BASE_URL ,EndPoint.currentComicEndpoint);
    var response  = await http.get(url);
    var json = jsonDecode(response.body);
    ComicResponse comicResponse = ComicResponse.fromJson(json);
    return comicResponse;
  }

 // static var item = 615 ;
  static const String BASE_URL = 'xkcd.com';
  static Future<ComicResponse> getComicsData() async {
    var url  = Uri.https(BASE_URL , EndPoint.comicsEndpoint);
    var response  = await http.get(url);
    var json = jsonDecode(response.body);
    ComicResponse comicResponse = ComicResponse.fromJson(json);
    return comicResponse;
  }*/

}