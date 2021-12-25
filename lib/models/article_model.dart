class ArticleModel {
  String title, description, imageURL, pageUrl;
  String publishedAt;
  ArticleModel(
      {required this.pageUrl,
      required this.description,
      required this.title,
      required this.imageURL,
      required this.publishedAt});
}
