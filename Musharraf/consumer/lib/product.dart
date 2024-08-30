class Product {
  final String name;
  final String imagePath;
  final String quantity;
  final String price;
  final int cost;

  Product({
    required this.name,
    required this.imagePath,
    required this.quantity,
    required this.price,
    required this.cost,
  });
}

// Dummy data for products
List<Product> products = [
  Product(
    name: "Bell Pepper Red",
    imagePath: "assets/images/bell_pepper.png",
    quantity: "10kg",
    price: "₹300",
    cost: 300,
  ),
  Product(
    name: "Egg Chicken Red",
    imagePath: "assets/images/egg.png",
    quantity: "500pcs",
    price: "₹1000",
    cost: 1000,
  ),
  Product(
    name: "Organic Bananas",
    imagePath: "assets/images/banana.png",
    quantity: "50kg",
    price: "₹400",
    cost: 400,
  ),
  Product(
    name: "Ginger",
    imagePath: "assets/images/ginger.png",
    quantity: "25kg",
    price: "₹300",
    cost: 300,
  ),
];
