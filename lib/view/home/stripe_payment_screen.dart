import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';
import '../../helpers/route.dart';

class StripePaymentScreen extends StatefulWidget {
  const StripePaymentScreen({super.key});

  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  String selectedMethod = 'card'; // card, ideal, bancontact

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              height: 60.h,
              color: AppColors.mainAppColor,
              child: Row(
                children: [
                  SizedBox(width: 16.w),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Choose a Payment Method',
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTabs(),
                    SizedBox(height: 16.h),
                    if (selectedMethod == 'card') _buildCardForm(),
                    if (selectedMethod != 'card') _buildComingSoon(),
                  ],
                ),
              ),
            ),

            // Bottom Navigation
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, -2),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _bottomItem(Icons.home_outlined, 'Home', true),
                    _bottomItem(Icons.content_paste_outlined, 'My Order', false),
                    _bottomItem(Icons.person_outline, 'Profile', false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabs() {
    return Row(
      children: [
        _tab('card', 'Card', Icons.credit_card),
        SizedBox(width: 12.w),
        _tab('ideal', 'iDEAL', Icons.account_balance),
        SizedBox(width: 12.w),
        _tab('bancontact', 'bancontact', Icons.badge_outlined),
      ],
    );
  }

  Widget _tab(String value, String label, IconData icon) {
    final bool active = selectedMethod == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedMethod = value),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: active ? AppColors.mainAppColor : const Color(0xFFE5E5E5), width: 2),
          ),
          child: Column(
            children: [
              Icon(icon, color: active ? AppColors.mainAppColor : const Color(0xFF757575), size: 18.sp),
              SizedBox(height: 6.h),
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: active ? AppColors.mainAppColor : const Color(0xFF757575),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Card number', style: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w600, color: const Color(0xFF1F1D1D))),
        SizedBox(height: 8.h),
        _input(hint: '43 837 8398  787'),
        SizedBox(height: 16.h),
        Text('Expiration Date', style: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w600, color: const Color(0xFF1F1D1D))),
        SizedBox(height: 8.h),
        _input(hint: 'MM/YY'),
        SizedBox(height: 16.h),
        Text('Security Code', style: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w600, color: const Color(0xFF1F1D1D))),
        SizedBox(height: 8.h),
        _input(hint: 'CVC'),
        SizedBox(height: 20.h),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainAppColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
              padding: EdgeInsets.symmetric(vertical: 14.h),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.successScreen);
            },
            child: Text('Confirm', style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildComingSoon() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.r), border: Border.all(color: const Color(0xFFE5E5E5))),
      child: Center(
        child: Text('This method will be available soon', style: GoogleFonts.inter(fontSize: 14.sp, color: const Color(0xFF757575))),
      ),
    );
  }

  Widget _input({required String hint}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w400, color: const Color(0xFFBDBDBD)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: const BorderSide(color: Color(0xFFE5E5E5))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: const BorderSide(color: Color(0xFFE5E5E5))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: BorderSide(color: AppColors.mainAppColor)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      ),
      style: GoogleFonts.inter(fontSize: 16.sp, fontWeight: FontWeight.w500, color: const Color(0xFF1F1D1D)),
      keyboardType: TextInputType.number,
    );
  }

  Widget _bottomItem(IconData icon, String label, bool isActive) {
    final Color color = isActive ? AppColors.mainAppColor : const Color(0xFF757575);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24.sp),
        SizedBox(height: 4.h),
        Text(label, style: GoogleFonts.inter(fontSize: 12.sp, fontWeight: FontWeight.w500, color: color)),
      ],
    );
  }
}


