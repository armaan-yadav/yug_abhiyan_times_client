import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:yug_abhiyan_times_client/core/copy_to_clipboard.dart';
import 'package:yug_abhiyan_times_client/screens/news_description_page/widgets/font_size_container.dart';
import 'package:yug_abhiyan_times_client/screens/news_description_page/widgets/news_image.dart';
import 'package:yug_abhiyan_times_client/screens/news_description_page/widgets/news_title.dart';

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
  bool isBookmarked = false;
  bool showFontSizeMenu = false;
  double _fontScale = 1.0;
  bool _showStopSpeechButton = false;

  int? _currentWordStart, _currentWordEnd;

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

  void _toggleShowStopSpeechButton() {
    setState(() {
      _showStopSpeechButton = !_showStopSpeechButton;
    });
  }

  void startTextToSpeech(String textInput) async {
    FlutterTts flutterTts = FlutterTts();
    _toggleShowStopSpeechButton();
    await flutterTts.setLanguage("gu-IN");
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1.0);

    await flutterTts.speak(textInput);

    flutterTts.setProgressHandler(
      (text, start, end, word) {
        setState(() {
          _currentWordEnd = end;
          _currentWordStart = start;
        });
      },
    );

    flutterTts.setCompletionHandler(
      () {
        _toggleShowStopSpeechButton();
      },
    );
  }

  void stopTextToSpeech() async {
    FlutterTts flutterTts = FlutterTts();

    flutterTts.stop();
    _toggleShowStopSpeechButton();
  }

  @override
  void dispose() {
    stopTextToSpeech();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.newsData["title"];
    final String subTitle = widget.newsData["subTitle"];
    final String imageUrl = widget.newsData["imageUrl"];
    final String category = widget.newsData["categoryName"];
    final String description = widget.newsData["description"];
    final String newsId = widget.newsData["id"];

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
                onPressed: () {
                  copyToClipboard(
                      text: "News with id $newsId copied", context: context);
                },
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
                  NewsImage(
                    imageUrl: imageUrl,
                    newsId: newsId,
                  ),

                  // //!  news description
                  _showStopSpeechButton
                      ? RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    description.substring(0, _currentWordStart),
                                style: TextStyle(
                                  fontSize: 22.sp * _fontScale,
                                  color: Colors.black,
                                ),
                              ),
                              if (_currentWordStart != null)
                                TextSpan(
                                  text: description.substring(
                                    _currentWordStart!,
                                    _currentWordEnd,
                                  ),
                                  style: TextStyle(
                                    fontSize: 22.sp * _fontScale,
                                    color: Colors.black,
                                    backgroundColor: Colors.yellowAccent,
                                  ),
                                ),
                              if (_currentWordEnd != null)
                                TextSpan(
                                  text: description.substring(_currentWordEnd!),
                                  style: TextStyle(
                                    fontSize: 22.sp * _fontScale,
                                    color: Colors.black,
                                  ),
                                ),
                            ],
                          ),
                        )
                      : Text(
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
              toggleFontSizeMenu: _toggleFontSizeMenu,
              newsScreenContext: context,
            ),
          Positioned(
            bottom: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                startTextToSpeech(description);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(220, 0, 0, 0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.record_voice_over,
                    color: Colors.white,
                    size: 28.sp,
                  ),
                ),
              ),
            ),
          ),
          if (_showStopSpeechButton)
            Positioned(
              bottom: 10,
              right: 60,
              child: GestureDetector(
                onTap: () {
                  stopTextToSpeech();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(220, 0, 0, 0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 28.sp,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
