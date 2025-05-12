import 'package:flutter/material.dart';
import 'models/product_model.dart'; // Assuming product_model.dart is in lib/models
import 'product_detail_page.dart';

class CategoryItemsPage extends StatelessWidget {
  final String categoryName;

  const CategoryItemsPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Filter products by category and take the first 4
    final List<Product> categoryProducts =
        mockProducts
            .where((product) => product.category == categoryName)
            .take(4) // Display 4 items per category as requested
            .toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryName)),
      body:
          categoryProducts.isEmpty
              ? Center(
                child: Text(
                  'No products found in $categoryName.',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
              )
              : GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  childAspectRatio: 2 / 3.2, // Adjust for content
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: categoryProducts.length,
                itemBuilder: (ctx, i) {
                  final product = categoryProducts[i];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior:
                        Clip.antiAlias, // Ensures image respects border radius
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    ProductDetailPage(product: product),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            flex: 3, // Give more space to image
                            child: Hero(
                              tag:
                                  'productImage_${product.id}', // Unique tag for Hero animation
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  product.imageUrl,
                                  fit: BoxFit.contain,
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          const Icon(
                                            Icons.broken_image,
                                            size: 50,
                                            color: Colors.grey,
                                          ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '\$${product.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.add_shopping_cart_outlined,
                                size: 18,
                              ),
                              label: const Text(
                                'Add',
                                style: TextStyle(fontSize: 13),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).primaryColor.withOpacity(0.1),
                                foregroundColor: Theme.of(context).primaryColor,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${product.name} added to cart! (Placeholder)',
                                    ),
                                    backgroundColor: Colors.green,
                                    duration: const Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
