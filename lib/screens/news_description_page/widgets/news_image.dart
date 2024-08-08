import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/core/copy_to_clipboard.dart';

class NewsImage extends StatelessWidget {
  const NewsImage({super.key, required this.imageUrl, required this.newsId});
  final String imageUrl;
  final String newsId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 1),
      ),
      child: Column(
        children: [
          Stack(
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
          Container(
            color: Colors.white,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    copyToClipboard(
                        text: "News with id $newsId copied", context: context);
                  },
                  icon: const Icon(
                    Icons.share,
                    size: 20,
                    color: Colors.black38,
                  ),
                ),
                const Text(
                  "શેર",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black38,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
