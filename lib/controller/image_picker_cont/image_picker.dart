import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MediaController extends GetxController {
  final ImagePicker picker = ImagePicker();

  /// الصورة المفردة المختارة
  Rxn<XFile> selectedImage = Rxn<XFile>();

  /// الفيديو المختار
  Rxn<XFile> selectedVideo = Rxn<XFile>();

  /// قائمة الصور المتعددة
  RxList<XFile> galleryImages = <XFile>[].obs;

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

  /// التقاط صورة بالكاميرا
  Future<void> takePhoto() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 70,
    );
    if (image != null) {
      selectedImage.value = image;
    }
  }

  /// التقاط فيديو بالكاميرا
  Future<void> takeVideo() async {
    final XFile? video = await picker.pickVideo(
      source: ImageSource.camera,
    );
    if (video != null) {
      selectedVideo.value = video;
    }
  }

  /// اختيار صور متعددة من Gallery
  Future<void> pickMultipleImages() async {
    final List<XFile> images = await picker.pickMultiImage(
      imageQuality: 70,
    );
    if (images.isNotEmpty) {
      galleryImages.addAll(images); // يحفظ القديم والجديد
    }
  }

  /// حذف صورة من list
  void removeImage(int index) {
    galleryImages.removeAt(index);
  }

  /// مسح كل الصور والفيديو
  void clearAll() {
    selectedImage.value = null;
    selectedVideo.value = null;
    galleryImages.clear();
  }
}