import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating,
    this.dark = false,
  });

  final double rating;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 9.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List<Widget>.generate(5, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.5.w,
                ),
                child: SvgPicture.asset(
                  'assets/images/star.svg',
                  color: index < rating - 1
                      ? MyColors.yellow
                      : dark
                          ? MyColors.grey
                          : Colors.white,
                  height: 10.sp,
                ),
              );
            }) +
            [
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    rating.toString(),
                    style: TextStyle(
                      color: dark ? Colors.black : Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
      ),
    );
  }
}
