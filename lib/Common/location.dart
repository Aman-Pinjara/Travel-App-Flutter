import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LocationView extends StatelessWidget {
  const LocationView({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/location.svg',
          height: 16.sp,
        ),
        Padding(
          padding: EdgeInsets.only(left: 7.w),
          child: Material(
          color: Colors.transparent,
            child: Text(
              location,
              style: const  TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}