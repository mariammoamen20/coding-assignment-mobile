import 'package:comics/presentation/home/widgets/comic_item.dart';
import 'package:flutter/material.dart';

import '../../../data/api_manger.dart';
import '../../../data/comic_response.dart';


class ComicWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<ComicResponse>(
          future: ApiManger.getComicsData(),
          builder: (context,snapshot){
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }else if(snapshot.connectionState ==ConnectionState.waiting ){
              return const Center(child: CircularProgressIndicator());
            }
            var data = snapshot.data;
            if('error' == data?.status){
              return Text('${data?.message}');
            }
            return ComicItem(data!);
          },
        ),
      ],
    );
  }
}
