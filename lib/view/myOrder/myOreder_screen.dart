import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry/view/myOrder/widgets/my_order_card.dart';
import '../../controller/order/orders_controller.dart';
import '../../utils/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';


class MyOrderScreen extends StatelessWidget {
  final OrdersController c = Get.put(OrdersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.13,
            decoration: BoxDecoration(color: AppColors.mainAppColor),
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
          Expanded(
            child: Obx(() {
              if (c.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              if (c.errorMessage.isNotEmpty) {
                return Center(child: Text(c.errorMessage.value));
              }

              if (c.orders.isEmpty) {
                return Center(child: Text("No orders found"));
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
                itemCount: c.orders.length,
                itemBuilder: (context, index) {
                  final order = c.orders[index];
                  return MyOrderCard(
                    updatedDate: DateFormat('yyyy-MM-dd').format(order.updatedAt ?? DateTime.now()),
                    price: order.total.toString(),
                    status: order.status ?? "",
                    orderId: order.id ?? "",
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

