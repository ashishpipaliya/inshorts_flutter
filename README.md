<div align="center">
<img src="https://user-images.githubusercontent.com/32923529/169968243-5a2fa5f1-7cac-44f9-9581-cd3a2065051b.png" width="120"/>
<br>
<br>
<h2>InShorts Flutter API
</h2>
<p>Get access to inshorts app's private API in flutter</p>

![GitHub](https://img.shields.io/github/license/ashishpipaliya/inshorts_flutter?style=for-the-badge)
</div>

<img src="https://user-images.githubusercontent.com/32923529/169963013-296b7d4a-05e1-42a9-869b-1cc8f15d4f10.png" width="33%"><img src="https://user-images.githubusercontent.com/32923529/169963014-d2ae3138-862b-4af0-a888-96c29ee98803.png" width="33%"><img src="https://user-images.githubusercontent.com/32923529/169963016-e72448a8-3f1b-4e8a-b777-f9e6682a0854.png" width="33%">

## 🌈Categories

- All News
- Trending
- Top Stories
- National
- Business
- Politics
- Sports
- Technology
- Startups
- Entertainment
- Hatke
- Education
- World
- Automobile
- Science
- Travel
- Miscellaneous
- Fashion

____
## 🔥 Usage

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  ...
  inshorts_flutter: latest_version
```
____
Get news
```dart
import 'package:flutter/material.dart';
import 'package:inshorts_flutter/inshorts_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'InShorts News',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController? _controller;

  List categories = [NewsType.all_news, NewsType.trending, NewsType.top_stories, NewsType.business];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('InShorts News'),
          bottom: TabBar(
              controller: _controller, tabs: categories.map((e) => Tab(text: InShorts.getNewsTitle(e))).toList())),
      body: TabBarView(
        controller: _controller,
        children:
          categories.map((e) => FutureBuilder<Data>(
              future: InShorts.getNews(newsType: e, language: Language.en),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.newsList?.length ?? 0,
                    itemBuilder: (context, index) {
                      News news = snapshot.data!.newsList![index];
                      return ListTile(
                        leading: Image.network(news.newsObj!.imageUrl!, width: 80, fit: BoxFit.fitWidth),
                        title: Text(news.newsObj!.title!),
                        subtitle: Text(
                          news.newsObj!.sourceName!,
                          style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Errr'));
                }
                return const Center(child: CircularProgressIndicator());
              })).toList()
        ,
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}

```
____
`Data` class consists of following,

```dart
class Data{
    List<News>? newsList;
    String? message;
}
```
____
`News` class consists of following,

```dart
class News{
  String? hashId;
  int? rank;
  int? version;
  String? type;
  bool? readOverride;
  bool? fixedRank;
  NewsObj? newsObj;
}
```
____
`NewsObj` class consists of following,

```dart
class NewsObj{
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
 }
```

Make use of `NewsObj` class to access news headline, content, image, source and more.
____
## ✍️ Authors

- [**Ashish Pipaliya**](https://github.com/ashishpipaliya) - _Author_

## 📜 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT) - see the [LICENSE](LICENSE) file for details.

## 🧰 Contribution
Feel free to raise issues and open PR
____