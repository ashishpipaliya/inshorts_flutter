import 'news_obj.dart';

/// Represents a news item with metadata and the actual news content object.
class News {
  /// Unique identifier of the news.
  String? hashId;

  /// Ranking of the news item.
  int? rank;

  /// Version of the news entry.
  int? version;

  /// Type of news (e.g., NEWS).
  String? type;

  /// Indicates if read status is overridden.
  bool? readOverride;

  /// Indicates if the rank is fixed.
  bool? fixedRank;

  /// The core news content, including title, description, and images.
  NewsObj? newsObj;

  /// Creates a [News] object.
  News({
    this.hashId,
    this.rank,
    this.version,
    this.type,
    this.readOverride,
    this.fixedRank,
    this.newsObj,
  });

  /// Factory for creating [News] from a JSON map.
  News.fromJson(Map<String, dynamic> json) {
    hashId = json['hash_id'];
    rank = json['rank'];
    version = json['version'];
    type = json['type'];
    readOverride = json['read_override'];
    fixedRank = json['fixed_rank'];
    newsObj = json['news_obj'] != null ? NewsObj.fromJson(json['news_obj']) : null;
  }

  /// Converts [News] to a JSON map.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hash_id'] = hashId;
    data['rank'] = rank;
    data['version'] = version;
    data['type'] = type;
    data['read_override'] = readOverride;
    data['fixed_rank'] = fixedRank;
    if (newsObj != null) {
      data['news_obj'] = newsObj!.toJson();
    }
    return data;
  }
}
