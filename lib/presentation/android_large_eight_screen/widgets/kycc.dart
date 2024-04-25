import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../android_large_nine_screen/android_large_nine_screen.dart';
import '../../android_large_ten_screen/android_large_ten_screen.dart';

class Kycc extends StatelessWidget {
  const Kycc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AndroidLargeTenScreen(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 35.h,
          vertical: 15.v,
        ),
        decoration: BoxDecoration(
          color: Colors.yellow, // Assuming AppDecoration.fillYellow is a color
          borderRadius: BorderRadius.circular(30.0), // Rounded border
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.v),
            CustomImageView(
              imagePath: ImageConstant.imgDownload19,
              height: 43.v,
              width: 46.h,
            ),
            SizedBox(height: 10.v),
            Container(
              width: 230.h,
              margin: EdgeInsets.only(left: 6.h),
              child: Text(
                "Edit/Add KYC Documents",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineLarge, // Using Theme
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgDownload18,
              height: 50.v,
              width: 113.h,
            ),
          ],
        ),
      ),
    );
  }
}
