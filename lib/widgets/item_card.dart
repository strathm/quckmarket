import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  ItemCard({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('Price: \$${item.price.toStringAsFixed(2)}\nDiscount: ${item.discount}%'),
        trailing: item.availability
            ? Icon(Icons.check_circle, color: Colors.green)
            : Icon(Icons.cancel, color: Colors.red),
        onTap: onTap,
      ),
    );
  }
}
