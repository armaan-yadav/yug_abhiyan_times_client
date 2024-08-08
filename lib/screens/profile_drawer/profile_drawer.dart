import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/screens/profile_drawer/menu%20items/profile_drawer_data.dart';
import 'package:yug_abhiyan_times_client/screens/profile_drawer/widgets/profile_drawer_menu_item.dart';
import 'package:yug_abhiyan_times_client/screens/profile_drawer/widgets/profile_drawer_user_info.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SizedBox(
        width: (MediaQuery.of(context).size.width * 85 / 100),
        child: Drawer(
          child: Container(
            color: Colors.white,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //!user profile
                  ProfileSection(
                    name: "raj",
                    phone: "12345678909",
                    userId: "avx12",
                  ),

                  ...profileMenuItems.map(
                    (e) {
                      return ProfileDrawerMenuItem(
                        itemName: e["itemName"],
                        itemIcon: e["itemIcon"],
                        onTap: () {
                          e["onTap"](context);
                        },
                      );
                    },
                  ),

                  ...profileDrawerBottomBarItems.map(
                    (e) => Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 7.w,
                        horizontal: 15.h,
                      ),
                      child: Text(
                        e,
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.black.withOpacity(.4),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
