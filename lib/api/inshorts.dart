import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

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

  static String getLanguage(Language language) => switch (language) {
        Language.en => 'en',
        Language.hi => 'hi',
      };

  static String getNewsEndPoint({required NewsType newsType, Language language = Language.en, int limit = 10}) {
    if (newsType == NewsType.allNews || newsType == NewsType.trending || newsType == NewsType.topStories) {
      return 'https://inshorts.com/api/${getLanguage(language)}/news?category=${getNewsType(newsType)}&max_limit=$limit&include_card_data=true';
    }
    return 'https://inshorts.com/api/${getLanguage(language)}/search/trending_topics/${getNewsType(newsType)}&max_limit=$limit&type=NEWS_CATEGORY';
  }

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
