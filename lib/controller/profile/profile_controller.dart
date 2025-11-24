import 'dart:convert';
import 'package:get/get.dart';
import 'package:laundry/helpers/route.dart';
import '../../model/profile_model.dart';
import '../../utils/app_contants.dart';
import '../../utils/token_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var profile = Rxn<ProfileModel>();

  final String profileUrl = "${AppConstants.BASE_URL}/api/user/profile";

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  Future<bool> hasInternetConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<void> fetchProfile() async {
    if (!await hasInternetConnection()) {
      Get.snackbar("No Internet", "Please check your internet connection.");
      return;
    }

    final token = await TokenService().getToken();
    if (token == null || token.isEmpty) {
      errorMessage.value = "No authentication token";
      return;
    }

    isLoading.value = true;

    try {
      final response = await http.get(
        Uri.parse(profileUrl),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode != 200) {
        Get.snackbar("Error", "Failed to load: ${response.statusCode}");
        return;
      }

      final jsonData = json.decode(response.body);

      final data = jsonData["data"];

      profile.value = ProfileModel.fromJson(data);

    } catch (e) {
      errorMessage.value = "Failed: $e";
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    await TokenService().clearToken();
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
