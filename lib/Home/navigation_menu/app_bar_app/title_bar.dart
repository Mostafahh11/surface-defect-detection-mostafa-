import 'package:defectscan/profile/profile_page/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Titlebar extends StatelessWidget {
  const Titlebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              5,
              (e) => Icon(
                Icons.star_border_purple500_rounded,
                size: 20,
                color: Colors.amber,
              ),
            ),
            const SizedBox(width: 30),
            Text(
              'STEEL SCAN',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        Row(
          children: [
            InkWell(
              onTap: () {},
              child: Stack(
                alignment: AlignmentGeometry.topRight,
                children: [
                  _dotcontainer(Colors.red, "10"),
                  const Icon(Icons.notifications_none_outlined),
                ],
              ),
            ),
            const SizedBox(width: 15),
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 22,
              child: IconButton(
                icon: Icon(Icons.person, color: Colors.grey),
                onPressed: () {
                  Get.to(() => MyProfileScreen());
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _dotcontainer(Color color, String? text) {
  return Container(
    width: 13,
    height: 13,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      color: color,
    ),
    child: Text(text!),
  );
}
