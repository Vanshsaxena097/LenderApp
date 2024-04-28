import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vansh_s_application2/presentation/transaction/transaction_modal.dart';
import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../android_large_nine_screen/lendermodal.dart';
// ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class Transaction  extends StatelessWidget {
  Transaction ({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController farmerNameController = TextEditingController();
  TextEditingController yourNameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

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
                  controller: farmerNameController,
                  hintText: "Farmer's Name",
                ),
                SizedBox(height: 10.v),
                _buildTextFormField(
                  controller: yourNameController,
                  hintText: "Your Name",
                ),
                SizedBox(height: 10.v),
                _buildTextFormField(
                  controller: amountController,
                  hintText: "Amount",
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10.v),
                _buildTextFormField(
                  controller: interestController,
                  hintText: "Interest",
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10.v),
                _buildTextFormField(
                  controller: startDateController,
                  hintText: "Start Date",
                ),
                SizedBox(height: 10.v),
                _buildTextFormField(
                  controller: endDateController,
                  hintText: "End Date",
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
            padding: EdgeInsets.only(left: 9.h, top: 11.v, bottom: 7.v, right: 0.v),
            child: Text(
              "TRANSACTION",
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
      final details = LoanRequestModal(
        farmerName: farmerNameController.text,
        yourName: yourNameController.text,
        amount: amountController.text,
        interest: interestController.text,
        startDate: startDateController.text,
        endDate: endDateController.text,
      );

      _saveToCollection(details);

      // Optionally, you can navigate to another screen or show a success message here
    }
  }

  void _saveToCollection(details) {
    // Assuming you're using Firebase Firestore for database operations
    FirebaseFirestore.instance.collection('Transaction_Lender').add({
      'farmerName': details.farmerName,
      'yourName': details.yourName,
      'amount': details.amount,
      'interest': details.interest,
      'startDate': details.startDate,
      'endDate': details.endDate,
    }).then((value) {
      // Data saved successfully
      print("Data saved successfully");
    }).catchError((error) {
      // Error occurred while saving data
      print("Error: $error");
    });
  }
}