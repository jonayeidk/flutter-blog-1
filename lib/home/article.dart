import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/image_render.dart';
import 'package:test_project1/helpers/singlePostApi.dart';
import 'package:test_project1/models/article_model.dart';
import 'package:test_project1/models/singlePostModel.dart';

class Article extends StatefulWidget {

  final String title,imageToUrl,description,content;
  Article({this.title,this.imageToUrl,this.description,this.content});

  @override
  _ArticleState createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  SingleNews singleNews = SingleNews();
  List<ArticleModel> articles = new List<ArticleModel>();
  singlePostModel postModel;
  bool _loading = false;

  initCheck() async {
    setState(() => _loading = true);
    var myData = await singleNews.getNews();
    if(myData!=null) {
      print(myData);
      setState(() {
        postModel = myData;
        _loading = false;
      });
    } else {
      _loading = false;
    }
  }

  @override
  void initState() {
    super.initState();
    this.initCheck();
    // this.getDetailsNews();
  }

  // getDetailsNews () async{
  //   DetailNews newsClass = DetailNews();
  //   print(widget.title);
  //   await newsClass.getDetailNews(widget.title);
  //   articles = newsClass.news;
  //   setState(() {
  //     _loading = false;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News"),
            Text(" Title",style: TextStyle(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 24),
            Text(
              postModel.postTitle,
              textAlign:TextAlign.start,
              style: TextStyle(
                fontSize: 25,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),),
            SizedBox( height: 8,),
            Text(
              postModel.reporterName,
              textAlign:TextAlign.start,
              style: TextStyle(
                  color: Colors.black54
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(postModel.imageLink),
            ),
            SizedBox(height: 8,),
            Html(
              data: postModel.postContent,
              //Optional parameters:
              customImageRenders: {
                networkSourceMatcher(domains: ["flutter.dev"]):
                    (context, attributes, element) {
                  return FlutterLogo(size: 36);
                },
                networkSourceMatcher(domains: ["mydomain.com"]): networkImageRender(
                  headers: {"Custom-Header": "some-value"},
                  altWidget: (alt) => Text(alt),
                  loadingWidget: () => Text("Loading..."),
                ),
                // On relative paths starting with /wiki, prefix with a base url
                    (attr, _) => attr["src"] != null && attr["src"].startsWith("/wiki"):
                networkImageRender(
                    mapUrl: (url) => "https://upload.wikimedia.org" + url),
                // Custom placeholder image for broken links
                networkSourceMatcher(): networkImageRender(altWidget: (_) => FlutterLogo()),
              },
              onLinkTap: (url) {
                print("Opening $url...");
              },
              onImageTap: (src) {
                print(src);
              },
              onImageError: (exception, stackTrace) {
                print(exception);
              },
            ),
          ],
        ),
      ),
    );
  }
}
