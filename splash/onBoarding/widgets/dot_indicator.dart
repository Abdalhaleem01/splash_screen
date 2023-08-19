import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: Duration(milliseconds: 300),
    height: 10.h,
    width: isActive ? 38.w:10.w,
    decoration: BoxDecoration(color: isActive? Color(0xFF3499ED): Color(0xFFD3D3D3),
    borderRadius: BorderRadius.circular(4)),
    
    
    );
  }
}