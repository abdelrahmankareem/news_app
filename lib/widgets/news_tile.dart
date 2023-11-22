import 'package:flutter/material.dart';
import 'package:news/models/news_model.dart';
import 'package:news/views/webview.dart';

// cached network image
class NewsTile extends StatelessWidget {
  final NewsModel newsModel;

  const NewsTile({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: newsModel.image != null
                ? GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ArticlesView.id,
                          arguments: newsModel.urlArticle);
                    },
                    child: Image.network(
                      newsModel.image!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ArticlesView.id,
                          arguments: newsModel.urlArticle);
                    },
                    child: Image.asset(
                      "lib/assets/images/nopicture.png",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            newsModel.title ?? "there is no title",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            newsModel.subtitle ?? 'there is no describtion',
            maxLines: 2,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
