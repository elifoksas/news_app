import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;
class News {


  static Future<List<Articles>?> getNews() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7457ce54364a42eb9e0ecfdaf43c375c"));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      ArticleModel model = ArticleModel.fromJson(jsonData);
      if (model.status == "ok") {
        return model.articles;
      }
    }
  }


}