import 'news.dart';

/// Contains the list of news items and status information.
class Data {
  /// List of news articles fetched from the API.
  List<News>? newsList;

  /// Additional status message.
  String? message;

  /// Creates a [Data] object.
  Data({this.newsList, this.message});

  /// Factory for creating [Data] from a JSON map.
  Data.fromJson(Map<String, dynamic> json) {
    if (json['news_list'] != null) {
      newsList = <News>[];
      json['news_list'].forEach((v) {
        newsList!.add(News.fromJson(v));
      });
    }
  }

  /// Converts [Data] to a JSON map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (newsList != null) {
      data['news_list'] = newsList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
