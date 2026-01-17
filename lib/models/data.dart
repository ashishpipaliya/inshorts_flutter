import 'news.dart';

class Data {
  List<News>? newsList;
  String? message;

  Data({this.newsList, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['news_list'] != null) {
      newsList = <News>[];
      json['news_list'].forEach((v) {
        newsList!.add(News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (newsList != null) {
      data['news_list'] = newsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
