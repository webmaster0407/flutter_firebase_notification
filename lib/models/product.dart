class Product {
  final String productId;
  final String name;
  final double price;

  Product({required this.productId, required this.price, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'productId' : productId,
      'name' : name,
      'price' : price,
    };
  }

  Product.fromFirestore(Map<String, dynamic> firestore) 
    : productId = firestore['productId'], 
      name = firestore['name'],
      price = firestore['price'];
      
}