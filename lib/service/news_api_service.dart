import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_api_flutter_test/model/news_model.dart';

class NewsApiService {

 Future<List<Articles>> fetchNewsData() async {
   List<Articles> newsList = [];
    try{

      var link = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=f3aeeb3482c84b2bb4d84c4ccc19f343&pageSize=10";
      var response = await http.get(Uri.parse(link));
      print("responce is ${response.body}");
      var data = jsonDecode(response.body);
      Articles articles;
      for (var i in data['articles']) {
        articles =Articles.fromJson(i);
        newsList.add(articles);

      }

    } catch(e){
      print("okay");
    }
    return newsList;
  }
}
