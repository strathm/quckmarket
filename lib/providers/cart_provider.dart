// lib/providers/cart_provider.dart

import 'package:flutter/material.dart';
import 'package:quickmarket/models/item.dart'; // Update according to your models

class CartProvider with ChangeNotifier {
  List<Item> _cartItems = [];

  List<Item> get cartItems => _cartItems;

  void addItem(Item item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
