import 'package:flutter/material.dart';
import 'package:news_aggregator/views/article_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Blog extends StatelessWidget {
  final String imageURL, title, description, pageUrl;
  Blog(
      {required this.imageURL,
      required this.title,
      required this.description,
      required this.pageUrl});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              pageUrl: pageUrl,
            ),
          ),
        );
      },
      child: Card(
        elevation: 10.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                child: Image.network(imageURL),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.openSans(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.lato(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
