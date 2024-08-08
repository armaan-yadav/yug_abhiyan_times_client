import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/screens/news_description_page/widgets/custom_radio_tile.dart';

class FontSizeContainer extends StatefulWidget {
  const FontSizeContainer(
      {super.key,
      required this.changeFontScale,
      required this.newsScreenContext,
      required this.toggleFontSizeMenu});

  final Function(double) changeFontScale;
  final VoidCallback toggleFontSizeMenu;

  final BuildContext newsScreenContext;
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
      child: Stack(
        children: [
          GestureDetector(
            onTap: widget.toggleFontSizeMenu,
            child: Container(
              color: Colors.black.withOpacity(.4),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
              height: 180.w,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    "તમારી સુવિધા અનુસાર ફોન્ટ સાઇઝ પસંદ કરો",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomRadioTile(
                        value: 1.0,
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value!;
                            widget.changeFontScale(_selectedValue);
                          });
                        },
                        title: "ડેફઊલટ ",
                      ),
                      CustomRadioTile(
                        value: 1.2,
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value!;
                            widget.changeFontScale(_selectedValue);
                          });
                        },
                        title: "મધ્યમ",
                      ),
                      CustomRadioTile(
                        value: 1.4,
                        groupValue: _selectedValue,
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value!;
                            widget.changeFontScale(_selectedValue);
                          });
                        },
                        title: "મોટા ",
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
