class ProductModel {
  final String title;
  final String description;
  final String price;
  final String imageUrl;
  final bool isLiked;

  ProductModel({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isLiked = false,
  });
}
