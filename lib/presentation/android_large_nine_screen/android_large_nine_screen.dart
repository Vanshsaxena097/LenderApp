import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AndroidLargeNineScreen extends StatelessWidget {
  AndroidLargeNineScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController userNameController = TextEditingController();

  TextEditingController companyRegistrationController = TextEditingController();

  TextEditingController annualIncomeValueController = TextEditingController();

  TextEditingController taxIdentificationController = TextEditingController();

  TextEditingController voterIdCardValueController = TextEditingController();

  TextEditingController driversLicenseValueController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    _buildDownloadTwenty(context),
                    CustomImageView(
                      imagePath: ImageConstant.imgDownload2237x47,
                      height: 37.v,
                      width: 47.h,
                      alignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 11.v),
                    _buildUserName(context),
                    SizedBox(height: 39.v),
                    _buildCompanyRegistration(context),
                    SizedBox(height: 39.v),
                    _buildAnnualIncomeValue(context),
                    SizedBox(height: 39.v),
                    _buildTaxIdentification(context),
                    SizedBox(height: 39.v),
                    _buildVoterIdCardValue(context),
                    SizedBox(height: 39.v),
                    _buildDriversLicenseValue(context),
                    SizedBox(height: 14.v),
                    _buildSubmit(context),
                    SizedBox(height: 7.v)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDownloadTwenty(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 18.h,
        vertical: 44.v,
      ),
      decoration: AppDecoration.fillYellow.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder60,
      ),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDownload22,
            height: 56.v,
            width: 57.h,
            margin: EdgeInsets.only(top: 2.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 11.v,
              bottom: 7.v,
            ),
            child: Text(
              "KYC Documents",
              style: theme.textTheme.headlineLarge,
            ),
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.h,
        right: 24.h,
      ),
      child: CustomTextFormField(
        controller: userNameController,
        hintText: "Username/Institution Name ",
        contentPadding: EdgeInsets.symmetric(
          horizontal: 6.h,
          vertical: 15.v,
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildCompanyRegistration(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.h,
        right: 24.h,
      ),
      child: CustomTextFormField(
        controller: companyRegistrationController,
        hintText: "Company Registration Number",
        textInputType: TextInputType.number,
      ),
    );
  }

  /// Section Widget
  Widget _buildAnnualIncomeValue(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.h,
        right: 24.h,
      ),
      child: CustomTextFormField(
        controller: annualIncomeValueController,
        hintText: "Annual Income",
      ),
    );
  }

  /// Section Widget
  Widget _buildTaxIdentification(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.h,
        right: 24.h,
      ),
      child: CustomTextFormField(
        controller: taxIdentificationController,
        hintText: "Tax Identification Number",
        textInputType: TextInputType.number,
      ),
    );
  }

  /// Section Widget
  Widget _buildVoterIdCardValue(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.h,
        right: 24.h,
      ),
      child: CustomTextFormField(
        controller: voterIdCardValueController,
        hintText: "Voter ID Card",
      ),
    );
  }

  /// Section Widget
  Widget _buildDriversLicenseValue(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 18.h,
        right: 24.h,
      ),
      child: CustomTextFormField(
        controller: driversLicenseValueController,
        hintText: "Driver's License",
        textInputAction: TextInputAction.done,
      ),
    );
  }

  /// Section Widget
  Widget _buildSubmit(BuildContext context) {
    return CustomElevatedButton(
      height: 39.v,
      width: 106.h,
      text: "Submit",
      margin: EdgeInsets.only(right: 24.h),
      buttonTextStyle: theme.textTheme.titleLarge!,
      alignment: Alignment.centerRight,
    );
  }
}
