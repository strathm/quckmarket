import 'package:flutter/material.dart';
import '../models/offer.dart';
import '../services/api_service.dart';
import '../widgets/offer_notification.dart';

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  final ApiService _apiService = ApiService('https://api.quickmarket.com');
  List<Offer> _offers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchOffers();
  }

  Future<void> _fetchOffers() async {
    try {
      final offers = await _apiService.fetchOffers();
      setState(() {
        _offers = offers;
      });
    } catch (e) {
      // Handle errors
      print('Error fetching offers: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Current Offers'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _offers.length,
              itemBuilder: (context, index) {
                final offer = _offers[index];
                return OfferNotification(
                  title: offer.title,
                  message: offer.description,
                );
              },
            ),
    );
  }
}
