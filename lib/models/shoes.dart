class Shoes {
  final String id;
  final String name;
  final double price;

  Shoes({required this.id, required this.name, required this.price});

  factory Shoes.fromJson(String id, Map<String, dynamic> json) {
    return Shoes(
      id: id,
      name: json['name'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }

  @override
  bool operator ==(Object other) {
    return other is Shoes && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
