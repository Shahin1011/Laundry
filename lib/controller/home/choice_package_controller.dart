import 'dart:ui';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:laundry/utils/app_colors.dart';
import 'dart:convert';
import '../../model/choice_package_model.dart';
import '../../utils/app_contants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../view/home/choice_package_screen.dart';

class ChoicePackageController extends GetxController {
  RxBool isLoading = true.obs;
  var errorMessage = ''.obs;
  RxList<PackageData> packages = <PackageData>[].obs;

  // For selected bag
  var selectedBag = Rxn<BagOption>();

  final String packageUrl = "${AppConstants.BASE_URL}/api/packages";
  @override
  void onInit() {
    fetchPackages();
    super.onInit();
  }



  void selectBag(BagOption bag) {
    selectedBag.value = bag;
    print("Selected Bag => ${bag.name}, Price => ${bag.price}, Qty => ${bag.quantity.value}");
  }
  bool validateSelection() {
    if (selectedBag.value == null) {
      Get.snackbar(
        "No Bag Selected",
        "Please select a bag before continuing.",
        backgroundColor: Color(0xFFFF5656),
        colorText: AppColors.white,
      );
      return false;
    }
    return true;
  }


  Future<void> fetchPackages() async {
    if (!await hasInternetConnection()) {
      Get.snackbar("No Internet", "Please check your connection.");
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse(packageUrl),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        ChoicePackageModel model = ChoicePackageModel.fromJson(jsonData);
        packages.value = model.data ?? [];

      } else {
        errorMessage.value = "Failed: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }



  Future<bool> hasInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
