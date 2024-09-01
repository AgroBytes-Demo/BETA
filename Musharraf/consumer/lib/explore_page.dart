import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category_detail.dart';
import 'notification.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome and Avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'What would you like to buy today?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/profile.jpg'), // Example avatar image
                  ),
                ],
              ),
              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Store',
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      width:
                          10), // Add spacing between the search box and the icon
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.grey),
                    onPressed: () {
                      Get.to(
                          NotificationsPage()); // Navigate to the notification page
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Filters and Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle filters
                    },
                    icon: Icon(Icons.filter_list),
                    label: Text('Filters'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle sorting functionality
                    },
                    icon: Icon(Icons.sort),
                    label: Text('Sort by'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle offers functionality
                    },
                    icon: Icon(Icons.local_offer),
                    label: Text('Offers'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Products Section
              Text(
                'Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              // Products Grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          '/category_detail/${category.name}',
                        ); // Navigate to category detail page with name as parameter
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: category.color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              category.imagePath,
                              height: 80,
                            ),
                            SizedBox(height: 10),
                            Text(
                              category.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Category {
  final String name;
  final String imagePath;
  final Color color;

  Category({
    required this.name,
    required this.imagePath,
    required this.color,
  });
}

// Sample data for categories
final categories = [
  Category(
    name: 'Fresh Fruits & Vegetable',
    imagePath: 'assets/fruits_vegetables.png',
    color: Colors.green,
  ),
  Category(
    name: 'Cooking Oil & Ghee',
    imagePath: 'assets/cooking_oil_ghee.png',
    color: Colors.orange,
  ),
  Category(
    name: 'Meat & Fish',
    imagePath: 'assets/meat_fish.png',
    color: Colors.red,
  ),
  Category(
    name: 'Bakery & Snacks',
    imagePath: 'assets/bakery_snacks.png',
    color: Colors.purple,
  ),
  Category(
    name: 'Dairy & Eggs',
    imagePath: 'assets/dairy_eggs.png',
    color: Colors.yellow,
  ),
  Category(
    name: 'Pulses',
    imagePath: 'assets/pulses.png',
    color: Colors.brown,
  ),
];
