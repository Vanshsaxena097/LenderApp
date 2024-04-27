import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'lendermodal.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AndroidLargeNineScreen extends StatelessWidget {
  AndroidLargeNineScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController companyRegistrationController = TextEditingController();
  TextEditingController annualIncomeValueController = TextEditingController();
  TextEditingController taxIdentificationController = TextEditingController();
  TextEditingController voterIdCardValueController = TextEditingController();
  TextEditingController driversLicenseValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDownloadTwenty(context),
                SizedBox(height: 11.v),
                _buildTextFormField(
                  controller: userNameController,
                  hintText: "Username/Institution Name",
                ),
                SizedBox(height: 10.v),
                _buildTextFormField(
                  controller: companyRegistrationController,
                  hintText: "Company Registration Number",
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10.v),
                _buildTextFormField(
                  controller: annualIncomeValueController,
                  hintText: "Annual Income",
                ),
                SizedBox(height: 10.v),
                _buildTextFormField(
                  controller: taxIdentificationController,
                  hintText: "Tax Identification Number",
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10.v),
                _buildTextFormField(
                  controller: voterIdCardValueController,
                  hintText: "Voter ID Card",
                ),
                SizedBox(height: 10.v),
                _buildTextFormField(
                  controller: driversLicenseValueController,
                  hintText: "Driver's License",
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 14.v),
                _buildSubmitButton(context),
                SizedBox(height: 7.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDownloadTwenty(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 44.v),
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
            padding: EdgeInsets.only(left: 9.h, top: 11.v, bottom: 7.v ,right: 0.v),
            child: Text(
              "KYC Documents",
              style: theme.textTheme.headlineLarge,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 39.v),
      child: CustomTextFormField(
        controller: controller,
        hintText: hintText,
        textInputType: textInputType,
        textInputAction: textInputAction,
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return CustomElevatedButton(
      height: 39.v,
      width: 106.h,
      text: "Submit",
      onPressed: () => _submitForm(context),
      buttonTextStyle: theme.textTheme.titleLarge!,
      alignment: Alignment.centerRight,
    );
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final detail = LenderDetail(
        userName: userNameController.text,
        companyRegistration: companyRegistrationController.text,
        annualIncomeValue: annualIncomeValueController.text,
        taxIdentification: taxIdentificationController.text,
        voterIdCardValue: voterIdCardValueController.text,
        driversLicenseValue: driversLicenseValueController.text,
      );

      _saveToCollection(detail);

      // Optionally, you can navigate to another screen or show a success message here
    }
  }

  void _saveToCollection(LenderDetail detail) {
    // Assuming you're using Firebase Firestore for database operations
    FirebaseFirestore.instance.collection('lenders_detail').add({
      'userName': detail.userName,
      'companyRegistration': detail.companyRegistration,
      'annualIncomeValue': detail.annualIncomeValue,
      'taxIdentification': detail.taxIdentification,
      'voterIdCardValue': detail.voterIdCardValue,
      'driversLicenseValue': detail.driversLicenseValue,
    }).then((value) {
      // Data saved successfully
      print("Data saved successfully");
    }).catchError((error) {
      // Error occurred while saving data
      print("Error: $error");
    });
  }
}
