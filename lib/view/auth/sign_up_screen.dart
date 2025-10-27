import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_icons.dart';
import '../components/custom_text_field.dart';

class SignUPScreen extends StatefulWidget{
  const SignUPScreen({super.key});

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  bool agree = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassCon = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.11),
              Text(
                "Sign Up",
                style: GoogleFonts.inter(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1F1D1D),
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "It only takes a minute to create your\naccount",
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF595959),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.059),

              CustomTextField(
                textEditingController: nameController,
                hintText: 'Full Name',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: AppColors.subHeadingColor,
                ),
                fillColor: Color(0xFFFFFFFF),
                fieldBorderColor: AppColors.borderColor,
              ),
              SizedBox(height: 12.h),
              CustomTextField(
                textEditingController: passController,
                hintText: 'E-mail address or phone number',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: AppColors.subHeadingColor,
                ),
                fillColor: Color(0xFFFFFFFF),
                fieldBorderColor: AppColors.borderColor,
              ),
              SizedBox(height: 12.h),
              CustomTextField(
                textEditingController: passController,
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: AppColors.subHeadingColor,
                ),
                isPassword: true,
                fillColor: Color(0xFFFFFFFF),
                fieldBorderColor: AppColors.borderColor,
              ),
              SizedBox(height: 12.h),
              CustomTextField(
                textEditingController: confirmPassCon,
                hintText: 'Confirm Password',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: AppColors.subHeadingColor,
                ),
                isPassword: true,
                fillColor: Color(0xFFFFFFFF),
                fieldBorderColor: AppColors.borderColor,
              ),


              SizedBox(height: MediaQuery.of(context).size.height * 0.030),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  decoration: BoxDecoration(
                    color: AppColors.mainAppColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "Login",
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE6E6E6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}