import 'package:comics/core/utilites/custome_text.dart';
import 'package:flutter/material.dart';

import '../../../data/model/comic_response.dart';

class CurrentComicItem extends StatelessWidget {
  ComicResponse comicResponse ;
  CurrentComicItem(this.comicResponse);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomText(
                text: '${comicResponse.title}',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: 'Day : Month : Year',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                text:
                '${comicResponse.day} : ${comicResponse.month} : ${comicResponse.year}',
                fontSize: 12,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                  text: '${comicResponse.transcript}',
                  fontSize: 10),
              Image.network(
                comicResponse.img ?? " ",
                width: MediaQuery.of(context).size.width * 0.7,
               fit: BoxFit.fill,
               height: MediaQuery.of(context).size.width * 0.5,
              ),
              CustomText(
                text: 'number : ${comicResponse.num}',
                fontSize: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
