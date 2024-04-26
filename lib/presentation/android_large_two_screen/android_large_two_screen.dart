import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:flutter/gestures.dart';
import '../android_large_five_screen/android_large_five_screen.dart';
import '../android_large_two_screen/android_large_two_screen.dart';

class AndroidLargeTwoScreen extends StatelessWidget {
  AndroidLargeTwoScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _signUp(BuildContext context) async {
    try {
      // Check if the email already exists
      QuerySnapshot emailSnapshot = await FirebaseFirestore.instance
          .collection('lenders')
          .where('email', isEqualTo: emailController.text)
          .get();

      if (emailSnapshot.docs.isNotEmpty) {
        // If email exists, show error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email already exists')),
        );
      } else {
        // If email doesn't exist, proceed with sign-up
        await FirebaseFirestore.instance.collection('lenders').add({
          'email': emailController.text,
          'password': passwordController.text,
          'phone': phoneController.text,
        });

        // Navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AndroidLargeFiveScreen()),
        );
      }
    } catch (e) {
      // Handle sign-up errors
      print('Failed to sign up: $e');
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign up')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10.v, horizontal: 31.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome!",
                  style: CustomTextStyles.headlineLargePoppinsOnSecondaryContainer,
                ),
                SizedBox(height: 10.v),
                Text(
                  "Create an account",
                  style: CustomTextStyles.titleLargePoppinsGray500,
                ),
                SizedBox(height: 77.v),
                _buildTextField("Email", emailController, false),
                SizedBox(height: 16.v),
                _buildTextField("Password", passwordController, true),
                SizedBox(height: 16.v),
                _buildTextField("Phone Number", phoneController, false),
                SizedBox(height: 17.v),
                GestureDetector(
                  onTap: () {
                    // Handle forget password action
                    // e.g., navigate to a forgot password screen
                  },
                  child: Text(
                    "Forgot your password?",
                    style: CustomTextStyles.titleSmallPrimary,
                  ),
                ),
                SizedBox(height: 45.v),
                ElevatedButton(
                  onPressed: () {
                    _signUp(context); // Call the _signUp method when button is pressed
                  },
                  child: Text('Sign Up'),
                ),
                SizedBox(height: 16.v),
                _buildRowFlatColor(),
                SizedBox(height: 41.v),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: theme.textTheme.bodyMedium,
                      ),
                      TextSpan(
                        text: "Login",
                        style: CustomTextStyles.titleSmallPrimary_1.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to the login screen
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 410.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgVector,
        margin: EdgeInsets.fromLTRB(43.h, 20.v, 360.h, 20.v),
        onTap: () => onTapVectorone(context),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller, bool obscureText) {
    return Container(
      width: 347.h,
      padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 5.v),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 1.v),
          Text(
            labelText,
            style: theme.textTheme.labelLarge,
          ),
          SizedBox(height: 5.v),
          CustomTextFormField(
            controller: controller,
            hintText: "Type your $labelText",
            textInputAction: TextInputAction.done,
            textInputType: obscureText ? TextInputType.visiblePassword : TextInputType.emailAddress,
            suffix: obscureText
                ? Container(
              margin: EdgeInsets.fromLTRB(30.h, 18.v, 16.h, 18.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgBxbxhide,
                height: 24.adaptSize,
                width: 24.adaptSize,
              ),
            )
                : null,
            suffixConstraints: BoxConstraints(maxHeight: 60.v),
            obscureText: obscureText,
            contentPadding: EdgeInsets.only(left: 16.h, top: 19.v, bottom: 19.v),
          ),
        ],
      ),
    );
  }

  Widget _buildRowFlatColor() {
    return Padding(
      padding: EdgeInsets.only(left: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 56.v,
            width: 135.h,
            padding: EdgeInsets.symmetric(vertical: 16.v),
            decoration: AppDecoration.fillGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgFlatColorIconsGoogle,
              height: 24.adaptSize,
              width: 24.adaptSize,
              alignment: Alignment.center,
            ),
          ),
          Container(
            height: 56.v,
            width: 135.h,
            padding: EdgeInsets.symmetric(vertical: 16.v),
            decoration: AppDecoration.fillGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder8,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgCiApple,
              height: 24.adaptSize,
              width: 24.adaptSize,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }

  void onTapVectorone(BuildContext context) {
    Navigator.pop(context);
  }
}
