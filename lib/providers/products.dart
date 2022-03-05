import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Buğday Tohumu',
      description: 'Ekilmeye hazır buğday tohumu',
      price: 29.99,
      imageUrl:
      'https://tarfin.com/img/campaigns/huseyinbey.png',
    ),
    Product(
      id: 'p2',
      title: 'Ceviz fidanı',
      description: '40 cm uzunluğunda ceviz fidanı',
      price: 39.90,
      imageUrl:
      'https://st3.myideasoft.com/shop/or/14/myassets/products/526/pr_01_526.jpg?revision=1446495043',
    ),
    Product(
      id: 'p3',
      title: 'Kiraz fidanı',
      description: 'Kırmız ve beyaz olmak üzere iki çeşit fidan mevcuttur.',
      price: 19.99,
      imageUrl:
      'https://www.fidancilar.com/Uploads/UrunResimleri/starksgold-tozlayici-beyaz-kiraz-fidani--34f9.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Arpa tohumu',
      description: 'Ekim ayında ekilmeye hazır arpa tohumu',
      price: 49.99,
      imageUrl:
      'https://iis-akakce.akamaized.net/p.z?%2F%2Fmcdn01%2Egittigidiyor%2Enet%2F69218%2F692185529%5F0%2Ejpg',
    ),

    Product(
      id: 'p5',
      title: 'Salatalık tohumu',
      description: 'Ekim ayında ekilmeye hazır salatalık tohumu',
      price: 49.99,
      imageUrl:
      'https://shop.ekosol.com.tr/Uploads/UrunResimleri/salatalik--cengelkoy-yetistirme-seti-4df3.jpg',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product product) {
    final newProduct = Product(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _items.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      /*print('...');*/
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
