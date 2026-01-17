<div align="center">
<img src="https://user-images.githubusercontent.com/32923529/169968243-5a2fa5f1-7cac-44f9-9581-cd3a2065051b.png" width="120"/>
<br>
<br>
<h2>InShorts Flutter API
</h2>
<p>Get access to inshorts app's private API in flutter</p>

![GitHub](https://img.shields.io/github/license/ashishpipaliya/inshorts_flutter?style=for-the-badge)
</div>

<img src="https://github.com/user-attachments/assets/89c6565e-49dd-43fb-b99e-9a687d5f812c" width="33%"><img src="https://github.com/user-attachments/assets/7d14af42-8546-4c32-b174-74ea5ca22a18" width="33%"><img src="https://github.com/user-attachments/assets/3bc32ea6-c5a1-4340-b92d-317d8154a238" width="33%">

## 🌈 Categories

- All News, Trending, Top Stories
- National, Business, Politics, Sports, Technology
- Startups, Entertainment, Hatke, Education, World
- Automobile, Science, Travel, Miscellaneous, Fashion

____
## 🔥 Usage

Add the dependency in `pubspec.yaml`:

```yaml
dependencies:
  inshorts_flutter: ^0.0.3
```

### Basic Fetching

```dart
import 'package:inshorts_flutter/inshorts_flutter.dart';

// Fetch news for a specific category
Data newsData = await InShorts.getNews(
  newsType: NewsType.allNews, 
  language: Language.en, // Optional: Language.hi for Hindi
  limit: 10              // Optional: default is 10
);

// Access news list
if (newsData.newsList != null) {
  for (var news in newsData.newsList!) {
    print(news.newsObj?.title);
    print(news.newsObj?.content);
  }
}
```

### Displaying in a Widget

```dart
FutureBuilder<Data>(
  future: InShorts.getNews(newsType: NewsType.trending),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        itemCount: snapshot.data?.newsList?.length ?? 0,
        itemBuilder: (context, index) {
          final news = snapshot.data!.newsList![index];
          return ListTile(
            title: Text(news.newsObj?.title ?? 'No Title'),
            subtitle: Text(news.newsObj?.sourceName ?? 'Unknown Source'),
          );
        },
      );
    }
    return CircularProgressIndicator();
  },
)
```

____
## 🏗 Data Models

### Data
- `List<News>? newsList`
- `String? message`

### News
- `String? hashId`, `int? rank`, `NewsObj? newsObj`, etc.

### NewsObj
- `String? title`, `String? content`, `String? authorName`
- `String? imageUrl`, `String? sourceName`, `String? sourceUrl`
- `int? createdAt`, `List<String>? categoryNames`, and more.

____
## ✍️ Authors

- [**Ashish Pipaliya**](https://github.com/ashishpipaliya) - _Author_

## 📜 License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## 🧰 Contribution
Feel free to raise issues and open PRs.
____