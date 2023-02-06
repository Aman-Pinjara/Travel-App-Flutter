import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/Models/dataModel.dart';
import 'package:travelapp/Common/favIcon.dart';
import 'package:travelapp/Common/location.dart';
import 'package:travelapp/Common/rating.dart';

import '../colors.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.data});

  final DataModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0.r),
            child: Hero(
              tag: "${data.name}fav",
              child: const FavIcon(
                noCircle: true,
                unselectedColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            child: Hero(
              tag: data.imageUrl,
              child: image(),
            ),
          ),
          SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.6],
                ),
              ),
              padding: EdgeInsets.all(25.w),
              constraints: const BoxConstraints.expand(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(
                        tag: "${data.name}name",
                        child: titleText(),
                      ),
                      Hero(
                        tag: "${data.name}location",
                        child: LocationView(location: data.location),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    child: Hero(
                      tag: "${data.name}description",
                      child: description(),
                    ),
                  ),
                  Hero(
                    tag: "${data.name}rating",
                    child: Rating(rating: data.rating),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Hero(tag: "${data.name}price", child: price()),
                      buynowBtn(),
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

  Image image() {
    return Image.asset(
      data.imageUrl,
      fit: BoxFit.cover,
    );
  }

  TextButton buynowBtn() {
    return TextButton(
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: MyColors.yellow,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Text(
          "Book Now",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Material price() {
    return Material(
      type: MaterialType.transparency,
      child: Text(
        "₹${data.price.priceString}/person",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Material titleText() {
    return Material(
      color: Colors.transparent,
      child: Text(
        data.name,
        style: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget description() {
    return Material(
      type: MaterialType.transparency,
      child: Text(
        data.description,
        style: TextStyle(
          color: Colors.white,
          height: 1.8.h,
          fontSize: 12.sp,
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
