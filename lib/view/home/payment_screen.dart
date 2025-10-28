import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String? selectedMethod; // 'stripe' or 'cash'

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
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Payment',
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
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

            // Progress Indicator
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              color: Colors.white,
              child: Row(
                children: [
                  _buildProgressStep('Information', 1, isCompleted: true),
                  _buildProgressLine(true),
                  _buildProgressStep('date & time', 2, isCompleted: true),
                  _buildProgressLine(true),
                  _buildProgressStep('Payment', 3, isActive: true),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Booking Summary:',
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1F1D1D),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    _buildSummaryCard(),

                    SizedBox(height: 24.h),

                    Text(
                      'Payment Method',
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF1F1D1D),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    _buildPaymentOption(
                      title: 'Payment Stripe',
                      icon: Icons.credit_card,
                      value: 'stripe',
                    ),
                    SizedBox(height: 12.h),
                    _buildPaymentOption(
                      title: 'Hand Cash',
                      icon: Icons.payments_outlined,
                      value: 'cash',
                    ),

                    SizedBox(height: 24.h),

                    GestureDetector(
                      onTap: () {
                        if (selectedMethod == 'cash') {
                          Navigator.of(context).pushNamed('/success_screen');
                        } else if (selectedMethod == 'stripe') {
                          Navigator.of(context).pushNamed('/stripe_payment_screen');
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        decoration: BoxDecoration(
                          color: AppColors.mainAppColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            'Continue',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: const Color(0xFFE5E5E5)),
      ),
      child: Column(
        children: [
          _summaryRow('Price per bag', '\$35'),
          SizedBox(height: 20.h),
          _summaryRow('Number of bag', '1'),
          SizedBox(height: 20.h),
          _summaryRow('Service fee', '\$2.00'),
          SizedBox(height: 20.h),
          const Divider(height: 1, color: Color(0xFFE5E5E5)),
          SizedBox(height: 20.h),
          _summaryRow('Total Payable', '\$37.00', isBold: true),
        ],
      ),
    );
  }

  Widget _summaryRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
            color: const Color(0xFF1F1D1D),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w600,
            color: const Color(0xFF1F1D1D),
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption({
    required String title,
    required IconData icon,
    required String value,
  }) {
    final bool selected = selectedMethod == value;
    return GestureDetector(
      onTap: () => setState(() => selectedMethod = value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: const Color(0xFFE5E5E5)),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.mainAppColor, size: 22.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF1F1D1D),
                ),
              ),
            ),
            Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: selected ? AppColors.mainAppColor : const Color(0xFFBDBDBD), width: 2),
                color: Colors.white,
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStep(String label, int step, {bool isActive = false, bool isCompleted = false}) {
    Color circleColor = isActive ? AppColors.mainAppColor : const Color(0xFFE5E5E5);
    Color textColor = isActive ? AppColors.mainAppColor : (isCompleted ? const Color(0xFF1F1D1D) : const Color(0xFF757575));
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 28.w,
            height: 28.h,
            decoration: BoxDecoration(color: circleColor, shape: BoxShape.circle),
            child: Center(
              child: Text(
                '$step',
                style: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w600, color: isActive ? Colors.white : const Color(0xFF757575)),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 10.sp, fontWeight: FontWeight.w400, color: textColor),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressLine(bool isActive) {
    return Expanded(
      child: Container(
        height: 2.h,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        color: isActive ? AppColors.mainAppColor : const Color(0xFFE5E5E5),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  const _BottomNavItem({required this.icon, required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
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


