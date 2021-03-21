import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_project1/home/article.dart';
import 'package:test_project1/models/article_model.dart';
import 'package:test_project1/helpers/news.dart';

class Category extends StatefulWidget {
  final String category;
  Category({this.category});
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    this.getCategoryNews();
  }

  getCategoryNews () async{
    CategoryNews newsClass = CategoryNews();
    print(widget.category);
    await newsClass.getCategoryNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter"),
            Text(" Blog",style: TextStyle(
                color: Colors.blue
            ),)
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body:_loading ?
      Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      )
          : SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          child: Column(
            children: <Widget>[
              // blogs
              Container(
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context,index){
                      return BLogTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          desc: articles[index].description,
                          content: articles[index].content,
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class BLogTile extends StatelessWidget {
  final String imageUrl, title, desc,content;

  BLogTile({@required this.imageUrl, @required this.title, @required this.desc,@required this.content});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Article(
                title: title.toLowerCase(),
                imageToUrl:imageUrl,
                description: desc,
                content:content
            )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(imageUrl: imageUrl)
            ),
            SizedBox(height: 8,),
            Text(title, style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(height: 8,),
            Text(desc,style: TextStyle(
                color: Colors.black54
            ),)
          ],
        ),
      ),
    );
  }
}