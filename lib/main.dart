// lib/main.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Updated for compatibility
import 'package:quickmarket/providers/user_provider.dart';
import 'package:quickmarket/providers/offers_provider.dart';
import 'package:quickmarket/providers/cart_provider.dart';
import 'package:quickmarket/providers/location_provider.dart';
import 'package:quickmarket/providers/notifications_provider.dart';
import 'package:quickmarket/screens/login_screen.dart';
import 'package:quickmarket/screens/offers_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => OffersProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => NotificationsProvider()),
      ],
      child: MaterialApp(
        title: 'QuickMarket',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(), // Or any starting screen of your choice
        routes: {
          '/offers': (context) => OffersScreen(),
        },
      ),
    );
  }
}
