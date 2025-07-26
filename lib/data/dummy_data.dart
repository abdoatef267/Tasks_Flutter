import '../models/product_model.dart';
import 'package:flutter/material.dart';

final List<ProductModel> dummyProducts = [
  ProductModel(
    title: "FinnNavian",
    description: "Scandinavian small sized double sofa",
    price: "\$248",
    imageUrl: "assets/chair.jpg",
  ),
  ProductModel(
    title: "FinnNavian",
    description: "Scandinavian small sized arm chair",
    price: "\$199",
    imageUrl: "assets/chair.jpg",
  ),
];

const List<String> categories = ['Sofas', 'Wardrobe', 'Desk', 'Dresser'];

const List<IconData> icons = [
  Icons.weekend,
  Icons.inventory,
  Icons.work,
  Icons.chair_alt,
];
