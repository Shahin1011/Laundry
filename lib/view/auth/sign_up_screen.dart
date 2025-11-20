import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry/helpers/route.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../utils/app_colors.dart';
import '../components/custom_text_field.dart';



class SignUPScreen extends StatefulWidget {
  const SignUPScreen({super.key});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  bool isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // API endpoint
  final String apiUrl = "https://crafts-duration-prompt-beverage.trycloudflare.com/api/auth/signup";

  Future<void> _createUser() async {
    if (!_formKey.currentState!.validate()) return;

    // Check if passwords match
    if (passController.text != confirmPassCon.text) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "fullName": nameController.text.trim(),
          "emailOrPhone": emailController.text.trim(),
          "password": passController.text,
          "confirmPassword": confirmPassCon.text,
        }),
      );

      setState(() {
        isLoading = false;
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success
        final responseData = json.decode(response.body);
        Get.snackbar(
          'Success',
          'Account created successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Navigate to login screen
        Get.offNamed(AppRoutes.loginScreen);
      } else {
        // Error handling
        final errorData = json.decode(response.body);
        Get.snackbar(
          'Error',
          errorData['message'] ?? 'Failed to create account',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      Get.snackbar(
        'Error',
        'Network error: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter email or phone number';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.11),
                  Text(
                    "Sign Up",
                    style: GoogleFonts.inter(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F1D1D),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "It only takes a minute to create your\naccount",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF595959),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.059),

                  // Full Name Field
                  CustomTextField(
                    textEditingController: nameController,
                    hintText: 'Full Name',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColors.subHeadingColor,
                    ),
                    fillColor: const Color(0xFFFFFFFF),
                    fieldBorderColor: AppColors.borderColor,
                    validator: _validateName,
                  ),
                  SizedBox(height: 12.h),

                  // Email/Phone Field
                  CustomTextField(
                    textEditingController: emailController,
                    hintText: 'E-mail address or phone number',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColors.subHeadingColor,
                    ),
                    fillColor: const Color(0xFFFFFFFF),
                    fieldBorderColor: AppColors.borderColor,
                    validator: _validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 12.h),

                  // Password Field
                  CustomTextField(
                    textEditingController: passController,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColors.subHeadingColor,
                    ),
                    isPassword: true,
                    fillColor: const Color(0xFFFFFFFF),
                    fieldBorderColor: AppColors.borderColor,
                    validator: _validatePassword,
                  ),
                  SizedBox(height: 12.h),

                  // Confirm Password Field
                  CustomTextField(
                    textEditingController: confirmPassCon,
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColors.subHeadingColor,
                    ),
                    isPassword: true,
                    fillColor: const Color(0xFFFFFFFF),
                    fieldBorderColor: AppColors.borderColor,
                    validator: _validateConfirmPassword,
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                  // Sign Up Button
                  GestureDetector(
                    onTap: isLoading ? null : _createUser,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color: AppColors.mainAppColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          isLoading ? "Loading..." : "Sign Up",
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFE6E6E6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassCon.dispose();
    super.dispose();
  }
}