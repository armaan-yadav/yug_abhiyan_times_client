import 'package:yug_abhiyan_times_client/models/news_model.dart';

class Data {
  static Data instance = Data();

  List<String> categories = [
    "🔥 Top News",
    "📌 Vadodara",
    "🏒 Paris Olympics",
    "🚩 My Gujarat",
    "🏏 Cricket",
    "🎬 Entertainment",
    "🗞️ Media",
    "🌍 World",
    "📰 Magazine",
    "💲Business",
  ];

  NewsModel newsData = NewsModel(
      id: "xyz3",
      title:
          "સુરત સિવિલના સત્તાધીશો નહીં સુધરેસુરત સિવિલના સત્તાધીશો નહીં સુધરેસુરત સિવિ",
      description:
          "https://images.bhaskarassets.com/webp/thumb/512x0/web2images/960/2024/08/07/01_1723006131.gif",
      subTitle:
          "1.20 કરોડની ધૂળ ખાતી ત્રણ એમ્બ્યુલન્સ દારૂની મહેફિલનો અડ્ડો બની, હાથમાં બોટલ સાથે દર્દી સારવાર લે છે, બેડ-સાધનો ધૂળ ખાય છે",
      categoryName: "સુરત",
      imageUrl:
          "https://images.bhaskarassets.com/webp/thumb/512x0/web2images/960/2024/08/07/01_1723006131.gif",
      uploadTime: "1 મિનિટે પેહ્લે");
}
