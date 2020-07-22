import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsappp/helper/data.dart';
import 'package:newsappp/helper/news.dart';
import 'package:newsappp/models/article_model.dart';
import 'package:newsappp/models/category_model.dart';
import 'package:newsappp/views/ArticleView.dart';
import 'package:newsappp/views/category_new.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> catogries = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    catogries = getCatories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter"),
            Text("News", style: TextStyle(color: Colors.blue)),
          ],
        ),
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    ///Categories
                    Container(
                      height: 70,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: catogries.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl: catogries[index].imgUrl,
                              categoryName: catogries[index].categoryName,
                            );
                          }),
                    ),

                    ///Blogs
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          itemCount: articles.length,
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BlogTitle(
                              imgUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].articleUrl,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black38,
              ),
              width: 120,
              height: 60,
              child: Text(
                categoryName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTitle extends StatelessWidget {
  final String imgUrl, title, desc, url;
  BlogTitle(
      {@required this.imgUrl,
      @required this.title,
      @required this.desc,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imgUrl)),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}
