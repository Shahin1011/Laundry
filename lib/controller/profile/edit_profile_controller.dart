import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends GetxController {

  RxString userProfileImageUrl = ''.obs; // server image
  Rx<File?> selectedImageEDT = Rx<File?>(null); // picked image

  Future pickImage(ImageSource source) async {
    final XFile? pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;

    // Validate extension
    final extension = pickedFile.path.split('.').last.toLowerCase();
    if (!['jpg', 'jpeg', 'png'].contains(extension)) {
      Get.snackbar("Invalid Format", "Only JPG, JPEG, PNG files are allowed.");
      return;
    }

    selectedImageEDT.value = File(pickedFile.path); // reactive update
  }

  void setInitialImage(String url) {
    userProfileImageUrl.value = url;
  }
}
