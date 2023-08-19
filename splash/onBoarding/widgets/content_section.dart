import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentSection extends StatelessWidget {
  const ContentSection(
      {super.key,
      required this.image,
      required this.title,
      required this.description});

  final image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          image,
          width: 343,
          height: 278,
        ),
         SizedBox(
          height: 92.h,
        ),
        Text(
          title,
          style:  TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
         SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 57),
          child: Text(
            description,
            style:  TextStyle(
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
