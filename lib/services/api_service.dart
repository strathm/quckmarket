import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/item.dart';
import '../models/shop.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<Item>> fetchItems(String query) async {
    final response = await http.get(Uri.parse('$baseUrl/items?query=$query'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Item.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<List<Shop>> fetchShops() async {
    final response = await http.get(Uri.parse('$baseUrl/shops'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Shop.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load shops');
    }
  }

  Future<Item> fetchItemDetails(String itemId) async {
    final response = await http.get(Uri.parse('$baseUrl/items/$itemId'));

    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load item details');
    }
  }
}
