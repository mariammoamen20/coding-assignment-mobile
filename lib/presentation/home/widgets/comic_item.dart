import 'package:comics/data/api_manger.dart';
import 'package:comics/data/comic_response.dart';
import 'package:comics/presentation/home/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ComicItem extends StatefulWidget {
  ComicResponse comicResponse = ComicResponse();

  ComicItem(this.comicResponse);

  @override
  State<ComicItem> createState() => _ComicItemState();
}

class _ComicItemState extends State<ComicItem> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index){
               // ApiManger.item = index;
                setState(() {
                  ApiManger.item++;
                   ApiManger.getComicsData();
                  print( ApiManger.item);
                });
              },
              controller: controller,
              itemBuilder: (_, index) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Card(
                        margin: const EdgeInsets.all(5),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CustomText(
                                text: '${widget.comicResponse.title}',
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
                                    '${widget.comicResponse.day} : ${widget.comicResponse.month} : ${widget.comicResponse.year}',
                                fontSize: 14,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                  text: '${widget.comicResponse.transcript}',
                                  fontSize: 12),
                              Image.network(
                                widget.comicResponse.img ?? " ",
                                width: MediaQuery.of(context).size.width * 0.96,
                                fit: BoxFit.fill,
                                height: MediaQuery.of(context).size.width * 0.8,
                              ),
                              CustomText(
                                text: 'number : ${widget.comicResponse.num}',
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
          SmoothPageIndicator(
            controller: controller,
            count: 5,
            effect: const JumpingDotEffect(),
          )
        ],
      ),
    );

    /*Expanded(
      child: ListView.separated(
        itemBuilder: (_, index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Card(
                  margin: const EdgeInsets.all(5),
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
                        CustomText(text: 'number : ${comicResponse.num}',fontSize: 10,)
                      ],
                    ),
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
    );*/
  }
}
