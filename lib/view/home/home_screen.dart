import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../helpers/route.dart';
import 'widgets/home_header_widget.dart';
import 'widgets/laundry_service_card.dart';
import 'widgets/recent_order_card.dart';
import 'widgets/bottom_nav_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          // Header
          HomeHeaderWidget(),
          
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Laundry Service Card
                  LaundryServiceCard(),
                  
                  SizedBox(height: 32.h),
                  
                  // Recent Order Title
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Recent order',
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F1D1D),
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 16.h),
                  
                  // Recent Order Card
                  RecentOrderCard(),
                  
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
