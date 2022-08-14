import 'package:news_aapp/modules/science.dart';

abstract class NewsStates {}
class InitialState extends NewsStates{}
class ChangeState extends NewsStates{}
class BusinessLoading extends NewsStates{}
class BusinessSuccess extends NewsStates{}
class BusinessError extends NewsStates{
  final String error;//??
  BusinessError(this.error);
}
class SportsLoading extends NewsStates{}
class SportsSuccess extends NewsStates{}
class SportsError extends NewsStates{
  final String error;//??
  SportsError(this.error);//R
}
class ScienceLoading extends NewsStates{}
class ScienceSuccess extends NewsStates{}
class ScienceError extends NewsStates{
  final String error;//??
  ScienceError(this.error);
}
// class SettingLoading extends NewsStates{}
// class SettingSuccess extends NewsStates{}
// class SettingError extends NewsStates{
//   final String error;//??
//   SettingError(this.error);
// }
class SearchLoading extends NewsStates{}
class SearchSuccess extends NewsStates{}
class SearchError extends NewsStates{
  final String error;//??
  SearchError(this.error);
}
