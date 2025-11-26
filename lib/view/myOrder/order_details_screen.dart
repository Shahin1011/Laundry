import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/order/order_details_controller.dart';
import '../../utils/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';


class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
  OrderDetailsScreen({super.key, required this.orderId});

  final OrderDetailsController c = Get.put(OrderDetailsController());
  final int serviceFee = 3;
  @override
  Widget build(BuildContext context) {
    // Fetch order details on screen open
    c.fetchOrderDetails(orderId);

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

          // Body Section
          Expanded(
            child: Obx(() {
              if (c.isLoading.value) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade300,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 20.h, width: 150.w, color: Colors.white),
                        SizedBox(height: 20.h),
                        Container(height: 20.h, width: double.infinity, color: Colors.white),
                        SizedBox(height: 20.h),
                        Container(height: 20.h, width: double.infinity, color: Colors.white),
                        SizedBox(height: 20.h),
                        Container(height: 20.h, width: double.infinity, color: Colors.white),
                        Container(height: 20.h, width: double.infinity, color: Colors.white),
                        SizedBox(height: 20.h),
                        Container(height: 20.h, width: double.infinity, color: Colors.white),
                        Container(height: 20.h, width: double.infinity, color: Colors.white),
                        SizedBox(height: 20.h),
                        Container(height: 20.h, width: double.infinity, color: Colors.white),
                        Container(height: 20.h, width: double.infinity, color: Colors.white),
                        SizedBox(height: 20.h),
                        Container(height: 20.h, width: double.infinity, color: Colors.white),
                        Container(height: 20.h, width: double.infinity, color: Colors.white),
                        SizedBox(height: 20.h),
                        Container(height: 20.h, width: double.infinity, color: Colors.white),
                      ],
                    ),
                  ),
                );
              }

              if (c.errorMessage.isNotEmpty) {
                return Center(child: Text(c.errorMessage.value));
              }

              final order = c.orderDetails.value?.data?.order;
              final customer = c.orderDetails.value?.data?.customerProfile;

              if (order == null || customer == null) {
                return const Center(child: Text("Order details not found"));
              }

              return SingleChildScrollView(
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
                      "${customer.name}",
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
                      customer.phone ?? 'Not given',
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
                      customer.email ?? 'N/A',
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
                      "${order.orderId}",
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
                      _formatDate(order.pickupDate),
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
                      _formatDate(order.dropoffDate),
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF3D3D3D),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.030),

                    Text(
                      "Address",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF7C7C7C),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "${order.address?.street}",
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
                              "${order.address?.city}",
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
                              "${order.address?.state}",
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
                              "${order.address?.zipCode}",
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
                          ...?order.items?.map((item) => Column(
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
                                    "\$${item.price}",
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF2B2B2B),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
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
                                    "${item.quantity}",
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF2B2B2B),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h),
                            ],
                          )),

                          // Service fee
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
                                "+\$$serviceFee",
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
                                "\$${(order.total ?? 0) + serviceFee}",
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
              );
            }),
          ),

        ],
      ),
    );

  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return "";
    final date = DateTime.tryParse(dateStr);
    if (date == null) return "";
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
