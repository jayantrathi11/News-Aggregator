class ArticleModel {
  String title, description, imageURL, url;
  DateTime publishedAt;
  ArticleModel(
      {required this.url,
      required this.description,
      required this.title,
      required this.imageURL,
      required this.publishedAt});
}
