import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_aggregator/models/article_model.dart';
import 'package:news_aggregator/helper/category.dart';
import 'package:news_aggregator/helper/blog.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryNews extends StatefulWidget {
  final String categoryName;
  CategoryNews({required this.categoryName});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articleModel = [];
  late final String category;
  late newsByCategory newsObject;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    category = widget.categoryName;
    newsObject = newsByCategory(category: category);
    load();
  }

  void load() async {
    await newsObject.getNews();
    articleModel = newsObject.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CupertinoActivityIndicator(
            radius: 40,
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    widget.categoryName,
                    style: GoogleFonts.libreBaskerville(
                      color: Colors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('data  ')
                ],
              ),
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 5.0),
                itemCount: articleModel.length,
                itemBuilder: (context, index) {
                  var p = articleModel[index];
                  return Blog(
                    imageURL: p.imageURL,
                    title: p.title,
                    description: p.description,
                    pageUrl: p.pageUrl,
                  );
                },
              ),
            ),
          );
  }
}
