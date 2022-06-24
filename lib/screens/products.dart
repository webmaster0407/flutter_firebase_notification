import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:xxx/screens/edit_product.dart';

class Products extends StatefulWidget {

  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // This method call when app in termiated state and you get a notification
    // when you click on notification app open from terminated state and you can get notification data in this method
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New notification");
        }
      }
    );

    // This method only call when app in foreground it means app must opend
    FirebaseMessaging.onMessage.listen(
      (message) { 
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.deta11 ${message.data}");
        }
      }
    );

    // This method only call when app in backgorund and not terminated (not closed) 
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpendApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add, size: 30.0,), 
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditProduct()));
          }),
        ],
      ),
    );
  }
}