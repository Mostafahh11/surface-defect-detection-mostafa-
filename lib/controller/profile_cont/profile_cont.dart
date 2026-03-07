import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileCont extends GetxController {
  final ImagePicker picker = ImagePicker();

  // بيانات المستخدم
  String name = '';
  String email = '';
  int phone = 0;
  String address = '';

  Rxn<XFile> selectedImage = Rxn<XFile>();

  /// اختيار صورة من Gallery
  Future<void> pickImageFromGallery() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );
    if (image != null) {
      selectedImage.value = image;    
    }
  }

  Future<void> takePhoto() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );
    if (image != null) {
      selectedImage.value = image; // تحفظ هنا أيضًا
    }
  }

  /// مسح الصورة الحالية (اختياري)
  void removeImage() {
    selectedImage.value = null;
  }
}