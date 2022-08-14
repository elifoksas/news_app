import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;
class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async{

    final response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7457ce54364a42eb9e0ecfdaf43c375c"));
    var jsonData = jsonDecode(response.body);

    if(jsonData['status']== "ok"){
      jsonData["articles"].forEach((element){

        if(element["urlToImage"]!= null && element['description']!=null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element["author"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
          );
          news.add(articleModel);
        }
      });


    }

  }

}