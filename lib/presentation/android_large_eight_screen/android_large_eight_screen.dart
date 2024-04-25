import 'package:flutter/material.dart';
import 'package:vansh_s_application2/presentation/android_large_eight_screen/widgets/kycc.dart';
import '../../core/app_export.dart';
import 'widgets/kycdocuments_item_widget.dart';

class AndroidLargeEightScreen extends StatelessWidget {
  const AndroidLargeEightScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildRowDownloadSixt(context),
              SizedBox(height: 7.v),
              CustomImageView(
                imagePath: ImageConstant.imgDownload2237x47,
                height: 37.v,
                width: 47.h,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 12.v),
              _buildKycDocuments(context),
              _buildKyccDocuments(context)

            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildRowDownloadSixt(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 4.h,
        vertical: 43.v,
      ),
      decoration: AppDecoration.fillYellow.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDownload22,
            height: 56.v,
            width: 57.h,
            margin: EdgeInsets.only(bottom: 3.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 11.v,
              bottom: 8.v,
            ),
            child: Text(
              "Verified Documents",
              style: theme.textTheme.headlineLarge,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildKycDocuments(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.h,
        right: 30.h,
      ),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 70.v,
          );
        },
        itemCount: 1,
        itemBuilder: (context, index) {
          return KycdocumentsItemWidget();
        },
      ),
    );
  }
  Widget _buildKyccDocuments(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 25.h,
        left: 24.h,
        right: 30.h,
      ),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 70.v,
          );
        },
        itemCount: 1,
        itemBuilder: (context, index) {
          return Kycc();
        },
      ),
    );
  }
}
