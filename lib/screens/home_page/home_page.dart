import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/core/routes.dart';
import 'package:yug_abhiyan_times_client/data/data.dart';
import 'package:yug_abhiyan_times_client/screens/home_page/widgets/category_list.dart';
import 'package:yug_abhiyan_times_client/screens/profile_drawer/profile_drawer.dart';
import 'package:yug_abhiyan_times_client/screens/notifications_page/notifications_page.dart';
import 'package:yug_abhiyan_times_client/widgets/news_card.dart';
import 'package:yug_abhiyan_times_client/widgets/recent_news_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Data.instance.categories.length,
      child: Scaffold(
        key: scaffoldKey,
        drawer: const ProfileDrawer(),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: false,
                floating: false,
                snap: false,
                actions: [
                  IconButton(
                    onPressed: () {
                      Routes.instance.push(const NotificationsPage(), context);
                    },
                    icon: const Icon(
                      Icons.notifications_outlined,
                      size: 28,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Routes.instance.push(const ProfilePage(), context);
                      scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(
                      Icons.account_circle_outlined,
                      size: 28,
                    ),
                  ),
                ],
                title: Text(
                  "યુગ  અભિયાન ટાઈમ્સ ",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                // leading: Image.asset("assets/images/logo.png"),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverPersistentHeaderDelegate(
                  child: CategoryList(
                    categoriesList: Data.instance.categories,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 20.w),
                  RecentNewsCard(
                    newsData: Data.instance.recentNewsCardData,
                  ),
                  SizedBox(height: 20.w),
                  NewsCard(
                    newsData: Data.instance.recentNewsCardData1,
                  ),
                  SizedBox(height: 20.w),
                  NewsCard(
                    newsData: Data.instance.recentNewsCardData2,
                  ),
                  SizedBox(height: 20.w),
                  NewsCard(
                    newsData: Data.instance.recentNewsCardData3,
                  ),
                  SizedBox(height: 20.w),
                  NewsCard(
                    newsData: Data.instance.recentNewsCardData4,
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  const _SliverPersistentHeaderDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => 37;

  @override
  double get minExtent => 35;

  @override
  bool shouldRebuild(_SliverPersistentHeaderDelegate oldDelegate) => false;
}
