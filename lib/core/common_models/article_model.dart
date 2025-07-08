class NewsResponse {
  final String status;
  final int totalResults;
  final List<NewsArticleModel> articles;

  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      status: json['status'] ?? '',
      totalResults: json['totalResults'] ?? 0,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => NewsArticleModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles.map((e) => e.toJson()).toList(),
      };
}

class NewsArticleModel {
  final Source? source;
  final String? author;
  final String ?title;
  final String? description;
  final String ?url;
  final String? urlToImage;
  final String ?publishedAt;
  final String? content;

  NewsArticleModel({
     this.source,
     this.author,
     this.title,
     this.description,
     this.url,
     this.urlToImage,
     this.publishedAt,
     this.content,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      source: Source.fromJson(json['source']),
      author: json['author'],
      title: json['title'] ?? '',
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'source':
      source!=null? source!.toJson():'',
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}

class Source {
  final String? id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
