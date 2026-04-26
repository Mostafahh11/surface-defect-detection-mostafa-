import 'package:defectscan/Api/api.dart';
import 'package:defectscan/Model/historymodel.dart';
import 'package:defectscan/Model/recent_activity_model.dart';
import 'package:get/get.dart';

class DefectCategoryController extends GetxController {
  var history = <Historymodel>[].obs;
  var recentactivity = <RecentActivityModel>[].obs;

  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  Future<void> loadCategories() async {
    loading.value = true;

    final result = await ApiService.getDefectCategories();
    history.value = result;
    final result2 = await ApiService.getrecentactivity();
    recentactivity.value = result2;

    loading.value = false;
  }
}
