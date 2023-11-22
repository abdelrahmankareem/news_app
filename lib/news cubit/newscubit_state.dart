part of 'newscubit_cubit.dart';

abstract class NewsState {}

final class NewsInitial extends NewsState {}

final class Newsloading extends NewsState {}

final class NewsSucces extends NewsState {
  List<NewsModel> newsmodel;
  NewsSucces(this.newsmodel);
}

final class NewsFailure extends NewsState {
  final String errmessage;

  NewsFailure({required this.errmessage});
}
