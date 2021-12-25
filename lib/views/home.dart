import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      body: Container(
        child: Column(
          children: [
            Container(
              height: 75,
              margin: const EdgeInsets.only(top: 5.0),
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                //shrinkWrap: true,
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
            )
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String categoryName, imageURL;
  Card({required this.categoryName, required this.imageURL});
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
