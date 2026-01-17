import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

/// Categories of news available in InShorts.
enum NewsType {
  /// Fetch all news from various categories.
  allNews,

  /// Fetch currently trending news.
  trending,

  /// Fetch top stories of the moment.
  topStories,

  /// National news.
  national,

  /// Business and financial news.
  business,

  /// Political news.
  politics,

  /// Sports updates.
  sports,

  /// Technology related news.
  technology,

  /// Startup growth and stories.
  startups,

  /// Entertainment and Bollywood/Hollywood news.
  entertainment,

  /// Quirky and unconventional news.
  hatke,

  /// Educational updates.
  education,

  /// International news.
  world,

  /// Automotive industry news.
  automobile,

  /// Scientific discoveries and updates.
  science,

  /// Travel related news and tips.
  travel,

  /// Various other news.
  miscellaneous,

  /// Fashion and lifestyle news.
  fashion
}

/// Supported languages for news fetching.
enum Language {
  /// English language.
  en,

  /// Hindi language.
  hi
}

/// Main class to interact with InShorts API.
class InShorts {
  /// Returns the internal string representation for a [NewsType].
  static String getNewsType(NewsType newsType) => switch (newsType) {
        NewsType.allNews => 'all_news',
        NewsType.trending => 'trending',
        NewsType.topStories => 'top_stories',
        NewsType.national => 'national',
        NewsType.business => 'business',
        NewsType.politics => 'politics',
        NewsType.sports => 'sports',
        NewsType.technology => 'technology',
        NewsType.startups => 'startups',
        NewsType.entertainment => 'entertainment',
        NewsType.hatke => 'hatke',
        NewsType.education => 'education',
        NewsType.world => 'world',
        NewsType.automobile => 'automobile',
        NewsType.science => 'science',
        NewsType.travel => 'travel',
        NewsType.miscellaneous => 'miscellaneous',
        NewsType.fashion => 'fashion',
      };

  /// Returns a human-readable title for a [NewsType].
  static String getNewsTitle(NewsType newsType) => switch (newsType) {
        NewsType.allNews => 'All News',
        NewsType.trending => 'Trending',
        NewsType.topStories => 'Top Stories',
        NewsType.national => 'National',
        NewsType.business => 'Business',
        NewsType.politics => 'Politics',
        NewsType.sports => 'Sports',
        NewsType.technology => 'Technology',
        NewsType.startups => 'Startups',
        NewsType.entertainment => 'Entertainment',
        NewsType.hatke => 'Hatke',
        NewsType.education => 'Education',
        NewsType.world => 'World',
        NewsType.automobile => 'Automobile',
        NewsType.science => 'Science',
        NewsType.travel => 'Travel',
        NewsType.miscellaneous => 'Miscellaneous',
        NewsType.fashion => 'Fashion',
      };

  /// Returns the internal string representation for a [Language].
  static String getLanguage(Language language) => switch (language) {
        Language.en => 'en',
        Language.hi => 'hi',
      };

  /// Constructs the API endpoint URL for the given parameters.
  static String getNewsEndPoint({required NewsType newsType, Language language = Language.en, int limit = 10}) {
    if (newsType == NewsType.allNews || newsType == NewsType.trending || newsType == NewsType.topStories) {
      return 'https://inshorts.com/api/${getLanguage(language)}/news?category=${getNewsType(newsType)}&max_limit=$limit&include_card_data=true';
    }
    return 'https://inshorts.com/api/${getLanguage(language)}/search/trending_topics/${getNewsType(newsType)}&max_limit=$limit&type=NEWS_CATEGORY';
  }

  /// Fetches news from InShorts based on the provided [newsType] and [language].
  ///
  /// Optional [limit] specifies number of items to fetch.
  /// Optional [client] can be provided for testing via mock client.
  static Future<Data> getNews({required NewsType newsType, Language language = Language.en, int limit = 10, http.Client? client}) async {
    try {
      final http.Response response =
          await (client ?? http.Client()).get(Uri.parse(getNewsEndPoint(newsType: newsType, language: language, limit: limit)));
      GlobalResponse resp = GlobalResponse.fromJson(jsonDecode(response.body));
      if (resp.error ?? true) {
        return Data(newsList: [], message: resp.message ?? 'Something happened');
      } else {
        return Data(newsList: resp.data?.newsList ?? [], message: 'Success');
      }
    } catch (e) {
      return Data(newsList: [], message: e.toString());
    }
  }
}
