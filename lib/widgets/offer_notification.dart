import 'package:flutter/material.dart';

class OfferNotification extends StatelessWidget {
  final String title;
  final String message;

  OfferNotification({required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      color: Colors.amber[100],
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
        trailing: Icon(Icons.notifications, color: Colors.orange),
      ),
    );
  }
}
