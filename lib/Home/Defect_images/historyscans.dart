import 'package:defectscan/controller/Detection_Cont/history_cont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  // نقوم بتعريف الـ Controller هنا
  final HistoryController controller = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'History',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Obx(() {
        // 1. حالة التحميل
        if (controller.isLoading.value) {
          return const Center(child: CircularIndicator());
        }

        // 2. حالة الخطأ
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        // 3. حالة القائمة الفارغة
        if (controller.historyList.isEmpty) {
          return const Center(child: Text('Empty'));
        }

        // 4. القائمة الرئيسية مع ميزة السحب للتحديث
        return RefreshIndicator(
          onRefresh: controller.fetchHistory,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: controller.historyList.length,
            itemBuilder: (context, index) {
              final item = controller.historyList[index];
              return _buildHistoryCard(item);
            },
          ),
        );
      }),
    );
  }

  // تصميم الـ Card الخاص بكل عملية فحص
  Widget _buildHistoryCard(Map<String, dynamic> item) {
    final defectType = item['defect_type'] ?? 'unkown';
    final confidence = item['confidence'] ?? 0;
    final date = item['created_at']?.toString().substring(0, 10) ?? '';

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: confidence > 50
                    ? Colors.red.shade50
                    : Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                confidence > 50
                    ? Icons.warning_amber_rounded
                    : Icons.check_circle_outline,
                color: confidence > 50 ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    defectType,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Accuracy $confidence%',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            Text(
              date,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget بسيط لعملية التحميل
class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});
  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}
