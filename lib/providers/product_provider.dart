import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:xxx/models/product.dart';
import 'package:xxx/services/firestore_service.dart';


class ProductProvider with ChangeNotifier {

  final firestoreService = FirestoreService();

  late String _name;
  late double _price;
  late String _productId;
  // ignore: prefer_const_constructors
  var uuid = Uuid();

  // Getters
  String get productId => _productId;
  String get name => _name;
  double get price => _price;

  // Setters
  changeName(String value) {
    _name = value;
    notifyListeners();
  }

  changePrice(String value) {
    _price = double.parse(value);
    notifyListeners();
  }

  saveProduct() {
    var newProduct = Product(name: name, price: price, productId: uuid.v4());
    firestoreService.saveProduct(newProduct);
  }
}