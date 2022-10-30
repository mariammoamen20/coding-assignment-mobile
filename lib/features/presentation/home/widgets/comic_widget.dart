import 'package:comics/features/presentation/cubit/cubit.dart';
import 'package:comics/features/presentation/cubit/states.dart';
import 'package:comics/features/presentation/home/widgets/comic_item.dart';
import 'package:comics/features/presentation/home/widgets/current_comic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/api_manger.dart';
import '../../../data/model/comic_response.dart';

class ComicWidget extends StatelessWidget {
  ComicResponse comicResponse = ComicResponse();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComicCubit()..getComicsData(),
      child: BlocBuilder<ComicCubit, ComicsState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder<ComicResponse>(
                future: ComicCubit.get(context).getCurrentComics(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  var data = snapshot.data;
                  return CurrentComicItem(data!);
                },
              ),
              ComicCubit.get(context).finalComicResponse.num == null
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : ComicItem(ComicCubit.get(context).finalComicResponse),
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
                          ComicCubit.get(context).decrement();
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
                          ComicCubit.get(context).increment();
                                      },
                        child: const Text(
                          'Next',
                        )),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}