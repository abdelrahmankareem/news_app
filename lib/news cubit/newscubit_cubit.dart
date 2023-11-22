import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/news_model.dart';
import 'package:news/services/get_news_service.dart';

part 'newscubit_state.dart';

class NewsCubit extends Cubit<NewsState> {
  GetnewsService getnewsService;

  NewsCubit(
    this.getnewsService,
  ) : super(NewsInitial());
  Future<void> getnews({required String category}) async {
    emit(Newsloading());
    try {
      final newsModel =
          await getnewsService.getTopHeadlines(category: category);
      emit(NewsSucces(newsModel));
    } catch (e) {
      emit(NewsFailure(errmessage: e.toString()));
    }
  }
}
