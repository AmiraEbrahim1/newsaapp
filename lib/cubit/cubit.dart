import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_aapp/cubit/states.dart';
import 'package:news_aapp/modules/business.dart';
import 'package:news_aapp/modules/science.dart';
import 'package:news_aapp/modules/settings.dart';
import 'package:news_aapp/modules/sports.dart';
import 'package:news_aapp/shared/remote/dio.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(InitialState());
  static NewsCubit get(context){
    return BlocProvider.of(context);
  }
  int current_index = 0;
  void changeNav(index) {
    current_index = index;
    if (index==0)
      getBusiness();

    emit(ChangeState());
  }
  List<BottomNavigationBarItem> items=[
    const BottomNavigationBarItem(
        icon:Icon(Icons.business,),
        label:'Business'),
    const BottomNavigationBarItem(
        icon:Icon(Icons.sports),
        label:'Sports'),
    const BottomNavigationBarItem(
        icon:Icon(Icons.science),
        label:'Science'),
    const BottomNavigationBarItem(
        icon:Icon(Icons.settings),
        label:'Settings'),
  ];
  List<Widget>Screen = [
    Business(),
    Sports(),
    Science(),
    Settings(),
  ];
  List<dynamic> sports= [];
  getSports(){
    emit(SportsLoading());
    DioHelper.getData(
        url:'v2/top-headlines' ,
        query: {
          'country':'us',
          'category':'sports',
          'apiKey':'cb72979f82f040e9a3096e42b525821e'
        }).then((value){

          sports=value.data['articles'];
          print('success');
          print(sports.length);
          emit(SportsSuccess());
        }).catchError((error){
          print(error.toString());
          print('error');
          emit(SportsError(error.toString()));
    });
    }
  List<dynamic> business= [];
  getBusiness(){
    emit(BusinessLoading());
    DioHelper.getData(
        url:'v2/top-headlines' ,
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'cb72979f82f040e9a3096e42b525821e'
        }).then((value){

      business=value.data['articles'];
      print('success');
      print(business.length);
      emit(BusinessSuccess());
    }).catchError((error){
      print(error.toString());
      print('error');
      emit(BusinessError(error.toString()));
    });
  }
  List<dynamic> science= [];
  getScience(){
    emit(BusinessLoading());
    DioHelper.getData(
        url:'v2/top-headlines' ,
        query: {
          'country':'us',
          'category':'science',
          'apiKey':'cb72979f82f040e9a3096e42b525821e'
        }).then((value){

      science=value.data['articles'];
      print('success');
      print(science.length);
      emit(ScienceSuccess());
    }).catchError((error){
      print(error.toString());
      print('error');
      emit(ScienceError(error.toString()));
    });
  }
  List<dynamic> search= [];
  getSearch(String value){
    emit(BusinessLoading());
    DioHelper.getData(
        url:'v2/everything' ,
        query: {
          'q':'$value',
          'apiKey':'cb72979f82f040e9a3096e42b525821e'
        }).then((value){

      search=value.data['articles'];
      print('success');
      print(science.length);
      emit(SearchSuccess());
    }).catchError((error){
      print(error.toString());
      print('error');
      emit(SearchError(error.toString()));
    });
  }


  }
