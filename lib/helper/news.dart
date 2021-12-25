import 'dart:convert';

import 'package:news_aggregator/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    Uri url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=6dce20d9486f41ee9cb0e7e502e840fb');
    int i = 0;
    http.Response response = await http.get(url);

    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            ArticleModel articleModel = ArticleModel(
                url: element['url'],
                description: element['description'],
                title: element['title'],
                imageURL: element['urlToImage'],
                publishedAt: element['publishedAt']);
            news.add(articleModel);
            print(i++);
          }
        },
      );
    }
  }
}
