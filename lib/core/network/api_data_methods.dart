class ApiDataMethods {
 static Map<String, dynamic> getEveryThingBody(
      {required int page,
      int? limit,
      String? sources,
      String? language,
      String? searchQuery}) {
    return {
      "page": page,
      "limit": limit ?? 10,
      "sources": sources ?? '',
      "language": language ?? '',
      "q": searchQuery
    };
  }

  static Map<String, dynamic> getTopHeadings(
      {required int page,
      int? limit,
      String? sources,
      String? language,
      String? country,
      String? category}) {
    return {
      "page": page,
      "limit": limit ?? 10,
      "sources": sources ?? '',
      "language": language ?? '',
      "country": country,
      "category": category
    };
  }
}
