import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsPage extends StatelessWidget {
  // Dummy notifications data
  final List<Map<String, String>> notifications = [
    {
      'title': 'Fresh Products Added!',
      'description': 'Check out the new variety of fresh products in our store.'
    },
    {
      'title': 'SIH Shortlisting',
      'description': 'Team Agro Bytes has been shortlisted for Smart India Hackathon.'
    },
    {
      'title': 'Order Shipped',
      'description': 'Your order #12345 has been shipped and is on its way.'
    },
    {
      'title': 'Discount Offer',
      'description': 'Avail 20% discount on your next purchase using code SAVE20.'
    },
    {
      'title': 'New Category Launched',
      'description': 'Explore our new organic products category with fresh arrivals.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
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
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return _buildNotificationItem(notification);
        },
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, String> notification) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.notifications, color: Colors.green),
        title: Text(
          notification['title']!,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(notification['description']!),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
        onTap: () {
          // Handle notification tap, e.g., navigate to a detailed page
        },
      ),
    );
  }
}
