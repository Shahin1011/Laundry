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
      body: Column(
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
            child: Obx(() {
              if (c.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (c.errorMessage.isNotEmpty) {
                return Center(child: Text(c.errorMessage.value));
              }

              if (c.packages.isEmpty) {
                return const Center(child: Text("No packages available"));
              }

              // Use the first package (same as your original assumption)
              final package = c.packages[0];
              final pkg = package.bagCategory;

              // Build dynamic list from API (small / medium / large)
              final List<BagOption> allBags = [];

              if (pkg?.small != null && pkg!.small!.isNotEmpty) {
                for (var b in pkg.small!) {
                  allBags.add(BagOption(
                    name: "Small",
                    weight: "${b.kg ?? ''} kg",
                    price: b.price ?? 0,
                    serviceFee: b.serviceFee ?? 0,
                    description: b.description ?? '',
                  ));
                }
              }

              if (pkg?.medium != null && pkg!.medium!.isNotEmpty) {
                for (var b in pkg.medium!) {
                  allBags.add(BagOption(
                    name: "Medium",
                    weight: "${b.kg ?? ''} kg",
                    price: b.price ?? 0,
                    serviceFee: b.serviceFee ?? 0,
                    description: b.description ?? '',
                  ));
                }
              }

              if (pkg?.large != null && pkg!.large!.isNotEmpty) {
                for (var b in pkg.large!) {
                  allBags.add(BagOption(
                    name: "Large",
                    weight: "${b.kg ?? ''} kg",
                    price: b.price ?? 0,
                    serviceFee: b.serviceFee ?? 0,
                    description: b.description ?? '',
                  ));
                }
              }

              return SingleChildScrollView(
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

                    // Bag Options (dynamic)
                    ...allBags.map((bag) => _buildBagItem(context, bag)),

                    SizedBox(height: 24.h),

                    // Continue Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: GestureDetector(
                        onTap: () {
                          if (c.validateSelection()) {
                            Get.toNamed(AppRoutes.informationScreen);
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
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 40.h),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildBagItem(BuildContext context, BagOption bag) {
    final localBag = BagOption(
      name: bag.name,
      weight: bag.weight,
      price: bag.price,
      serviceFee: bag.serviceFee,
      description: bag.description,
    );

    return Obx(() {
      // isSelected compares controller.selected by name+weight
      final selected = c.selectedBag.value;
      final bool isSelected = selected != null && selected.name == localBag.name && selected.weight == localBag.weight;

      return GestureDetector(
        onTap: () {
          if (isSelected) {
            // already selected — but still call select to update reference
            c.selectBag(selected!);
          } else {
            // preserve quantity if same type exists in selected
            if (c.selectedBag.value != null &&
                c.selectedBag.value!.name == localBag.name &&
                c.selectedBag.value!.weight == localBag.weight) {
              // transfer quantity
              localBag.quantity.value = c.selectedBag.value!.quantity.value;
            }
            c.selectBag(localBag);
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: isSelected ? AppColors.mainAppColor : Color(0xFFE5E5E5),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                        Text(
                          localBag.name,
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F1D1D),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          localBag.weight,
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
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (localBag.quantity.value > 1) localBag.quantity.value--;
                          },
                          child: Container(
                            width: 36.w,
                            height: 36.h,
                            alignment: Alignment.center,
                            child: Icon(Icons.remove,
                                size: 18.sp,
                                color: localBag.quantity.value > 1
                                    ? Color(0xFF1F1D1D)
                                    : Color(0xFFC8CACC)),
                          ),
                        ),
                        Container(
                          width: 40.w,
                          alignment: Alignment.center,
                          child: Obx(() => Text('${localBag.quantity.value}',
                              style: GoogleFonts.inter(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1F1D1D)))),
                        ),
                        GestureDetector(
                          onTap: () => localBag.quantity.value++,
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
                  Obx(() {
                    // Show price for controller selected bag if it's this one (so total updates when selecting)
                    final selected = c.selectedBag.value;
                    if (selected != null &&
                        selected.name == localBag.name &&
                        selected.weight == localBag.weight) {
                      return Text(
                        '\$${selected.totalPrice}',
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F1D1D),
                        ),
                      );
                    }

                    // otherwise show local bag price
                    return Text(
                      '\$${localBag.totalPrice}',
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F1D1D),
                      ),
                    );
                  }),
                ],
              ),

              SizedBox(height: 12.h),

              Text(
                localBag.description,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF757575),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
