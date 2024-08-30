import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'checkout.dart';

class CartPage extends StatelessWidget {
  // Dummy data for the cart items
  final List<Map<String, dynamic>> cartItems = [
    {
      'image': 'assets/bell_pepper_red.png', // Replace with your asset
      'name': 'Bell Pepper Red',
      'quantity': '10kg',
      'price': 300
    },
    {
      'image': 'assets/egg_chicken_red.png', // Replace with your asset
      'name': 'Egg Chicken Red',
      'quantity': '500pcs',
      'price': 1000
    },
    {
      'image': 'assets/organic_bananas.png', // Replace with your asset
      'name': 'Organic Bananas',
      'quantity': '50kg',
      'price': 400
    },
    {
      'image': 'assets/ginger.png', // Replace with your asset
      'name': 'Ginger',
      'quantity': '25kg',
      'price': 300
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return _buildCartItem(item);
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle checkout functionality
            Get.to(() => CheckoutPage());
          },
          child: Text('Go to Checkout', style: TextStyle(fontSize: 16)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(
              item['image'],
              width: 50,
              height: 50,
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${item['quantity']}, Price',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            _buildQuantityControl(),
            SizedBox(width: 15),
            Text(
              '₹${item['price']}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            IconButton(
              onPressed: () {
                // Handle item removal
              },
              icon: Icon(Icons.close, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityControl() {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            // Handle decrement functionality
          },
          icon: Icon(Icons.remove_circle_outline, color: Colors.grey),
        ),
        Text('1', style: TextStyle(fontSize: 16)),
        IconButton(
          onPressed: () {
            // Handle increment functionality
          },
          icon: Icon(Icons.add_circle_outline, color: Colors.green),
        ),
      ],
    );
  }
}
