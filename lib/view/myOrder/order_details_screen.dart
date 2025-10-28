import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Header Section
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset(
                    "assets/icons/backIcon.svg",
                    width: 24.w,
                    height: 24.h,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "My Order Details",
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

          // 🔹 Body Section
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C7C7C),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "MD Shahin Alam",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3D3D3D),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                  Text(
                    "Phone",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C7C7C),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "+00987654321",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3D3D3D),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                  Text(
                    "Email",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C7C7C),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "mdrokey742@gmail.com",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3D3D3D),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),


                  Text(
                    "Order ID",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C7C7C),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "G987654321",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3D3D3D),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),


                  Text(
                    "Pick-up Date And Time",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C7C7C),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "30/12/2025",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3D3D3D),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),


                  Text(
                    "Drop-off Date and time",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C7C7C),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "31/12/2025",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3D3D3D),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                  Text(
                    "Address Line",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF7C7C7C),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "GP-G,125",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF3D3D3D),
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "City",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF7C7C7C),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "Manhattan",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF3D3D3D),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "State",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF7C7C7C),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "NYC",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF3D3D3D),
                            ),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ZIP",
                            style: GoogleFonts.inter(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF7C7C7C),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "03483",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF3D3D3D),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                  Divider(
                    thickness: 1.5,
                    color: Color(0xFFDCDCDC),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Color(0xFFC8CACC))
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price per bag",
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF101828),
                              ),
                            ),

                            Text(
                              "\$35",
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF2B2B2B),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Number of bag",
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF101828),
                              ),
                            ),

                            Text(
                              "1",
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF2B2B2B),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Service fee",
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF101828),
                              ),
                            ),

                            Text(
                              "+\$35",
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF2B2B2B),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Divider(
                          thickness: 1.5,
                          color: Color(0xFFDCDCDC),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Payable",
                              style: GoogleFonts.inter(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF101828),
                              ),
                            ),

                            Text(
                              "\$35.oo",
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF2B2B2B),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.040),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
