import 'package:flutter/material.dart';
import '../presentation/android_large_eight_screen/android_large_eight_screen.dart';
import '../presentation/android_large_five_screen/android_large_five_screen.dart';
import '../presentation/android_large_nine_screen/android_large_nine_screen.dart';
import '../presentation/android_large_ten_screen/android_large_ten_screen.dart';
import '../presentation/android_large_two_screen/android_large_two_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/farmer_condition/farmer_condition_screen.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/transaction/transaction.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String androidLargeNineScreen = '/android_large_nine_screen';

  static const String loginScreen = '/login_screen';

  static const String androidLargeTwoScreen = '/android_large_two_screen';

  static const String androidLargeEightScreen = '/android_large_eight_screen';

  static const String androidLargeFiveScreen = '/android_large_five_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String androidLargeTenScreen = '/android_large_ten_screen';
  static const String farmerConditionScreen = '/farmer_condition_screen';
  static const String transaction = '/transaction';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> routes = {
    androidLargeNineScreen: (context) => AndroidLargeNineScreen(),
    loginScreen: (context) => LoginScreen(),
    androidLargeTwoScreen: (context) => AndroidLargeTwoScreen(),
    androidLargeEightScreen: (context) => AndroidLargeEightScreen(),
    androidLargeFiveScreen: (context) => AndroidLargeFiveScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    androidLargeTenScreen:(context) => AndroidLargeTenScreen(),
    farmerConditionScreen: (context) => FarmerConditionsScreen(),
    transaction: (context) => Transaction(),
    initialRoute: (context) => LoginScreen()

  };
}
