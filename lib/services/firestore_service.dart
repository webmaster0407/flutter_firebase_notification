

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xxx/models/product.dart';

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveProduct(Product product) {
    return _db.collection('products')
      .add(product.toMap())
      .then((value) => print("Product Added"))
      .catchError((error) => print("Failed to add product: $error"));
  }

  // Stream<List<Product>> getProducts() {
  //   return _db.collection('products').snapshots().map((snapshot) => snapshot.docs.forEach((element) {

  //   }));
  // }


}