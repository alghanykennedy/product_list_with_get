
class Product {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  int id;
  String title;
  double price;
  String description;
  String category;
  String image;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json['id'] ?? 0,
        title: json['title'] ?? '-',
        price: json['price'].toDouble() ?? 0.0,
        description: json['description'] ?? '-',
        category: json['category'] ?? '-',
        image: json['image'] ?? '-',
      );
}
