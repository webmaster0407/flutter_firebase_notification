// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xxx/providers/product_provider.dart';

class EditProduct extends StatefulWidget {

  const EditProduct({Key? key}) : super(key: key);
  
  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {

    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(hintText: 'Product Name'),
              onChanged: (value) {
                productProvider.changeName(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Product Price'),
              onChanged: (value) {
                productProvider.changePrice(value);
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: const Text('Save'),
              onPressed: () {
                productProvider.saveProduct();
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              child: const Text('Delete'),
              onPressed: () {
      
              }
            ),
          ]
        ),
      ),
    );
  }
}