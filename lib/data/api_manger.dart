import 'dart:convert';

import 'package:comics/data/comic_response.dart';
import 'package:http/http.dart' as http;


class ApiManger{
  static const String BASE_URL = 'xkcd.com';

  static Future<ComicResponse> getComicsData() async {
    var url  = Uri.https(BASE_URL , '/614/info.0.json');
    var response  = await http.get(url);
    var json = jsonDecode(response.body);
    ComicResponse comicResponse = ComicResponse.fromJson(json);
    return comicResponse;
  }

}