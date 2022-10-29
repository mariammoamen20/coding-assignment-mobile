import 'package:comics/data/comic_response.dart';
import 'package:comics/presentation/home/widgets/custome_text.dart';
import 'package:flutter/material.dart';

class ComicItem extends StatelessWidget {
  ComicResponse comicResponse = ComicResponse();

  ComicItem(this.comicResponse);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomText(
                        text: '${comicResponse.title}',
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: 'Day : Month : Year',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text:
                            '${comicResponse.day} : ${comicResponse.month} : ${comicResponse.year}',
                        fontSize: 14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomText(
                          text: '${comicResponse.transcript}', fontSize: 12),
                      Image.network(
                        comicResponse.img ?? " ",
                        width: MediaQuery.of(context).size.width * 0.96,
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            width: 5,
          );
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
