import 'package:get/get.dart';
import 'package:defectscan/Api/api.dart'; // تأكد من المسار الصحيح للـ ApiService

class HistoryController extends GetxController {
  final isLoading = true.obs;
  final historyList = <Map<String, dynamic>>[].obs;
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHistory();
  }

  Future<void> fetchHistory() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      // استدعاء الـ API من الـ ApiService الذي قمت بتصميمه سابقاً
      final data = await ApiService.getScans();

      if (data.isNotEmpty) {
        historyList.assignAll(List<Map<String, dynamic>>.from(data));
      } else {
        historyList.clear();
      }
    } catch (e) {
      errorMessage.value = 'ERROR';
    } finally {
      isLoading.value = false;
    }
  }
}
