import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:yug_abhiyan_times_client/models/news_model.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notificationCardData});

  final NewsModel notificationCardData;
  @override
  Widget build(BuildContext context) {
    final String imageUrl = notificationCardData.imageUrl;
    final String title = notificationCardData.title;
    final String id = notificationCardData.id;
    final String uploadTime = notificationCardData.uploadTime;
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              //remove notification from provider
            },
            icon: Icons.delete_outline,
            label: "ડેલેટે ",
            backgroundColor: Colors.red,
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: 140.w,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.w),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(.4),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: Image.network(
                imageUrl,
                height: 80.w,
                fit: BoxFit.fill,
                width: 80.h,
              ),
            ),
            SizedBox(
              width: 20.h,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  Text(
                    uploadTime,
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.black.withOpacity(.4),
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
