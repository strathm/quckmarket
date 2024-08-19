import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  SearchBar({required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Search for items or shops',
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: onSearch,
          ),
        ),
      ),
    );
  }
}
