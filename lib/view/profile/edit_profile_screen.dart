import 'package:flutter/material.dart';
import '../../controller/profile/edit_profile_controller.dart';
import '../../model/profile_model.dart';
import '../../utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';



class EditProfileScreen extends StatefulWidget{
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late ProfileModel profile;

  final EditProfile _controller = Get.put(EditProfile());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController currentPassController = TextEditingController();
  final TextEditingController newpPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  void initState() {
    super.initState();
    profile = Get.arguments as ProfileModel;
    // Prefill controllers
    nameController.text = profile.fullname;
    emailController.text = profile.email;

    // Set initial image if needed
    if (profile.profileImage.isNotEmpty) {
      _controller.setInitialImage(profile.profileImage);
    }
  }

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
                          Obx(() {
                            final imageUrl = _controller.userProfileImageUrl.value;
                            final file = _controller.selectedImageEDT.value;

                            return Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.mainAppColor, width: 1.5),
                              ),
                              child: ClipOval(
                                child: SizedBox(
                                  width: 110,
                                  height: 110,
                                  child: file != null
                                  // 🔥 Picked image
                                      ? Image.file(file, fit: BoxFit.cover)

                                  // 🔥 Server image with shimmer (same as profile page)
                                      : CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        width: 110,
                                        height: 110,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) => Image.asset(
                                      "assets/images/emptyUser.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
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
                        fontSize: 14.sp,
                        color: Color(0xFF737373),
                      ),
                      fillColor: Color(0xFF1C5941).withOpacity(0.03),
                      fieldBorderColor: AppColors.mainAppColor,
                    ),
                    SizedBox(height: 16.h),


                    Text(
                      "E-mail address",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2B4237),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      textEditingController: emailController,
                      hintText: 'E-mail address',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Color(0xFF737373),
                      ),
                      readOnly: true,
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
                        fontSize: 14.sp,
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
                        fontSize: 14.sp,
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
                        fontSize: 14.sp,
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

