import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NotificationPopupRoute extends PopupRoute {
  final String message;
  final VoidCallback onViewAll;

  NotificationPopupRoute({required this.message, required this.onViewAll});

  @override
  Color? get barrierColor => Colors.black.withOpacity(0.05); 

  @override
  bool get barrierDismissible => true; // لو داس بره يقفل

  @override
  String? get barrierLabel => "NotificationPopup";

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200); 

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 55, 
              right: 16, 
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
                child: Container(
                  width: 280,
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                          height: 1.3,
                          decoration: TextDecoration.none, // لمنع الخطوط الصفراء تحت الكلام
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // زرار See all notifications
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () {
                            Get.back(); 
                            onViewAll(); 
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            "See all notifications",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}