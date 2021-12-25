import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_aggregator/models/article_model.dart';
import 'package:news_aggregator/helper/news.dart';

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
                  height: 75,
                  margin: const EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          Card(
                              categoryName: 'Business',
                              imageURL: 'images/business.jpg'),
                          Card(
                              categoryName: 'Entertainment',
                              imageURL: 'images/entertainment.jpeg'),
                          Card(
                              categoryName: 'Politics',
                              imageURL: 'images/politics.jpeg'),
                          Card(
                              categoryName: 'Sports',
                              imageURL: 'images/sports.jpeg'),
                          Card(
                              categoryName: 'Science',
                              imageURL: 'images/science.jpeg'),
                          Card(
                              categoryName: 'Travel',
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
                      itemCount: articleModel.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        var p = articleModel[index];
                        return Blog(
                            imageURL: p.imageURL,
                            title: p.title,
                            description: p.description);
                      },
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

class Card extends StatelessWidget {
  final String categoryName, imageURL;
  Card({required this.categoryName, required this.imageURL});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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

class Blog extends StatelessWidget {
  final String imageURL, title, description;
  Blog(
      {required this.imageURL, required this.title, required this.description});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(imageURL),
        Text(title),
        Text(description),
      ],
    );
  }
}
