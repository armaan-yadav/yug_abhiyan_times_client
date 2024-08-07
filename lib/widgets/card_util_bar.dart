import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
        duration: Durations.long1,
      ),
    );
  }

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
              onPressed: () {
                _copyToClipboard(
                    "news with id ${widget.newsId} copied to clipboard");
              },
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
