import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/core/routes.dart';
import 'package:yug_abhiyan_times_client/models/news_model.dart';
import 'package:yug_abhiyan_times_client/screens/news_description_page/news_description.dart';
import 'package:yug_abhiyan_times_client/widgets/card_util_bar.dart';

class RecentNewsCard extends StatefulWidget {
  const RecentNewsCard({
    super.key,
    required this.newsData,
  });

  final NewsModel newsData;

  @override
  State<RecentNewsCard> createState() => _RecentNewsCardState();
}

class _RecentNewsCardState extends State<RecentNewsCard> {
  @override
  Widget build(BuildContext context) {
    final String title = widget.newsData.title;
    final String subTitle = widget.newsData.subTitle;
    final String imageUrl = widget.newsData.imageUrl;
    final String category = widget.newsData.categoryName;
    final String id = widget.newsData.id;
    return GestureDetector(
      onTap: () {
        Routes.instance
            .push(NewsDescription(newsData: widget.newsData), context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          // vertical: 13.w,
          horizontal: 10.h,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black26,
              width: 2.h,
            ),
          ),
        ),
        child: Column(
          children: [
            //! news section
            RichText(
              maxLines: 5,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 24.sp,
                ),
                children: [
                  TextSpan(
                    text: "$title : ",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: subTitle,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.w,
            ),
            SizedBox(
              width: double.infinity,
              height: 240.w,
              child: Stack(
                children: [
                  Container(
                    color: Colors.grey[200],
                  ),
                  Image.network(
                    imageUrl,
                    height: 240.w,
                    width: double.infinity,
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
            CardUtilBottom(
              categoryName: category,
              categoryId: "",
              newsId: id,
            )
          ],
        ),
      ),
    );
  }
}
