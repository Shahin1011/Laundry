import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../helpers/route.dart';

class ChoicePackageScreen extends StatefulWidget {
  const ChoicePackageScreen({super.key});

  @override
  State<ChoicePackageScreen> createState() => _ChoicePackageScreenState();
}

class _ChoicePackageScreenState extends State<ChoicePackageScreen> {
  List<BagOption> bags = [
    BagOption(name: 'Small', weight: '5 kg', price: 35, quantity: 1),
    BagOption(name: 'Medium', weight: '10 kg', price: 45, quantity: 1),
    BagOption(name: 'Large', weight: '15 kg', price: 55, quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        'Choice Package',
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
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    
                    // Title
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Choice Your Bag',
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 16.h),
                    
                    // Bag Options
                    ...bags.asMap().entries.map((entry) {
                      int index = entry.key;
                      BagOption bag = entry.value;
                      return _buildBagItem(bag, index);
                    }),
                    
                    SizedBox(height: 24.h),
                    
                    // Continue Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.informationScreen);
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
                    ),
                    
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
            ),
            
            // Bottom Navigation
            Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: Offset(0, -2),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(icon: Icons.home_outlined, label: 'Home', isActive: false),
                    _buildNavItem(icon: Icons.content_paste_outlined, label: 'My Order', isActive: false),
                    _buildNavItem(icon: Icons.person_outline, label: 'Profile', isActive: false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBagItem(BagOption bag, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h, left: 20.w, right: 20.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Color(0xFFE5E5E5),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Bag Image
          Container(
            width: 60.w,
            height: 60.w,
            decoration: BoxDecoration(
              color: Color(0xFFE8F4F6),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Image.asset(
              'assets/images/bag.png',
              fit: BoxFit.contain,
            ),
          ),
          
          SizedBox(width: 16.w),
          
          // Bag Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bag.name,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1F1D1D),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  bag.weight,
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF757575),
                  ),
                ),
              ],
            ),
          ),
          
          // Quantity Selector
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE5E5E5)),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (bag.quantity > 1) {
                        bag.quantity--;
                      }
                    });
                  },
                  child: Container(
                    width: 36.w,
                    height: 36.h,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.remove,
                      size: 18.sp,
                      color: bag.quantity > 1 ? Color(0xFF1F1D1D) : Color(0xFFC8CACC),
                    ),
                  ),
                ),
                Container(
                  width: 40.w,
                  alignment: Alignment.center,
                  child: Text(
                    '${bag.quantity}',
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F1D1D),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      bag.quantity++;
                    });
                  },
                  child: Container(
                    width: 36.w,
                    height: 36.h,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add,
                      size: 18.sp,
                      color: Color(0xFF1F1D1D),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(width: 16.w),
          
          // Price
          Text(
            '\$${bag.price}',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1F1D1D),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isActive,
  }) {
    final Color color = isActive ? AppColors.mainAppColor : Color(0xFF757575);
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 24.sp),
        SizedBox(height: 4.h),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }
}

class BagOption {
  String name;
  String weight;
  int price;
  int quantity;

  BagOption({
    required this.name,
    required this.weight,
    required this.price,
    required this.quantity,
  });
}
