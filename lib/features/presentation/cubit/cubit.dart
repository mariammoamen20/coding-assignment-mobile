import 'dart:convert';

import 'package:comics/features/data/datasource/end_points.dart';
import 'package:comics/features/data/model/comic_response.dart';
import 'package:comics/features/presentation/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;

class ComicCubit extends Cubit<ComicsState>{
  ComicCubit():super(ComicInitialState());
  static ComicCubit get(context) => BlocProvider.of<ComicCubit>(context);

  final PageController pageController = PageController();

  ComicResponse finalComicResponse = ComicResponse();

  int item = 614;

  String BASE_URL = 'xkcd.com';

  Future<ComicResponse> getCurrentComics() async {
    var url = Uri.https(BASE_URL, EndPoint.currentComicEndpoint);
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    ComicResponse comicResponse = ComicResponse.fromJson(json);
    return comicResponse;
  }

  void getComicsData() async {
    var url  = Uri.https(BASE_URL , EndPoint.comicsEndpoint(item));
    var response  = await http.get(url);
    var json = jsonDecode(response.body);
    ComicResponse comicResponse = ComicResponse.fromJson(json);
    print(json);
    finalComicResponse = comicResponse;
    emit(GetComicState());
  }

  void increment() {
    item++;
    print('${item}');
    getComicsData();
    emit(ComicIncrementState());
  }
  void decrement(){
    item--;
    print('${item}');
    getComicsData();
    emit(ComicDecrementState());
  }

}