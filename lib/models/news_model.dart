class NewsModel {
  final String? image;
  final String? title;
  final String? subtitle;
  final String urlArticle;

  NewsModel(
      {required this.image,
      required this.title,
      required this.subtitle,
      required this.urlArticle});
  factory NewsModel.fromJson(json) {
    return NewsModel(
      urlArticle: json["url"],
      image: json['urlToImage'],
      title: json['title'],
      subtitle: json['description'],
    );
  }
}
