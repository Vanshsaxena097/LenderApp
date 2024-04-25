import 'package:flutter/material.dart';
import '../../../core/app_export.dart'; // ignore: must_be_immutable

class AvailablegridItemWidget extends StatelessWidget {
  const AvailablegridItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.h,
        vertical: 2.v,
      ),
      decoration: AppDecoration.outlineBlack,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 21.v),
          CustomImageView(
            imagePath: ImageConstant.imgImages3,
            height: 118.adaptSize,
            width: 118.adaptSize,
          ),
          Text(
            "Available Farmers",
            style: theme.textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}
