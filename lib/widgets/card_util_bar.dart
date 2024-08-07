import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/core/extension.dart';

class CardUtilBottom extends StatefulWidget {
  const CardUtilBottom({
    super.key,
    required this.categoryName,
  });
  final String categoryName;

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
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                size: 28,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                //api call to add/remove news from user bookmarks
                setState(() {
                  isBookmarked = !isBookmarked;
                });
              },
              icon: isBookmarked
                  ? const Icon(
                      Icons.bookmark,
                      size: 28,
                    )
                  : const Icon(
                      Icons.bookmark_outline,
                      size: 28,
                    ),
            ),
          ],
        )
      ],
    );
  }
}
