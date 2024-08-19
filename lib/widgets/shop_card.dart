import 'package:flutter/material.dart';
import '../models/shop.dart';

class ShopCard extends StatelessWidget {
  final Shop shop;
  final VoidCallback onTap;

  ShopCard({required this.shop, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(shop.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Location: ${shop.location}'),
        trailing: Icon(Icons.store, color: Colors.blue),
        onTap: onTap,
      ),
    );
  }
}
