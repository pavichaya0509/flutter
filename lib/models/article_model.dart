class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String contant;
  DateTime publishedAt;

  ArticleModel(
      {this.author,
      this.title,
      this.url,
      this.description,
      this.contant,
      this.urlToImage,
      this.publishedAt});
}
