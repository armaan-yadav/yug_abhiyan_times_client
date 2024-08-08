import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRadioTile extends StatefulWidget {
  const CustomRadioTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  final double value;
  final double groupValue;
  final ValueChanged<double?> onChanged;
  final String title;

  @override
  State<CustomRadioTile> createState() => _CustomRadioTileState();
}

class _CustomRadioTileState extends State<CustomRadioTile> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.value == widget.groupValue;
    print("${widget.title} is $isSelected");
    return Column(
      children: [
        Radio(
          activeColor: Colors.yellow,
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: widget.onChanged,
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
