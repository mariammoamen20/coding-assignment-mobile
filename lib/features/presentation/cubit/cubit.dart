import 'package:comics/features/data/datasource/end_points.dart';
import 'package:comics/features/presentation/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComicCubit extends Cubit<ComicsState>{
  ComicCubit():super(ComicInitialState());

  //int item = 614;
  var id = EndPoint.item;

  void increment(){
   id++;
   print('${id}');
   emit(ComicIncrementState());
  }
  void decrement(){
    id--;
    print('${id}');
    emit(ComicDecrementState());
  }

}