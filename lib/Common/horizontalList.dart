import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/Enum/destinationCategory.dart';

import '../Tiles/horizontalTile.dart';
import '../colors.dart';
import '../dummyData.dart';

class HorizontalList extends StatefulWidget {
  const HorizontalList({
    super.key,
  });

  @override
  State<HorizontalList> createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  DestinationCategory selectedCategory = DestinationCategory.beach;
  var curDataList = beachDataList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: IntrinsicHeight(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: DestinationCategory.values.map<Widget>((e) {
                  return tile(
                    getImage(e),
                    getName(e),
                    e,
                  );
                }).toList()),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: SizedBox(
            height: 250.h,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: curDataList.map<Widget>((e) {
                return HorizontalTiles(data: e);
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget tile(String image, String name, DestinationCategory cur) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = cur;
          curDataList = getDataList(cur);
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.w),
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: selectedCategory == cur ? MyColors.green : MyColors.grey,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              scale: 5,
              fit: BoxFit.contain,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
