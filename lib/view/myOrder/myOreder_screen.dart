import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry/view/myOrder/widgets/my_order_card.dart';
import '../../utils/app_colors.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          // 🔹 Header Section
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: BoxDecoration(
              color: AppColors.mainAppColor,
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
            child: Text(
              "My Orders",
              style: GoogleFonts.inter(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),

          // 🔹 Order List (Expanded must be direct child of Column)
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return MyOrderCard(
                    time: "01/09/2025",
                    price: "35",
                    status: index.isEven ? "Completed" : "Pending",
                  );
                },

              ),
            ),
          ),
        ],
      ),
    );
  }
}
