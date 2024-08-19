import 'package:flutter/material.dart';
import '../models/shop.dart';

class ShopDetailsScreen extends StatelessWidget {
  final Shop shop;

  ShopDetailsScreen({required this.shop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location: ${shop.location}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Contact Info: ${shop.contactInfo}', style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 16.0),
            Text('Available Items:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            // Display a list of items available in this shop (this will need to be fetched and displayed)
          ],
        ),
      ),
    );
  }
}
