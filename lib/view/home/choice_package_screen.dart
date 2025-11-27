import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../controller/home/choice_package_controller.dart';
import '../../utils/app_colors.dart';
import '../../helpers/route.dart';

class ChoicePackageScreen extends StatelessWidget {
  ChoicePackageScreen({super.key});

  final ChoicePackageController c = Get.put(ChoicePackageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Obx(() {
        if (c.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (c.errorMessage.isNotEmpty) {
          return Center(child: Text(c.errorMessage.value));
        }

        // Ensure packages exist
        if (c.packages.isEmpty) {
          return const Center(child: Text("No packages available"));
        }

        // Prepare bag options using API prices
        final package = c.packages[0]; // assuming first package
        final bags = [
          BagOption(
              name: "Small",
              weight: "5 kg",
              price: package.prices?.small ?? 0,
              quantity: 1),
          BagOption(
              name: "Medium",
              weight: "10 kg",
              price: package.prices?.medium ?? 0,
              quantity: 1),
          BagOption(
              name: "Large",
              weight: "15 kg",
              price: package.prices?.large ?? 0,
              quantity: 1),
        ];

        return Column(
          children: [
            // Header
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              color: AppColors.mainAppColor,
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 25.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      "assets/icons/backIcon.svg",
                      width: 24.w,
                      height: 24.h,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Choice Package',
                    style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(),
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Choose Your Bag',
                        style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF333333)),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Bag Options
                    ...bags.asMap().entries.map((entry) {
                      int index = entry.key;
                      BagOption bag = entry.value;
                      return _buildBagItem(bag);
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
                                  color: Colors.white),
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
          ],
        );
      }),
    );
  }

  Widget _buildBagItem(BagOption bag) {
    return Obx(() {
      bool isSelected = c.selectedBag.value?.name == bag.name;

      return GestureDetector(
        onTap: () => c.selectBag(bag),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
                color: isSelected ? AppColors.mainAppColor : Color(0xFFE5E5E5),
                width: 1),
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
                child: Image.asset('assets/images/bag.png', fit: BoxFit.contain),
              ),
              SizedBox(width: 16.w),
              // Bag Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bag.name,
                        style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F1D1D))),
                    SizedBox(height: 4.h),
                    Text(bag.weight,
                        style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF757575))),
                  ],
                ),
              ),
              // Quantity Selector
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE5E5E5)),
                    borderRadius: BorderRadius.circular(8.r)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (bag.quantity.value > 1) bag.quantity.value--;
                      },
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        alignment: Alignment.center,
                        child: Icon(Icons.remove,
                            size: 18.sp,
                            color: bag.quantity.value > 1
                                ? Color(0xFF1F1D1D)
                                : Color(0xFFC8CACC)),
                      ),
                    ),
                    Container(
                      width: 40.w,
                      alignment: Alignment.center,
                      child: Obx(() => Text('${bag.quantity.value}',
                          style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F1D1D)))),
                    ),
                    GestureDetector(
                      onTap: () => bag.quantity.value++,
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        alignment: Alignment.center,
                        child: Icon(Icons.add,
                            size: 18.sp, color: Color(0xFF1F1D1D)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              // Price
              Obx(() => Text('\$${bag.price * bag.quantity.value}',
                  style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1F1D1D)))),
            ],
          ),
        ),
      );
    });
  }

}

class BagOption {
  String name;
  String weight;
  int price;
  RxInt quantity;

  BagOption({
    required this.name,
    required this.weight,
    required this.price,
    int? quantity,
  }) : quantity = (quantity ?? 1).obs;
}

