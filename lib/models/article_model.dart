class ArticleModel {
  String title, description, imageURL, url;
  String publishedAt;
  ArticleModel(
      {required this.url,
      required this.description,
      required this.title,
      required this.imageURL,
      required this.publishedAt});
}
