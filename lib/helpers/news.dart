import 'dart:convert';
import 'package:test_project1/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:test_project1/models/news_model.dart';

class News{

  List<ArticleModel> news = [];
  String url = "https://newsapi.org/v2/everything?q=tesla&from=2021-02-21&sortBy=publishedAt&apiKey=12bbfa5affab4f88bcc0bc4757ea7ecb";
  Future<String> getNews() async{
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Access-Control_Allow_Origin": "*"
      },
    );

    // var response = await http
    //     .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=='ok'){

      // final newsResponse = NewsModel.fromJson(jsonData);
      // return newsResponse;

      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){

          // print(element);

          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content']
          );
          news.add(articleModel);
        }
      });
    }


  }
}

class CategoryNews{

  List<ArticleModel> news = [];
  Future<String> getCategoryNews(String category) async{
   String url = "https://newsapi.org/v2/top-headlines?category=$category&sortBy=publishedAt&apiKey=12bbfa5affab4f88bcc0bc4757ea7ecb";

   final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Access-Control_Allow_Origin": "*"
      },
    );

    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=='ok'){

      jsonData["articles"].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){

          print(element);

          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']
          );
          news.add(articleModel);
        }
      });
    }


  }
}


class DetailNews{
  List<ArticleModel> news = [];
  Future<String> getDetailNews(String title) async{
    String url = "https://newsapi.org/v2/top-headlines?category=$title&sortBy=publishedAt&apiKey=12bbfa5affab4f88bcc0bc4757ea7ecb";

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Access-Control_Allow_Origin": "*"
      },
    );

    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=='ok'){

      // jsonData["articles"].forEach((element){
      //   if(element['urlToImage'] != null && element['description'] != null){
      //
      //     print(element);
      //
      //     ArticleModel articleModel = ArticleModel(
      //         author: element['author'],
      //         title: element['title'],
      //         description: element['description'],
      //         url: element['url'],
      //         urlToImage: element['urlToImage'],
      //         content: element['content']
      //     );
      //     news.add(articleModel);
      //   }
      // });
      //
    }


  }
}