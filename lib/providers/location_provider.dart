// lib/providers/location_provider.dart

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart'; // For geolocation services

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;

  Position? get currentPosition => _currentPosition;

  Future<void> updateLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    notifyListeners();
  }

  void setCurrentPosition(Position position) {
    _currentPosition = position;
    notifyListeners();
  }
}
