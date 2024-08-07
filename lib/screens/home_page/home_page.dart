import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/core/routes.dart';
import 'package:yug_abhiyan_times_client/data/data.dart';
import 'package:yug_abhiyan_times_client/screens/notifications_page/notifications_page.dart';
import 'package:yug_abhiyan_times_client/screens/profile_page/profile_page.dart';
import 'package:yug_abhiyan_times_client/widgets/recent_news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Routes.instance.push(const NotificationsPage(), context);
              },
              icon: const Icon(
                Icons.notifications_outlined,
                size: 24,
              )),
          IconButton(
              onPressed: () {
                Routes.instance.push(const ProfilePage(), context);
              },
              icon: const Icon(
                Icons.account_circle_outlined,
                size: 24,
              )),
        ],
        title: const Text("Yug Abhiyan Times"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: Data.instance.categories
                      .map(
                        (e) => Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                color: Colors.black26,
                                width: 2,
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.only(right: 20),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RecentNewsCard(
              category: Data.instance.recentNewsCardData,
            ),
          ],
        ),
      ),
    );
  }
}
