import 'package:flutter/material.dart';
import 'package:yug_abhiyan_times_client/core/theme.dart';
import 'package:yug_abhiyan_times_client/data/data.dart';
import 'package:yug_abhiyan_times_client/screens/notifications_page/notification_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: bottomShadowEffect,
          child: AppBar(
            title: const Text("નોટિફિકેશન "),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NotificationCard(
              notificationCardData: Data.instance.newsData,
            ),
            NotificationCard(
              notificationCardData: Data.instance.newsData,
            ),
          ],
        ),
      ),
    );
  }
}
