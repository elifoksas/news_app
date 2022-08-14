import 'package:flutter/material.dart';

import '../helper/news.dart';
import '../models/article_model.dart';
import 'article_view.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({Key? key, this.category}) : super(key: key);

  final String? category;
  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<Articles>? articles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Türkiye", style: TextStyle(color: Colors.redAccent)),
            Text(
              "Haber",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
              opacity: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.save)))
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                ///blogs
                Container(
                  padding: EdgeInsets.only(top: 16),
                  child: FutureBuilder(
                    future: CategoryNewsClass.getNews(widget.category!),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Articles>?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      } else {
                        List<Articles> list = snapshot.data!;
                        return ListView.builder(
                            padding: EdgeInsets.only(top: 16),
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              var currentArticle = list[index];
                              return BlogTile(
                                  url: currentArticle.url!,
                                  imageUrl: currentArticle.urlToImage!,
                                  title: currentArticle.title!,
                                  desc: currentArticle.description!);
                            });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogTile(
      {required this.imageUrl,
      required this.title,
      required this.desc,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 27),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text(desc,
                style: TextStyle(
                  color: Colors.black54,
                )),
          ],
        ),
      ),
    );
  }
}
