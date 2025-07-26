import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool liked;

  @override
  void initState() {
    super.initState();
    liked = widget.product.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 130,
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                child: Image.asset(
                  widget.product.imageUrl,
                  height: 150,
                  width: 150,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        widget.product.title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.product.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 160,
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.amber.shade100,
                                  child: Text(
                                    widget.product.price,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Container(
                                    alignment: Alignment.center,
                                    color: Colors.amber.shade300,
                                    child: const Text(
                                      "Add to cart",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              icon: Icon(
                liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  liked = !liked;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
