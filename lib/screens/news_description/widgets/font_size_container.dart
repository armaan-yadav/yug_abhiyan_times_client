import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/screens/news_description/widgets/custom_radio_tile.dart';

class FontSizeContainer extends StatefulWidget {
  const FontSizeContainer({super.key, required this.changeFontScale});

  final Function(double) changeFontScale;

  @override
  State<FontSizeContainer> createState() => _FontSizeContainerState();
}

class _FontSizeContainerState extends State<FontSizeContainer> {
  double _selectedValue = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: Colors.red,
      
    );
  }
}
