import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category_detail.dart';
import 'product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  // Constructor to receive the selected product
  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    int quantity = 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          product.name,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                product.imagePath,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              product.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              '${product.quantity}, ${product.price}',
              style: TextStyle(color: Colors.grey, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              '₹${product.cost}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (quantity > 1) {
                      quantity--;
                    }
                  },
                  icon: Icon(Icons.remove_circle),
                  color: Colors.green,
                ),
                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  onPressed: () {
                    quantity++;
                  },
                  icon: Icon(Icons.add_circle),
                  color: Colors.green,
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add to cart functionality
              },
              style: ElevatedButton.styleFrom(
                padding:
                    EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                backgroundColor: Colors.green,
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
