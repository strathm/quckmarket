import 'package:flutter/material.dart';
import 'package:quickmarket/widgets/item_card.dart';
import 'package:quickmarket/widgets/shop_card.dart';
import '../models/item.dart';
import '../models/shop.dart';
import '../services/api_service.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ApiService _apiService = ApiService('https://api.quickmarket.com');
  List<Item> _items = [];
  List<Shop> _shops = [];

  void _search() async {
    final query = _searchController.text;
    if (query.isEmpty) return;
    final items = await _apiService.fetchItems(query);
    final shops = await _apiService.fetchShops(); // You might want to filter shops based on query

    setState(() {
      _items = items;
      _shops = shops;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          SearchBar(
            controller: _searchController,
            onSearch: _search,
          ),
          Expanded(
            child: ListView(
              children: [
                Text('Items', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                ..._items.map((item) => ItemCard(
                  item: item,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailsScreen(item: item),
                      ),
                    );
                  },
                )),
                SizedBox(height: 16.0),
                Text('Shops', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                ..._shops.map((shop) => ShopCard(
                  shop: shop,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShopDetailsScreen(shop: shop),
                      ),
                    );
                  },
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
