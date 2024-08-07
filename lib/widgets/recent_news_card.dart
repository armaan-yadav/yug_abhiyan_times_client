import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/widgets/card_util_bar.dart';

class RecentNewsCard extends StatefulWidget {
  const RecentNewsCard({
    super.key,
    required this.category,
  });

  final Map<String, dynamic> category;

  @override
  State<RecentNewsCard> createState() => _RecentNewsCardState();
}

class _RecentNewsCardState extends State<RecentNewsCard> {
  @override
  Widget build(BuildContext context) {
    final String title = widget.category["title"];
    final String subTitle = widget.category["subTitle"];
    final String imageUrl = widget.category["imageUrl"];
    final String category = widget.category["category"];
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 13,
        horizontal: 10,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.black26,
            width: 2,
          ),
        ),
      ),
      child: Column(
        children: [
          //! news section
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 24.sp,
              ),
              children: [
                TextSpan(
                  text: "$title : ",
                  style: const TextStyle(
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: subTitle,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Image.network(
            imageUrl,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          CardUtilBottom(categoryName: category)
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class RecentNewsCard extends StatefulWidget {
//   const RecentNewsCard(
//       {super.key,
//       required this.title,
//       required this.id,
//       required this.imageUrl,
//       required this.categoryName});
//   final String title;
//   final String id;
//   final String imageUrl;
//   final String categoryName;

//   @override
//   State<RecentNewsCard> createState() => _RecentNewsCardState();
// }

// class _RecentNewsCardState extends State<RecentNewsCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: Colors.black,
//       child: Column(
//         children: [
//           //! news section
//           Row(
//             children: [],
//           )
//         ],
//       ),
//     );
//   }
// }
