import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_aggregator/models/article_model.dart';
import 'package:news_aggregator/views/category_news.dart';
import 'package:news_aggregator/helper/news.dart';
import 'package:news_aggregator/helper/blog.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticleModel> articleModel = [];
  News newsObject = News();
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    getReports();
  }

  Future<void> getReports() async {
    await newsObject.getNews();
    articleModel = newsObject.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Quick',
              style: GoogleFonts.libreBaskerville(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'News',
              style: GoogleFonts.libreBaskerville(
                color: Colors.red,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CupertinoActivityIndicator(
                radius: 40,
              ),
            )
          : Column(
              children: [
                //categories
                Container(
                  height: 80,
                  margin: const EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          CardTile(
                              categoryName: 'Business',
                              imageURL: 'images/business.jpg'),
                          CardTile(
                              categoryName: 'Entertainment',
                              imageURL: 'images/entertainment.jpeg'),
                          CardTile(
                              categoryName: 'General',
                              imageURL: 'images/politics.jpeg'),
                          CardTile(
                              categoryName: 'Sports',
                              imageURL: 'images/sports.jpeg'),
                          CardTile(
                              categoryName: 'Science',
                              imageURL: 'images/science.jpeg'),
                          CardTile(
                              categoryName: 'Health',
                              imageURL: 'images/travel.jpeg'),
                        ],
                      ),
                    ],
                  ),
                ),

                //blogs
                Expanded(
                  child: Container(
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
                )
              ],
            ),
    );
  }
}

class CardTile extends StatelessWidget {
  final String categoryName, imageURL;
  CardTile({required this.categoryName, required this.imageURL});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryNews(categoryName: categoryName)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.only(left: 5),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                imageURL,
                height: 75,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 75,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black45,
              ),
              child: Text(
                categoryName,
                style: GoogleFonts.notoSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
