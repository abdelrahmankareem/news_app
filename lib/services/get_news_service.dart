import 'package:news/helper/api.dart';
import 'package:news/models/news_model.dart';

class GetnewsService {
  String baseurl = 'http://newsapi.org';
  String apiKey = 'a5aae795bd3a4115abb73da0de5ba59b';
  Future<List<NewsModel>> getTopHeadlines({required String category}) async {
    Map<String, dynamic> jsonData = await Api().get(
        url:
            "$baseurl/v2/top-headlines?country=us&apiKey=$apiKey&category=$category");

    List<dynamic> articles = jsonData['articles'];
    List<NewsModel> articlesList = [];
    for (var article in articles) {
      NewsModel newsModel = NewsModel.fromJson(article);
      articlesList.add(newsModel);
    }
    return articlesList;
  }
}
