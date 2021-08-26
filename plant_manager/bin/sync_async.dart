import 'dart:convert';

import 'package:http/http.dart' as http;

Future main() async {
  final article = await fetch();
  print(article.title);
  print(article.body);
}

Future<dynamic> fetch() async {
  var url = 'http://127.0.0.1:8000/api/articles/3';
  var response = await http.get(Uri.parse(url));
  var json = jsonDecode(response.body);
  var article = Article.fromJson(json);
  return article;
}

class Article {
  final int id;
  final String title;
  final String body;
  final String createdAt;
  final String updatedAt;

  Article({this.id, this.title, this.body, this.createdAt, this.updatedAt});

  factory Article.fromJson(Map json) {
    return Article(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  Map toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

void editData() {
  int id = 3;
  String url = "http://127.0.0.1:8000/api/articles/$id";
  http.put(Uri.parse(url), body: {
    'title': 'A Chatuba de Mesquita come a mina de geral',
    'body': 'Muleque Playboy funkeiro sexo anal'
  }).then((response) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  });
}
