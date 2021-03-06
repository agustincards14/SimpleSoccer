import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fotmob_clone/models/news_model.dart';

class NewsHomePage extends StatelessWidget {
  final List<Article> articlesList = [];
  final List<String> imageURLList = [];
  final TextStyle headerStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 26);

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 10; i++) {
      articlesList.add(Article(
          "http://placekitten.com/600/40$i",
          "Article $i: insert prolonged title here",
          "Subtitle: time stamp $i"));
    }
    return Container(
      child: ListView.builder(
        // itemExtent: 100,
        itemCount: articlesList.length,
        itemBuilder: (BuildContext context, int index) {
          Article article = articlesList[index];
          if (index == 0) {
            return Container(
              height: 391,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ArticleView(article)));
                },
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(article.imageURL)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 8.0, right: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title,
                                style: headerStyle,
                              ),
                              SizedBox(height: 15),
                              Text(article.subtitle)
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Container(
            height: 120,
            margin: EdgeInsets.all(0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ArticleView(article)));
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: article.thumbnail),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 200,
                            child: Text(
                              article.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(article.subtitle),
                        ]),
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ArticleView extends StatelessWidget {
  ArticleView(this.article, {Key key}) : super(key: key);

  final Article article;
  final TextStyle headerStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ListView(
          //TODO: Replace ListView with ScrollView
          //TODO: Test scrollability of article text with file stream for mass text
          children: <Widget>[
            article.image,
            Padding(
              padding: EdgeInsets.all(14.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      style: headerStyle,
                    ),
                    SizedBox(height: 20),
                    Text(article.subtitle),
                    SizedBox(height: 30),
                    SingleChildScrollView(
                      //Might not be necessary
                      child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(border: Border.all()),
                          child: Text(
                              "CONTENT\n GOES\n HERE\nBLAH\nBLAH\BLAH\nCONTENT\n GOES\n HERE\nBLAH\nBLAH\BLAH\nCONTENT\n GOES\n HERE\nBLAH\nBLAH\BLAH")),
                    ),
                  ]),
            )
          ],
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            backgroundColor: Colors.transparent, //No more green
            elevation: 0.0, //Shadow gone
          ),
        ),
      ]),
    );
  }
}
