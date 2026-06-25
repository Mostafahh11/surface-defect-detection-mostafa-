import 'package:defectscan/controller/Notification_controller/notification.dart';
import 'package:flutter/material.dart';

class notification_widget extends StatelessWidget {
  const notification_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          NotificationPopupRoute(
            message:
                "AI processing for scan #42 is complete. 1 defect found.",
            onViewAll: () {},
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 2, right: 2),
              child: Icon(
                Icons.notifications_none_outlined,
                size: 26,
                color: Colors.black87,
              ),
            ),
    
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
