import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Logo and Name
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile.jpg'), // Replace with your asset
                ),
                SizedBox(height: 8),
                Text(
                  'Ramesh',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Icon(Icons.edit, size: 20, color: Colors.green),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Menu Options
          _buildMenuItem(Icons.shopping_bag, 'Orders'),
          _buildMenuItem(Icons.person, 'My Details'),
          _buildMenuItem(Icons.location_on, 'Delivery Address'),
          _buildMenuItem(Icons.payment, 'Payment Methods'),
          _buildMenuItem(Icons.card_giftcard, 'Promo Cord'),
          _buildMenuItem(Icons.notifications, 'Notifications'),
          _buildMenuItem(Icons.help_outline, 'Help'),
          _buildMenuItem(Icons.info_outline, 'About'),
          SizedBox(height: 20),
          // Logout Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Get.toNamed('/onboarding');

              },
              icon: Icon(Icons.logout),
              label: Text('Log Out'),
              
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ],
      ),
      
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
        // Handle navigation to respective pages
      },
    );
  }
}
