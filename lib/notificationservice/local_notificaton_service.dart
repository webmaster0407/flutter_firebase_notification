import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationPlugin = FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    // initializationSetting for Android
    const InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    );

    _notificationPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? id) async {
        print("onSelectNotification");
        if (id!.isNotEmpty) {
          print("Router Value1234 $id");
        }
      }
    );
  }

  static void createanddisplaynotificaition(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "xxx", 
          "xxxchannel",
          importance: Importance.max,
          priority: Priority.high,
        ),
      );

      await _notificationPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        payload: message.data['_id'],
      );
    } on Exception catch (e) {
      print(e);
    }
  }
}