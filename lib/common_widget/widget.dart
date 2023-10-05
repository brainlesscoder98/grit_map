import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GreenGradientNoWidth extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final double? fontSize;
  final double? radius;
  final bool? isLoading;
  const GreenGradientNoWidth({
    super.key,
    required this.text,
    this.height,
    this.fontSize,
    this.width,
    this.radius,
    this.isLoading,
  });
  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.all(5.sp),
              height: (isLoading ?? false) ? 60.sp : height ?? 60.sp,
              width: (isLoading ?? false) ? 60.sp : width ?? 380.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 60.sp),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.green, Colors.greenAccent])),
              child: Center(
                child: isLoading ?? false
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                )
                    : Text(
                  text,
                  style:TextStyle(
                      fontSize: fontSize ?? 20.sp, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
