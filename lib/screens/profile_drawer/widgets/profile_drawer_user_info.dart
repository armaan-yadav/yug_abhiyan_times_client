import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.name,
    required this.phone,
    required this.userId,
  });

  final String? name;
  final String? phone;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 18.w, horizontal: 15.w),
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
          //!icon
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(.6),
                    ),
                    borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(5.sp),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.photo_camera_outlined,
                    size: 35.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 15.h,
              ),
              //!user info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    phone!,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black.withOpacity(.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "User ID: $userId",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black.withOpacity(.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),

          //!edit
          Container(
            padding: EdgeInsets.all(5.sp),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit_square,
                size: 30.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
