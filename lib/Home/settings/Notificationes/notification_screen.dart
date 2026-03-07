import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool general = true;
  bool sound = false;
  bool vibrate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text("General Notification"),
            value: general,
            onChanged: (v) => setState(() => general = v),
          ),
          SwitchListTile(
            title: const Text("Sound"),
            value: sound,
            onChanged: (v) => setState(() => sound = v),
          ),
          SwitchListTile(
            title: const Text("Vibrate"),
            value: vibrate,
            onChanged: (v) => setState(() => vibrate = v),
          ),
        ],
      ),
    );
  }
}
