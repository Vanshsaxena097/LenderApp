import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class AndroidLargeTenScreen extends StatelessWidget {
  AndroidLargeTenScreen({Key? key})
      : super(
    key: key,
  );

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController tenureValueOneController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.blue70044,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildRowDownloadTwenty(context),
                  SizedBox(height: 10.v),
                  _buildName(context),
                  SizedBox(height: 38.v),
                  _buildAmount(context),
                  SizedBox(height: 47.v),
                  _buildTenureValueOne(context),
                  SizedBox(height: 38.v),
                  _buildStartDate(context),
                  SizedBox(height: 38.v),
                  _buildEndDate(context),
                  SizedBox(height: 38.v),
                  _buildRowInterestRate(context),
                  SizedBox(height: 8.v),
                  _buildSubmit(context),
                  SizedBox(height: 10.v)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRowDownloadTwenty(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 45.v,
      ),
      decoration: AppDecoration.fillYellow.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDownload13,
            height: 56.v,
            width: 57.h,
            margin: EdgeInsets.only(bottom: 1.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 12.v,
              bottom: 5.v,
            ),
            child: Text(
              "Lending Conditions",
              style: theme.textTheme.headlineLarge,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.h),
      child: CustomTextFormField(
        controller: nameController,
        hintText: "Lender Name",
        borderDecoration: TextFormFieldStyleHelper.fillYellow,
        fillColor: appTheme.yellow50,
      ),
    );
  }

  Widget _buildAmount(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.h),
      child: CustomTextFormField(
        controller: amountController,
        hintText: "Total Amount",
        borderDecoration: TextFormFieldStyleHelper.fillYellow,
        fillColor: appTheme.yellow50,
      ),
    );
  }

  Widget _buildTenureValueOne(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.h),
      child: CustomTextFormField(
        controller: tenureValueOneController,
        hintText: "Tenure",
        textInputAction: TextInputAction.done,
        borderDecoration: TextFormFieldStyleHelper.fillYellow,
        fillColor: appTheme.yellow50,
      ),
    );
  }

  Widget _buildStartDate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.h),
      child: CustomTextFormField(
        controller: startDateController,
        hintText: "Start Date",
        borderDecoration: TextFormFieldStyleHelper.fillYellow,
        fillColor: appTheme.yellow50,
      ),
    );
  }

  Widget _buildEndDate(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.h),
      child: CustomTextFormField(
        controller: endDateController,
        hintText: "End Date",
        borderDecoration: TextFormFieldStyleHelper.fillYellow,
        fillColor: appTheme.yellow50,
      ),
    );
  }

  Widget _buildRowInterestRate(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 21.h),
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 9.v,
      ),
      decoration: AppDecoration.fillYellow.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 7.v,
              bottom: 5.v,
            ),
            child: Text(
              "Interest Rate",
              style: theme.textTheme.titleLarge,
            ),
          ),
          CustomTextFormField(
            controller: interestRateController,
            hintText: "Interest Rate",
            borderDecoration: TextFormFieldStyleHelper.fillYellow,
            fillColor: appTheme.yellow50,
            textInputAction: TextInputAction.done,
          )
        ],
      ),
    );
  }

  Widget _buildSubmit(BuildContext context) {
    return CustomElevatedButton(
      width: 106.h,
      text: "Submit",
      margin: EdgeInsets.only(right: 21.h),
      buttonTextStyle: theme.textTheme.titleLarge!,
      alignment: Alignment.centerRight,
    );
  }
}
