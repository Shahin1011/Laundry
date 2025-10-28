import 'package:flutter/material.dart';
import '../../controller/profile/edit_profile_controller.dart';
import '../../utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



class EditProfileScreen extends StatefulWidget{
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final EditProfile _controller = Get.put(EditProfile());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newpPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          /// Header section
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: BoxDecoration(
              color: AppColors.mainAppColor,
            ),
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset(
                    "assets/icons/backIcon.svg",
                    width: 24.w,
                    height: 24.h,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "Edit Profile",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.055),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AppColors.mainAppColor, width: 1.5),
                            ),
                            child: CircleAvatar(
                              radius: 55,
                              backgroundImage: _controller.selectedImageEDT.value != null
                                  ? FileImage(_controller.selectedImageEDT.value!)
                                  : AssetImage("assets/images/profileImg.png") as ImageProvider,
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 2,
                            child: GestureDetector(
                              onTap: (){
                                _controller.pickImage(ImageSource.gallery);
                              },
                              child: SvgPicture.asset("assets/icons/inputImageIcon.svg", width: 28.w, height: 28.h),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                    Text(
                      "Full Name",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2B4237),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      textEditingController: nameController,
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Color(0xFF737373),
                      ),
                      fillColor: Color(0xFF1C5941).withOpacity(0.03),
                      fieldBorderColor: AppColors.mainAppColor,
                    ),
                    SizedBox(height: 16.h),


                    Text(
                      "E-mail address or phone number",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2B4237),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      textEditingController: emailController,
                      hintText: 'E-mail address or phone number',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Color(0xFF737373),
                      ),
                      fillColor: Color(0xFF1C5941).withOpacity(0.03),
                      fieldBorderColor: AppColors.mainAppColor,
                    ),
                    SizedBox(height: 16.h),


                    Text(
                      "Current Password",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2B4237),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      textEditingController: currentPassController,
                      hintText: '********',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Color(0xFF737373),
                      ),
                      isPassword: true,
                      fillColor: Color(0xFF1C5941).withOpacity(0.03),
                      fieldBorderColor: AppColors.mainAppColor,
                    ),
                    SizedBox(height: 16.h),


                    Text(
                      "New Password",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2B4237),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      textEditingController: newpPassController,
                      hintText: '********',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Color(0xFF737373),
                      ),
                      isPassword: true,
                      fillColor: Color(0xFF1C5941).withOpacity(0.03),
                      fieldBorderColor: AppColors.mainAppColor,
                    ),
                    SizedBox(height: 16.h),

                    Text(
                      "Confirm Password",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2B4237),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      textEditingController: confirmPassController,
                      hintText: '********',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: Color(0xFF737373),
                      ),
                      isPassword: true,
                      fillColor: Color(0xFF1C5941).withOpacity(0.03),
                      fieldBorderColor: AppColors.mainAppColor,
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.044),

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
                          "Save Changes",
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFE6E6E6),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),

                    SizedBox(height: 100,),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

