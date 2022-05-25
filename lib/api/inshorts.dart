import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'global_response.dart';

enum NewsType {
  allNews,
  trending,
  topStories,
  national,
  business,
  politics,
  sports,
  technology,
  startups,
  entertainment,
  hatke,
  education,
  world,
  automobile,
  science,
  travel,
  miscellaneous,
  fashion
}
enum Language { en, hi }

class InShorts {
  static String getNewsType(NewsType newsType) {
    switch (newsType) {
      case NewsType.allNews:
        return 'all_news';
      case NewsType.trending:
        return 'trending';
      case NewsType.topStories:
        return 'top_stories';
      case NewsType.national:
        return 'national';
      case NewsType.business:
        return 'business';
      case NewsType.politics:
        return 'politics';
      case NewsType.sports:
        return 'sports';
      case NewsType.technology:
        return 'technology';
      case NewsType.startups:
        return 'startups';
      case NewsType.entertainment:
        return 'entertainment';
      case NewsType.hatke:
        return 'hatke';
      case NewsType.education:
        return 'education';
      case NewsType.world:
        return 'world';
      case NewsType.automobile:
        return 'automobile';
      case NewsType.science:
        return 'science';
      case NewsType.travel:
        return 'travel';
      case NewsType.miscellaneous:
        return 'miscellaneous';
      case NewsType.fashion:
        return 'fashion';
      default:
        return 'all_news';
    }
  }

  static String getNewsTitle(NewsType newsType) {
    switch (newsType) {
      case NewsType.allNews:
        return 'All News';
      case NewsType.trending:
        return 'Trending';
      case NewsType.topStories:
        return 'Top Stories';
      case NewsType.national:
        return 'National';
      case NewsType.business:
        return 'Business';
      case NewsType.politics:
        return 'Politics';
      case NewsType.sports:
        return 'Sports';
      case NewsType.technology:
        return 'Technology';
      case NewsType.startups:
        return 'Startups';
      case NewsType.entertainment:
        return 'Entertainment';
      case NewsType.hatke:
        return 'Hatke';
      case NewsType.education:
        return 'Education';
      case NewsType.world:
        return 'World';
      case NewsType.automobile:
        return 'Automobile';
      case NewsType.science:
        return 'Science';
      case NewsType.travel:
        return 'Travel';
      case NewsType.miscellaneous:
        return 'Miscellaneous';
      case NewsType.fashion:
        return 'Fashion';
      default:
        return 'All News';
    }
  }

  static String getLanguage(Language language) {
    switch (language) {
      case Language.en:
        return 'en';
      case Language.hi:
        return 'hi';
      default:
        return 'en';
    }
  }

  static String getNewsEndPoint(
      {required NewsType newsType,
      Language language = Language.en,
      int limit = 10}) {
    if (newsType == NewsType.allNews ||
        newsType == NewsType.trending ||
        newsType == NewsType.topStories) {
      return 'https://inshorts.com/api/${getLanguage(language)}/news?category=${getNewsType(newsType)}&max_limit=$limit&include_card_data=true';
    }
    return 'https://inshorts.com/api/${getLanguage(language)}/search/trending_topics/${getNewsType(newsType)}&max_limit=$limit&type=NEWS_CATEGORY';
  }

  static Future<Data> getNews(
      {required NewsType newsType,
      Language language = Language.en,
      int limit = 10}) async {
    final http.Response response = await http.get(Uri.parse(
        getNewsEndPoint(newsType: newsType, language: language, limit: limit)));
    GlobalResponse resp = GlobalResponse.fromJson(jsonDecode(response.body));
    if (resp.error!) {
      return Data(newsList: [], message: resp.message);
    } else {
      return Data(newsList: resp.data!.newsList!, message: 'Success');
    }
  }
}
