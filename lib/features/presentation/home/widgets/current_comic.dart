import 'package:flutter/material.dart';

import '../../../../core/utilites/widgets/custome_text.dart';
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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomText(
                text: '${comicResponse.title}',
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 5,
              ),
              CustomText(
                text: 'Day : Month : Year',
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 3,
              ),
              CustomText(
                text:
                '${comicResponse.day} : ${comicResponse.month} : ${comicResponse.year}',
                fontSize: 12,
              ),
              const SizedBox(
                height: 3,
              ),
              CustomText(
                  text: '${comicResponse.transcript}',
                  fontSize: 10),
              Image.network(
                comicResponse.img ?? " ",
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.width * 0.3,
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