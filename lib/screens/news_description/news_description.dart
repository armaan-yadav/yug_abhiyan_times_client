import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/screens/news_description/widgets/font_size_container.dart';
import 'package:yug_abhiyan_times_client/screens/news_description/widgets/news_image.dart';
import 'package:yug_abhiyan_times_client/screens/news_description/widgets/news_title.dart';

class NewsDescription extends StatefulWidget {
  const NewsDescription({
    super.key,
    required this.newsData,
  });

  final Map<String, dynamic> newsData;

  @override
  State<NewsDescription> createState() => _NewsDescriptionState();
}

class _NewsDescriptionState extends State<NewsDescription> {
  bool isBookmarked = true;
  bool showFontSizeMenu = false;

  double _fontScale = 1.0;

  void changeFontScale(double scale) {
    setState(() {
      _fontScale = scale;
    });
  }

  void _toggleFontSizeMenu() {
    setState(() {
      showFontSizeMenu = !showFontSizeMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.newsData["title"];
    final String subTitle = widget.newsData["subTitle"];
    final String imageUrl = widget.newsData["imageUrl"];
    final String category = widget.newsData["categoryName"];
    final String description = widget.newsData["description"];
    final String id = widget.newsData["id"];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ]),
          child: AppBar(
            title: Text(widget.newsData["categoryName"]),
            actions: [
              IconButton(
                onPressed: () {
                  //api call to add/remove news from user bookmarks
                  setState(() {
                    isBookmarked = !isBookmarked;
                  });
                },
                icon: isBookmarked
                    ? Icon(
                        Icons.bookmark,
                        size: 28.sp,
                      )
                    : Icon(
                        Icons.bookmark_outline,
                        size: 28.sp,
                      ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  size: 28.sp,
                ),
              ),
              IconButton(
                onPressed: () {
                  _toggleFontSizeMenu();
                },
                icon: Icon(
                  Icons.text_fields,
                  size: 28.sp,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //! TITLE AND SUBTITLE
                  NewsHeading(
                    title: title,
                    subTitle: subTitle,
                    fontScale: _fontScale,
                  ),

                  //! place and time
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "$category | 3 કલાક પહેલા",
                      style: TextStyle(
                        fontSize: 16 * _fontScale,
                      ),
                    ),
                  ),

                  //!image
                  NewsImage(imageUrl: imageUrl),

                  //!  news description
                  Text(
                    description,
                    style: TextStyle(fontSize: 22.sp * _fontScale),
                  ),
                ],
              ),
            ),
          ),
          if (showFontSizeMenu)
            FontSizeContainer(
              changeFontScale: changeFontScale,
            ),
        ],
      ),
    );
  }
}
