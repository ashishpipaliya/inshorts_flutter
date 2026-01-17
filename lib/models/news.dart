import 'news_obj.dart';

class News {
  String? hashId;
  int? rank;
  int? version;
  String? type;
  bool? readOverride;
  bool? fixedRank;
  NewsObj? newsObj;

  News({
    this.hashId,
    this.rank,
    this.version,
    this.type,
    this.readOverride,
    this.fixedRank,
    this.newsObj,
  });

  News.fromJson(Map<String, dynamic> json) {
    hashId = json['hash_id'];
    rank = json['rank'];
    version = json['version'];
    type = json['type'];
    readOverride = json['read_override'];
    fixedRank = json['fixed_rank'];
    newsObj = json['news_obj'] != null ? NewsObj.fromJson(json['news_obj']) : null;
  }

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
