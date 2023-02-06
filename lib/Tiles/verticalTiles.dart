// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/colors.dart';
import 'package:travelapp/Models/dataModel.dart';
import 'package:travelapp/Common/favIcon.dart';
import 'package:travelapp/Common/rating.dart';

import '../Pages/detailPage.dart';

class VerticalTiles extends StatelessWidget {
  final DataModel data;
  const VerticalTiles({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailPage(data: data)));
        },
        child: Container(
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: MyColors.grey, width: 1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  image(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.h),
                          child:
                              Hero(tag: "${data.name}name", child: placeName()),
                        ),
                        Hero(
                          tag: "${data.name}price",
                          child: price(),
                        ),
                        Hero(
                          tag: "${data.name}rating",
                          child: Rating(
                            rating: data.rating,
                            dark: true,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: SizedBox(
                            width: 150.w,
                            child: Hero(
                              tag: "${data.name}description",
                              child: description(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Hero(
                tag: "${data.name}fav",
                child: FavIcon(
                  noCircle: true,
                  unselectedColor: MyColors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget description() {
    return Material(
      type: MaterialType.transparency,
      child: Text(
        data.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          height: 1.5.h,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget price() {
    return Material(
      type: MaterialType.transparency,
      child: Text(
        "₹${data.price.priceString}",
        style: TextStyle(
          fontSize: 18.sp,
          color: MyColors.red,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget placeName() {
    return Material(
      type: MaterialType.transparency,
      child: Text(
        data.name,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  ClipRRect image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Hero(
        tag: "${data.name}image",
        child: Image.asset(
          data.imageUrl,
          fit: BoxFit.cover,
          height: 150.h,
          width: 100.w,
        ),
      ),
    );
  }
}

extension on int {
  String get priceString {
    final numberString = toString();
    final numberDigits = List.from(numberString.split(''));
    int index = numberDigits.length - 3;
    while (index > 0) {
      numberDigits.insert(index, ',');
      index -= 3;
    }
    return numberDigits.join();
  }
}
