import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/colors.dart';
import 'package:travelapp/dummyData.dart';
import 'package:travelapp/Tiles/verticalTiles.dart';

import '../Common/horizontalList.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        toolbarHeight: 100.h,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          padding: EdgeInsets.symmetric(vertical: 30.h),
          child: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: const CircleAvatar(
              backgroundColor: MyColors.grey,
            ),
          ),
        ),
        title: Text(
          'Hello, Vineetha',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25.r),
            child: TextButton(
              onPressed: () {},
              child: Image.asset(
                'assets/images/lamp.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  welcomeText(),
                  searchBar(),
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.h,
                            horizontal: 20.w,
                          ),
                          child: categoryViewer('Choose Category', () {}),
                        ),
                        const HorizontalList(),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20.h,
                        horizontal: 20.w,
                      ),
                      child: categoryViewer('Popular Package', () {}),
                    ),
                  ),
                  verticalList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding searchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0.h),
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: MyColors.grey.withOpacity(0.3),
        ),
      ),
    );
  }

  Text welcomeText() {
    return Text(
      'Where do you\nwant to explore today?',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28.sp,
      ),
    );
  }

  SliverPadding verticalList() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          popularDataList.map<Widget>((e) {
            return VerticalTiles(data: e);
          }).toList(),
        ),
      ),
    );
  }

  Widget categoryViewer(String category, Function() onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          category,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: onTap(),
          child: Text(
            "See all",
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
