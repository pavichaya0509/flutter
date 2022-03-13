import 'dart:convert';

import 'package:me_money/models/article_model.dart';
import 'package:http/http.dart' as http;
// import 'package:me_money/view/article_view.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    var url = Uri.https("newsapi.org", "/v2/everything", {"q": "bitcoin", "apiKey": "5ce48389024c4df99f24a72956c18534"});

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == "ok") {
      jsonData['articles'].forEach((element) {
        if (element["urlToImage"] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              contant: element['context']);
          news.add(articleModel);
        }
      });
    }
  }
}
