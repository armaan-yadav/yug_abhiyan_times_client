import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yug_abhiyan_times_client/data/data.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.categoriesList});

  final List<String> categoriesList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.only(bottom: 2),
        height: 50,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            spreadRadius: 10,
            blurRadius: 1,
            offset: const Offset(0, 5),
          ),
        ]),
        child: Row(
          children: Data.instance.categories.map(
            (e) {
              return Container(
                decoration: const BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Colors.black26,
                      width: 2,
                    ),
                  ),
                ),
                padding: const EdgeInsets.only(right: 20),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  e,
                  style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
