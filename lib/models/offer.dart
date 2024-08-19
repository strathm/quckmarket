// lib/models/offer.dart

import 'package:flutter/foundation.dart';

class Offer {
  final String id;
  final String title;
  final String description;
  final double price;
  final DateTime expiryDate;

  Offer({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.expiryDate,
  });
}
