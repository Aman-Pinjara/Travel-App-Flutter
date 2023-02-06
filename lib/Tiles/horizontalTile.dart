// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelapp/colors.dart';
import 'package:travelapp/Pages/detailPage.dart';

import '../Models/dataModel.dart';
import '../Common/favIcon.dart';
import '../Common/location.dart';
import '../Common/rating.dart';

class HorizontalTiles extends StatelessWidget {
  final DataModel data;
  const HorizontalTiles({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.r),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(data: data)));
          },
          child: IntrinsicWidth(
            child: Stack(
              children: [
                image(),
                Positioned.fill(child: overlayInfo()),
                Positioned(
                  top: 15.h,
                  right: 12.w,
                  child: Hero(
                    tag: "${data.name}fav",
                    child: FavIcon(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget overlayInfo() {
    return Container(
      constraints: BoxConstraints.expand(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(0.8),
            Colors.transparent,
          ],
          stops: const [0.0, 0.6],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name(),
          Hero(
            tag: "${data.name}location",
            child: LocationView(
              location: data.location,
            ),
          ),
          Hero(
            tag: "${data.name}rating",
            child: Rating(rating: data.rating),
          ),
        ],
      ),
    );
  }

  SizedBox image() {
    return SizedBox(
      height: 250.h,
      width: 180.w,
      child: Hero(
        tag: "${data.name}image",
        child: Image.asset(
          data.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Padding name() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Hero(
        tag: "${data.name}name",
        child: Material(
          color: Colors.transparent,
          child: Text(
            data.name,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
