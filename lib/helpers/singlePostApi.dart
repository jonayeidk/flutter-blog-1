import 'dart:convert';
import 'dart:developer';
import 'package:test_project1/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:test_project1/models/singlePostModel.dart';

class SingleNews{
  List<ArticleModel> news = [];
  getNews() async{
    String url = "https://nagorikbarta.com/api/get-news-details/194605";
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Access-Control_Allow_Origin": "*"
      },
    );
    var jsonData = jsonDecode(response.body);
    if(jsonData != null){
      final newsResponse = singlePostModel.fromJson(jsonData);
      return newsResponse;
    } else {
      return null;
    }


  }
}
