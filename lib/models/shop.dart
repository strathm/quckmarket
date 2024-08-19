class Shop {
  final String id;
  final String name;
  final String location;
  final String contactInfo;
  final List<String> itemIds; // List of item IDs available in the shop

  Shop({
    required this.id,
    required this.name,
    required this.location,
    required this.contactInfo,
    required this.itemIds,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      contactInfo: json['contact_info'],
      itemIds: List<String>.from(json['item_ids']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'contact_info': contactInfo,
      'item_ids': itemIds,
    };
  }
}
