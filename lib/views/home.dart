import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/category_model.dart';

import '../helper/news.dart';
import '../models/article_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("World",style:TextStyle(
              color: Colors.blueGrey
            )),
            Text("News", style: TextStyle(
              color: Colors.black
            ),)
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          //haberler yüklenirken circular progress görseli çıkacak.
          child: CircularProgressIndicator() ,
        ),
      ) : Container(
        child: Column(
          children: <Widget>[


            ///Categories
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return CategoryTile(
                    imageUrl: categories[index].imageUrl,
                    categorieName: categories[index].categoryName,
                  );
                }),
            ),

            ///blogs
            Container(
              child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return BlogTile(
                      imageUrl: articles[index].urlToImage,
                      title: articles[index].title,
                      desc: articles[index].description,
                    );
                  }),
            )
          ],
        ),

        ),
      );

  }
}
class CategoryTile extends StatelessWidget {
  final imageUrl,categorieName;
  CategoryTile({this.imageUrl,this.categorieName});


  //üst kısımdaki kategoriler
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        margin: EdgeInsets.only(right:16),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl,width: 120,height: 60, fit: BoxFit.cover,)
            ),
            Container(
              alignment: Alignment.center,
              width: 120, height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child:
              Text(categorieName, style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500
              ),),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {

  final String imageUrl, title, desc;
  BlogTile({required this.imageUrl,required this.title,required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}
