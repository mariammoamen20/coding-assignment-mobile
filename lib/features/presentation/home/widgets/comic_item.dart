import 'package:comics/core/utilites/custome_text.dart';
import 'package:comics/features/presentation/cubit/cubit.dart';
import 'package:comics/features/presentation/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/comic_response.dart';

class ComicItem extends StatefulWidget {
  ComicResponse comicResponse = ComicResponse();

  ComicItem(this.comicResponse);

  @override
  State<ComicItem> createState() => _ComicItemState();
}

class _ComicItemState extends State<ComicItem> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return ComicCubit();
        },
        child: Expanded(
          child: Column(
            children: [
              BlocBuilder<ComicCubit, ComicsState>(
                builder: (context, state) {
                  return Expanded(
                    child: PageView.builder(
                      onPageChanged: (page) {
                      // BlocProvider.of<ComicCubit>(context).id == page;
                      },
                      controller: _pageController,
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
                                          text:
                                              '${widget.comicResponse.transcript}',
                                          fontSize: 12),
                                      Image.network(
                                        widget.comicResponse.img ?? " ",
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.96,
                                        fit: BoxFit.fill,
                                        height:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                      ),
                                      CustomText(
                                        text:
                                            'number : ${widget.comicResponse.num}',
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
                  );
                },
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.blue[200],
                        onPressed: () {
                          BlocProvider.of<ComicCubit>(context).decrement();
                          /* setState(() {
                    EndPoint.item--;
                    ApiManger.getComicsData();
                  });*/
                        },
                        child: const Text(
                          'Previous',
                        )),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.blue[200],
                        onPressed: () {
                          BlocProvider.of<ComicCubit>(context).increment();
                          /*  setState(() {
                    EndPoint.item++;
                    ApiManger.getComicsData();
                    print(EndPoint.item);
                  });*/
                        },
                        child: const Text(
                          'Next',
                        )),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
