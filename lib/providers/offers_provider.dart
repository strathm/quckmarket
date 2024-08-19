// lib/providers/offers_provider.dart

import 'package:flutter/material.dart';
import 'package:quickmarket/models/offer.dart'; // Update according to your models

class OffersProvider with ChangeNotifier {
  List<Offer> _offers = [];

  List<Offer> get offers => _offers;

  void addOffer(Offer offer) {
    _offers.add(offer);
    notifyListeners();
  }

  void removeOffer(Offer offer) {
    _offers.remove(offer);
    notifyListeners();
  }

  void updateOffers(List<Offer> newOffers) {
    _offers = newOffers;
    notifyListeners();
  }
}
