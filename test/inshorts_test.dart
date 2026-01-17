import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inshorts_flutter/inshorts_flutter.dart';

void main() {
  group('InShorts Utility Methods', () {
    test('getNewsType returns correct string for each NewsType', () {
      expect(InShorts.getNewsType(NewsType.allNews), 'all_news');
      expect(InShorts.getNewsType(NewsType.trending), 'trending');
      expect(InShorts.getNewsType(NewsType.topStories), 'top_stories');
      expect(InShorts.getNewsType(NewsType.national), 'national');
      expect(InShorts.getNewsType(NewsType.business), 'business');
      expect(InShorts.getNewsType(NewsType.politics), 'politics');
      expect(InShorts.getNewsType(NewsType.sports), 'sports');
      expect(InShorts.getNewsType(NewsType.technology), 'technology');
      expect(InShorts.getNewsType(NewsType.startups), 'startups');
      expect(InShorts.getNewsType(NewsType.entertainment), 'entertainment');
      expect(InShorts.getNewsType(NewsType.hatke), 'hatke');
      expect(InShorts.getNewsType(NewsType.education), 'education');
      expect(InShorts.getNewsType(NewsType.world), 'world');
      expect(InShorts.getNewsType(NewsType.automobile), 'automobile');
      expect(InShorts.getNewsType(NewsType.science), 'science');
      expect(InShorts.getNewsType(NewsType.travel), 'travel');
      expect(InShorts.getNewsType(NewsType.miscellaneous), 'miscellaneous');
      expect(InShorts.getNewsType(NewsType.fashion), 'fashion');
    });

    test('getNewsTitle returns correct title for each NewsType', () {
      expect(InShorts.getNewsTitle(NewsType.allNews), 'All News');
      expect(InShorts.getNewsTitle(NewsType.trending), 'Trending');
      expect(InShorts.getNewsTitle(NewsType.topStories), 'Top Stories');
      expect(InShorts.getNewsTitle(NewsType.national), 'National');
      expect(InShorts.getNewsTitle(NewsType.business), 'Business');
      expect(InShorts.getNewsTitle(NewsType.politics), 'Politics');
      expect(InShorts.getNewsTitle(NewsType.sports), 'Sports');
      expect(InShorts.getNewsTitle(NewsType.technology), 'Technology');
      expect(InShorts.getNewsTitle(NewsType.startups), 'Startups');
      expect(InShorts.getNewsTitle(NewsType.entertainment), 'Entertainment');
      expect(InShorts.getNewsTitle(NewsType.hatke), 'Hatke');
      expect(InShorts.getNewsTitle(NewsType.education), 'Education');
      expect(InShorts.getNewsTitle(NewsType.world), 'World');
      expect(InShorts.getNewsTitle(NewsType.automobile), 'Automobile');
      expect(InShorts.getNewsTitle(NewsType.science), 'Science');
      expect(InShorts.getNewsTitle(NewsType.travel), 'Travel');
      expect(InShorts.getNewsTitle(NewsType.miscellaneous), 'Miscellaneous');
      expect(InShorts.getNewsTitle(NewsType.fashion), 'Fashion');
    });

    test('getLanguage returns correct language code', () {
      expect(InShorts.getLanguage(Language.en), 'en');
      expect(InShorts.getLanguage(Language.hi), 'hi');
    });
  });

  group('InShorts Endpoint Method', () {
    test('getNewsEndPoint returns correct URL for default news types', () {
      expect(
        InShorts.getNewsEndPoint(newsType: NewsType.allNews),
        'https://inshorts.com/api/en/news?category=all_news&max_limit=10&include_card_data=true',
      );
      expect(
        InShorts.getNewsEndPoint(newsType: NewsType.trending, language: Language.hi, limit: 20),
        'https://inshorts.com/api/hi/news?category=trending&max_limit=20&include_card_data=true',
      );
    });

    test('getNewsEndPoint returns correct URL for other news types (search endpoint)', () {
      expect(
        InShorts.getNewsEndPoint(newsType: NewsType.technology),
        'https://inshorts.com/api/en/search/trending_topics/technology&max_limit=10&type=NEWS_CATEGORY',
      );
      expect(
        InShorts.getNewsEndPoint(newsType: NewsType.business, language: Language.hi),
        'https://inshorts.com/api/hi/search/trending_topics/business&max_limit=10&type=NEWS_CATEGORY',
      );
    });
  });

  group('InShorts Network Method', () {
    test('getNews returns Data on success', () async {
      final client = MockClient((request) async {
        return http.Response(
            jsonEncode({
              'error': false,
              'message': 'Success',
              'data': {
                'news_list': [
                  {
                    'hash_id': '123',
                    'news_obj': {
                      'title': 'Test Title',
                      'category_names': <String>[],
                      'relevancy_tags': <String>[],
                      'targeted_city': <String>[],
                    }
                  }
                ]
              }
            }),
            200);
      });

      final result = await InShorts.getNews(newsType: NewsType.allNews, client: client);
      expect(result.newsList?.length, 1);
      expect(result.newsList?[0].newsObj?.title, 'Test Title');
    });

    test('getNews returns empty list on error', () async {
      final client = MockClient((request) async {
        return http.Response(jsonEncode({'error': true, 'message': 'Failed'}), 200);
      });

      final result = await InShorts.getNews(newsType: NewsType.allNews, client: client);
      expect(result.newsList, isEmpty);
      expect(result.message, 'Failed');
    });
  });

  group('InShorts Integration (Real Data Schema)', () {
    test('getNews parses real API response schema correctly', () async {
      // This JSON was fetched via curl from the real InShorts API
      final realJsonResponse = {
        "data": {
          "news_list": [
            {
              "rank": 0,
              "hash_id": "5kjhliep-1",
              "type": "NEWS",
              "news_obj": {
                "author_name": "Mansi Agarwal",
                "content": "OpenAI will start testing ads in ChatGPT...",
                "source_name": "Reuters",
                "title": "OpenAI to start testing ads in ChatGPT ",
                "category_names": ["startup", "technology"],
                "relevancy_tags": ["startup", "technology"],
                "targeted_city": [""],
              }
            }
          ]
        },
        "error": false
      };

      final client = MockClient((request) async {
        return http.Response(jsonEncode(realJsonResponse), 200);
      });

      final result = await InShorts.getNews(newsType: NewsType.technology, client: client);

      expect(result, isA<Data>());
      expect(result.newsList, isA<List<News>>());
      expect(result.newsList, isNotEmpty);

      final firstNews = result.newsList![0];
      expect(firstNews.hashId, isA<String>());
      expect(firstNews.rank, isA<int>());
      expect(firstNews.type, isA<String>());

      final newsObj = firstNews.newsObj;
      expect(newsObj, isA<NewsObj>());
      expect(newsObj?.title, isA<String>());
      expect(newsObj?.authorName, isA<String>());
      expect(newsObj?.content, isA<String>());
      expect(newsObj?.sourceName, isA<String>());
      expect(newsObj?.categoryNames, isA<List<String>>());
      expect(newsObj?.relevancyTags, isA<List<String>>());
      expect(newsObj?.targetedCity, isA<List<String>>());
    });
  });
}
