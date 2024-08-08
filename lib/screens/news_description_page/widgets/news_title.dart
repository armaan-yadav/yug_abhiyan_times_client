import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsHeading extends StatelessWidget {
  const NewsHeading(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.fontScale});

  final String title;
  final String subTitle;
  final double fontScale;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            children: [
              TextSpan(
                text: "$title : ",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp * fontScale,
                ),
              ),
              TextSpan(
                text: ' $subTitle',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp * fontScale,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
