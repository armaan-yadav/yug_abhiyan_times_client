import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/core/copy_to_clipboard.dart';
import 'package:yug_abhiyan_times_client/core/extension.dart';

class CardUtilBottom extends StatefulWidget {
  const CardUtilBottom({
    super.key,
    required this.categoryName,
    required this.categoryId,
    required this.newsId,
  });
  final String categoryName;
  final String categoryId;
  final String newsId;

  @override
  State<CardUtilBottom> createState() => _CardUtilBottomState();
}

class _CardUtilBottomState extends State<CardUtilBottom> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.categoryName.toTitleCase(),
          style: TextStyle(
            fontSize: 19.sp,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                copyToClipboard(
                  text: "news with id ${widget.newsId} copied to clipboard",
                  context: context,
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.share,
                    size: 26.sp,
                    color: Colors.black.withOpacity(.4),
                  ),
                  SizedBox(
                    width: 3.h,
                  ),
                  Text(
                    "સેવ ",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(.4),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10.h,
            ),
            IconButton(
              onPressed: () {
                //api call to add/remove news from user bookmarks
                setState(() {
                  isBookmarked = !isBookmarked;
                });
              },
              icon: isBookmarked
                  ? Row(
                      children: [
                        Icon(
                          Icons.bookmark,
                          size: 26.sp,
                          color: Colors.black.withOpacity(.4),
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "શેર",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(.4),
                          ),
                        )
                      ],
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.bookmark_outline,
                          size: 26.sp,
                          color: Colors.black.withOpacity(.4),
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "શેર",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(.4),
                          ),
                        )
                      ],
                    ),
            ),
          ],
        )
      ],
    );
  }
}
