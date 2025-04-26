import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductDetailsPage extends StatelessWidget {
  final dynamic product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: Colors.teal.shade700,
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image - Now Centered
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: product['image'],
                    height: 180,
                    fit: BoxFit.contain,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Product Title
            Text(
              product['title'],
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),

            const SizedBox(height: 12),

            // Price
            Text(
              "\$${product['price']}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 0, 165, 29),
              ),
            ),

            const SizedBox(height: 24),

            // Description Title
            const Text(
              "Product Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),

            const SizedBox(height: 10),

            // Description Text
            Text(
              product['description'],
              style: const TextStyle(
                fontSize: 15,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 30),

            // Back Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  "Back to Products",
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade600,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
