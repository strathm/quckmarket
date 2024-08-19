class Item {
  final String id;
  final String name;
  final double price;
  final bool availability;
  final String shopId;
  final double discount;
  final String description; // Optional: Detailed description of the item

  Item({
    required this.id,
    required this.name,
    required this.price,
    required this.availability,
    required this.shopId,
    required this.discount,
    this.description = '',
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      availability: json['availability'],
      shopId: json['shop_id'],
      discount: json['discount'],
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'availability': availability,
      'shop_id': shopId,
      'discount': discount,
      'description': description,
    };
  }
}
