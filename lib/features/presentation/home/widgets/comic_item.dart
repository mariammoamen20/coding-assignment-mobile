import 'package:comics/features/presentation/cubit/cubit.dart';
import 'package:flutter/material.dart';
import '../../../../core/utilites/widgets/custome_text.dart';
import '../../../data/model/comic_response.dart';

class ComicItem extends StatelessWidget {

  ComicResponse comicResponse = ComicResponse();

  ComicItem(this.comicResponse);

  @override
  Widget build(BuildContext context) {
    var imageHeight =  MediaQuery.of(context).size.width * 0.8;
    var imageWidth =  MediaQuery.of(context).size.width * 0.96;
    return  Expanded(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: ComicCubit.get(context).pageController,
              itemBuilder: (_, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Card(
                        margin: const EdgeInsets.all(5),
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                              CustomText(text: '${comicResponse.transcript}', fontSize: 12),
                              Image.network(
                                comicResponse.img ?? " ",
                                width:imageWidth,
                                fit: BoxFit.fill,
                                height: imageHeight,
                              ),
                              CustomText(
                                text: 'number : ${comicResponse.num}',
                                fontSize: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}