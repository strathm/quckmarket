class User {
  final String id;
  final String email;
  final String password; // Consider using secure storage for passwords
  final List<String> favoriteItemIds; // List of favorite item IDs
  final List<String> favoriteShopIds; // List of favorite shop IDs

  User({
    required this.id,
    required this.email,
    required this.password,
    required this.favoriteItemIds,
    required this.favoriteShopIds,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      password: json['password'], // Note: This should be handled securely in real apps
      favoriteItemIds: List<String>.from(json['favorite_item_ids']),
      favoriteShopIds: List<String>.from(json['favorite_shop_ids']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password, // Note: This should be handled securely in real apps
      'favorite_item_ids': favoriteItemIds,
      'favorite_shop_ids': favoriteShopIds,
    };
  }
}
