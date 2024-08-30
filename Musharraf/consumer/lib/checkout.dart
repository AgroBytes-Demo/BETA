import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'orderaccepted.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text('Delivery'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle delivery method selection
              },
            ),
            Divider(),
            ListTile(
              title: Text('Payment'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle payment method selection
              },
            ),
            Divider(),
            ListTile(
              title: Text('Promo Code'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle promo code application
              },
            ),
            Spacer(),
            Text('Total Cost: ₹1397', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => OrderAcceptedPage());
          },
          child: Text('Place Order', style: TextStyle(fontSize: 16)),
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
}
