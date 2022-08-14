import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_aapp/mode/states.dart';
import 'package:news_aapp/shared/local/cachehelper.dart';

class ModeCubit extends Cubit<ModeStates> {
  ModeCubit() :super(InitialModeState());

  static ModeCubit get(context) {
    return BlocProvider.of(context);
  }
  bool light=true;
  void changeMode({
  bool? fromShared
}){
    if(fromShared==null){

      light = !light;
      CacheHelper.put(key: 'light', value: light);
      emit(ChangeModeState());
    }
    else {
      fromShared=light;
    }
  }
}