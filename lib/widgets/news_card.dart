import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/core/routes.dart';
import 'package:yug_abhiyan_times_client/screens/news_description/news_description.dart';
import 'package:yug_abhiyan_times_client/widgets/card_util_bar.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.newsData});

  final Map<String, dynamic> newsData;
  @override
  Widget build(BuildContext context) {
    final String title = newsData["title"];
    final String subTitle = newsData["subTitle"];
    final String imageUrl = newsData["imageUrl"];
    final String category = newsData["categoryName"];

    return GestureDetector(
      onTap: () {
        Routes.instance.push(NewsDescription(newsData: newsData), context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 13.w,
          horizontal: 10.h,
        ),
        constraints: BoxConstraints(
          minHeight: 250.w,
          maxHeight: 600.w,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black26,
              width: 2,
            ),
          ),
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 8,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "$title : ",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w800,
                                fontSize: 24.sp,
                              ),
                            ),
                            TextSpan(
                              text: ' $subTitle',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 22.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.h,
                      height: double.infinity,
                    ),
                    SizedBox(
                      height: 100.w,
                      width: 160.h,
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.grey[200],
                          ),
                          Image.network(
                            imageUrl,
                            height: 100.w,
                            width: 160.h,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                color: Colors.grey[200],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              CardUtilBottom(
                categoryName: category,
                categoryId: "",
                newsId: newsData["id"],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
