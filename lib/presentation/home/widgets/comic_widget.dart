import 'package:comics/presentation/home/widgets/comic_item.dart';
import 'package:comics/presentation/home/widgets/current_comic.dart';
import 'package:comics/presentation/home/widgets/custome_text.dart';
import 'package:flutter/material.dart';

import '../../../data/api_manger.dart';
import '../../../data/comic_response.dart';


class ComicWidget extends StatelessWidget {
 ComicResponse comicResponse = ComicResponse();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       FutureBuilder<ComicResponse>(
          future: ApiManger.getCurrentComics(),
          builder: (context,snapshot){
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }else if(snapshot.connectionState ==ConnectionState.waiting ){
              return const Center(child: CircularProgressIndicator());
            }
            var data = snapshot.data;
            return CurrentComicItem(data!);
          },
        ),
       FutureBuilder<ComicResponse>(
          future: ApiManger.getComicsData(),
          builder: (context,snapshot){
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }else if(snapshot.connectionState ==ConnectionState.waiting ){
              return const Center(child: CircularProgressIndicator());
            }
            var data = snapshot.data;
            return ComicItem(data!);
          },
        )
      ],
    );
  }
}
