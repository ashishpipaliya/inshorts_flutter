class NewsObj {
  String? oldHashId;
  String? hashId;
  String? authorName;
  String? content;
  String? sourceUrl;
  String? sourceName;
  String? title;
  bool? important;
  String? imageUrl;
  String? shortenedUrl;
  int? createdAt;
  int? score;
  List<String>? categoryNames;
  List<String>? relevancyTags;
  String? tenant;
  String? fbObjectId;
  int? fbLikeCount;
  String? countryCode;
  List<String>? targetedCity;
  String? bottomHeadline;
  String? bottomText;
  bool? darkerFonts;
  String? bottomPanelLink;
  String? bottomType;
  int? version;
  bool? dontShowAd;
  String? pollTenant;
  bool? videoOpinionEnabled;
  String? language;
  bool? showInshortsBrandName;
  bool? imageForRepresentation;

  NewsObj(
      {this.oldHashId,
      this.hashId,
      this.authorName,
      this.content,
      this.sourceUrl,
      this.sourceName,
      this.title,
      this.important,
      this.imageUrl,
      this.shortenedUrl,
      this.createdAt,
      this.score,
      this.categoryNames,
      this.relevancyTags,
      this.tenant,
      this.fbObjectId,
      this.fbLikeCount,
      this.countryCode,
      this.targetedCity,
      this.bottomHeadline,
      this.bottomText,
      this.darkerFonts,
      this.bottomPanelLink,
      this.bottomType,
      this.version,
      this.dontShowAd,
      this.pollTenant,
      this.videoOpinionEnabled,
      this.language,
      this.showInshortsBrandName,
      this.imageForRepresentation});

  NewsObj.fromJson(Map<String, dynamic> json) {
    oldHashId = json['old_hash_id'];
    hashId = json['hash_id'];
    authorName = json['author_name'];
    content = json['content'];
    sourceUrl = json['source_url'];
    sourceName = json['source_name'];
    title = json['title'];
    important = json['important'];
    imageUrl = json['image_url'];
    shortenedUrl = json['shortened_url'];
    createdAt = json['created_at'];
    score = json['score'];
    categoryNames = json['category_names']?.cast<String>();
    relevancyTags = json['relevancy_tags']?.cast<String>();
    tenant = json['tenant'];
    fbObjectId = json['fb_object_id'];
    fbLikeCount = json['fb_like_count'];
    countryCode = json['country_code'];
    targetedCity = json['targeted_city']?.cast<String>();
    bottomHeadline = json['bottom_headline'];
    bottomText = json['bottom_text'];
    darkerFonts = json['darker_fonts'];
    bottomPanelLink = json['bottom_panel_link'];
    bottomType = json['bottom_type'];
    version = json['version'];
    dontShowAd = json['dont_show_ad'];
    pollTenant = json['poll_tenant'];
    videoOpinionEnabled = json['video_opinion_enabled'];
    language = json['language'];
    showInshortsBrandName = json['show_inshorts_brand_name'];
    imageForRepresentation = json['image_for_representation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['old_hash_id'] = oldHashId;
    data['hash_id'] = hashId;
    data['author_name'] = authorName;
    data['content'] = content;
    data['source_url'] = sourceUrl;
    data['source_name'] = sourceName;
    data['title'] = title;
    data['important'] = important;
    data['image_url'] = imageUrl;
    data['shortened_url'] = shortenedUrl;
    data['created_at'] = createdAt;
    data['score'] = score;
    data['category_names'] = categoryNames;
    data['relevancy_tags'] = relevancyTags;
    data['tenant'] = tenant;
    data['fb_object_id'] = fbObjectId;
    data['fb_like_count'] = fbLikeCount;
    data['country_code'] = countryCode;
    data['targeted_city'] = targetedCity;
    data['bottom_headline'] = bottomHeadline;
    data['bottom_text'] = bottomText;
    data['darker_fonts'] = darkerFonts;
    data['bottom_panel_link'] = bottomPanelLink;
    data['bottom_type'] = bottomType;
    data['version'] = version;
    data['dont_show_ad'] = dontShowAd;
    data['poll_tenant'] = pollTenant;
    data['video_opinion_enabled'] = videoOpinionEnabled;
    data['language'] = language;
    data['show_inshorts_brand_name'] = showInshortsBrandName;
    data['image_for_representation'] = imageForRepresentation;
    return data;
  }
}
