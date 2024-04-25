import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../android_large_nine_screen/android_large_nine_screen.dart';


class Kycc extends StatelessWidget {
  const Kycc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 35.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.fillYellow.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 4.v),
          GestureDetector(
            onTap: () {
              // Navigate to the androidlargeninescreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  AndroidLargeNineScreen(),
                ),
              );
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgDownload19,
              height: 43.v,
              width: 46.h,
            ),
          ),
          SizedBox(height: 10.v),
          Container(
            width: 230.h,
            margin: EdgeInsets.only(left: 6.h),
            child: Text(
              "      Edit/Add \nKYC Documents",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.headlineLarge,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgDownload18,
            height: 50.v,
            width: 113.h,
          )
        ],
      ),
    );
  }
}