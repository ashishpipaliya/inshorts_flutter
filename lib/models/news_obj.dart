/// Detailed news content and metadata.
class NewsObj {
  /// Previous hash ID associated with the news.
  String? oldHashId;

  /// Current hash ID unique to this news.
  String? hashId;

  /// Name of the author.
  String? authorName;

  /// The actual news content/summary.
  String? content;

  /// Original source URL of the news.
  String? sourceUrl;

  /// Name of the news source (e.g., Times of India).
  String? sourceName;

  /// Headline or title of the news.
  String? title;

  /// Marks if the news is highlighted as important.
  bool? important;

  /// Primary image URL for the news card.
  String? imageUrl;

  /// Shortened version of the source URL.
  String? shortenedUrl;

  /// Creation timestamp.
  int? createdAt;

  /// Internal score for sorting or relevancy.
  int? score;

  /// Categories this news belongs to.
  List<String>? categoryNames;

  /// Tags for relevancy and targeting.
  List<String>? relevancyTags;

  /// Platform tenant information.
  String? tenant;

  /// FB Object identifier.
  String? fbObjectId;

  /// Number of likes on Facebook.
  int? fbLikeCount;

  /// Country code for targeting.
  String? countryCode;

  /// Targeted cities for the news.
  List<String>? targetedCity;

  /// Headline shown at the bottom of the news card.
  String? bottomHeadline;

  /// Text shown at the bottom of the news card.
  String? bottomText;

  /// Indicates if darker fonts should be used.
  bool? darkerFonts;

  /// Link for the bottom panel.
  String? bottomPanelLink;

  /// Type of bottom panel.
  String? bottomType;

  /// Version of the news content.
  int? version;

  /// Flag to hide ads for this news item.
  bool? dontShowAd;

  /// Poll tenant information.
  String? pollTenant;

  /// Indicates if video opinion is enabled.
  bool? videoOpinionEnabled;

  /// Language of the news content.
  String? language;

  /// Flag to show InShorts branding.
  bool? showInshortsBrandName;

  /// Flag indicating if the image is for representation.
  bool? imageForRepresentation;

  /// Creates a [NewsObj] with all available parameters.
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

  /// Factory for creating [NewsObj] from a JSON map.
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

  /// Converts [NewsObj] to a JSON map.
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
