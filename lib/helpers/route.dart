import 'package:get/get.dart';
import '../view/auth/forgot_password_screen.dart';
import '../view/auth/login_screen.dart';
import '../view/auth/otp_screen.dart';
import '../view/auth/sign_up_screen.dart';
import '../view/home/home_screen.dart';
import '../view/myOrder/myOreder_screen.dart';
import '../view/profile/profile_screen.dart';
import '../view/splash/location_screen.dart';
import '../view/splash/onboarding_screen.dart';
import '../view/splash/splash_screen.dart';




class AppRoutes {

  static const String splashScreen = "/splash_screen";
  static const String onboardingScreen = "/onboarding_screen";
  static const String locationScreen = "/location_screen";
  static const String loginScreen = "/login_screen";
  static const String forgotPasswordScreen = "/forgot_password_screen";
  static const String oTPScreen = "/otp_screen";
  static const String signUPScreen = "/sign_up_screen";
  static const String homeScreen = "/home_screen";
  static const String myOrderScreen = "/myOreder_screen";
  static const String profileScreen = "/profile_screen";


  static List<GetPage> routes = [

    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: locationScreen, page: () => LocationScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: forgotPasswordScreen, page: () => ForgotPasswordScreen()),
    GetPage(name: oTPScreen, page: () => OTPScreen()),
    GetPage(name: signUPScreen, page: () => SignUPScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: myOrderScreen, page: () => MyOrderScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen()),


  ];
}