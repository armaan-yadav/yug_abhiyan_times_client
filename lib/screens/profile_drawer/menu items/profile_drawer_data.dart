import 'package:flutter/material.dart';
import 'package:yug_abhiyan_times_client/core/copy_to_clipboard.dart';
import 'package:yug_abhiyan_times_client/core/routes.dart';
import 'package:yug_abhiyan_times_client/screens/e_paper_page/e_paper.dart';
import 'package:yug_abhiyan_times_client/screens/notifications_page/notifications_page.dart';
import 'package:yug_abhiyan_times_client/screens/saved_news_page/saved_news_page.dart';
import 'package:yug_abhiyan_times_client/screens/select_location_page/select_location_page.dart';

List<Map<String, dynamic>> profileMenuItems = [
  {
    "itemName": "ઈ-પેપર",
    "itemIcon": Icons.newspaper,
    "onTap": (BuildContext context) {
      Routes.instance.push(const EPaper(), context);
    }
  },
  {
    "itemName": "તમારું શહેર પસંદ કરો",
    "itemIcon": Icons.location_on_outlined,
    "onTap": (BuildContext context) {
      Routes.instance.push(const SelectLocationPage(), context);
    }
  },
  {
    "itemName": "મારો મનપસંદ સબ્જેક્ટ",
    "itemIcon": Icons.apps,
    "onTap": (BuildContext context) {}
  },
  {
    "itemName": "સેવ",
    "itemIcon": Icons.bookmark_outline,
    "onTap": (BuildContext context) {
      Routes.instance.push(const SavedNewsPage(), context);
    }
  },
  {
    "itemName": "નોટિફિકેશન",
    "itemIcon": Icons.notifications_outlined,
    "onTap": (BuildContext context) {
      Routes.instance.push(const NotificationsPage(), context);
    }
  },
  {
    "itemName": "ડાર્ક મોડ",
    "itemIcon": Icons.dark_mode_outlined,
    "onTap": (BuildContext context) {}
  },
  {
    "itemName": "એપ શેર કરો",
    "itemIcon": Icons.share,
    "onTap": (BuildContext context) {
      copyToClipboard(text: "Share link copued to clipboard", context: context);
    }
  },
  {
    "itemName": "લૉગ આઉટ",
    "itemIcon": Icons.logout,
    "onTap": (BuildContext context) {}
  },
];

List<String> profileDrawerBottomBarItems = [
  "Terms and Conditions",
  "News Publisher Details",
  "App Verison 1.0",
];
