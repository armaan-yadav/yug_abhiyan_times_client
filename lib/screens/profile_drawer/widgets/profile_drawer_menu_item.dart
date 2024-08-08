import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDrawerMenuItem extends StatelessWidget {
  const ProfileDrawerMenuItem({
    super.key,
    required this.itemName,
    required this.itemIcon,
    required this.onTap,
  });
  final String itemName;
  final IconData itemIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 15.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black.withOpacity(.3),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              itemName,
              style: TextStyle(
                fontSize: 21.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              itemIcon,
              size: 30.sp,
            ),
          ],
        ),
      ),
    );
  }
}
