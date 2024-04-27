import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';

class AndroidLargeTenScreen extends StatelessWidget {
  AndroidLargeTenScreen({Key? key}) : super(key: key);

  final _firestore = FirebaseFirestore.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController tenureValueOneController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();

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
            child: Column(
              children: [
                _buildRowDownloadTwenty(context),
                SizedBox(height: 10.v),
                _buildName(context),
                SizedBox(height: 20.v),
                _buildAmount(context),
                SizedBox(height: 20.v),
                _buildTenureValueOne(context),
                SizedBox(height: 20.v),
                _buildStartDate(context),
                SizedBox(height: 20.v),
                _buildEndDate(context),
                SizedBox(height: 20.v),
                _buildRowInterestRate(context),
                SizedBox(height: 8.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 10.h),
                  child: _buildSubmit(context),
                ),
                SizedBox(height: 10.v)
              ],
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 21.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 21.h),
        decoration: AppDecoration.fillYellow.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder30,
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: interestRateController,
                hintText: "Interest Rate",
                borderDecoration: TextFormFieldStyleHelper.fillYellow,
                fillColor: appTheme.yellow50,
                textInputAction: TextInputAction.done,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmit(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomElevatedButton(
          width: 150.h,
          text: "Submit",
          buttonTextStyle: theme.textTheme.titleLarge!,
          onPressed: () {
            _submitFormData(); // Call function to submit form data
          },
        ),
      ],
    );
  }

  // Function to submit form data to Firestore
  void _submitFormData() {
    // Prepare the data to be sent
    Map<String, dynamic> formData = {
      'lender_name': nameController.text,
      'total_amount': amountController.text,
      'tenure': tenureValueOneController.text,
      'start_date': startDateController.text,
      'end_date': endDateController.text,
      'interest_rate': interestRateController.text,
    };

    // Add the data to the "lenders" collection in Firestore
    _firestore.collection('lenders_condition').add(formData).then((_) {
      print("Data sent successfully");
      // Clear the text fields after successful submission
      nameController.clear();
      amountController.clear();
      tenureValueOneController.clear();
      startDateController.clear();
      endDateController.clear();
      interestRateController.clear();
    }).catchError((error) {
      // Handle any errors that occurred during the submission
      print('Error submitting form data: $error');
    });
  }
}
