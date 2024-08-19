import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Item item;

  ItemDetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: \$${item.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Discount: ${item.discount}%', style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 8.0),
            Text('Availability: ${item.availability ? 'In Stock' : 'Out of Stock'}', style: TextStyle(fontSize: 18.0)),
            SizedBox(height: 16.0),
            Text('Description:', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text(item.description, style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
