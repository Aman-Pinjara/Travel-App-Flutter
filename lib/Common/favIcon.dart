import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({
    super.key,
    this.noCircle = false,
    this.unselectedColor = Colors.black,
  });

  final Color unselectedColor;
  final bool noCircle;

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFav = !isFav;
        });
      },
      child: CircleAvatar(
        backgroundColor: widget.noCircle ? Colors.transparent : Colors.white,
        child: SvgPicture.asset(
          isFav ? 'assets/images/heart.svg' : 'assets/images/heart_outline.svg',
          color: isFav ? Colors.red : widget.unselectedColor,
          height: widget.noCircle ? 18.h : 15.h,
        ),
      ),
    );
  }
}
