import 'package:client/model/product/product.dart';
import 'package:client/model/product_category/product_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference categoryCollection;

  List<Product> products = [];
  List<Product> productsShowInUi = [];

  List<ProductCategory> productCategories = [];

  @override
  Future<void> onInit() async {
    // TODO: implement onInit

      productCollection = firestore.collection('products');
      categoryCollection = firestore.collection('category');
      await fetchCategory();
      await fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot= await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs.map((doc)=> Product.fromJson(doc.data() as Map<String,dynamic>)).toList();
      products.clear();
      products.assignAll(retrievedProducts);
      productsShowInUi.assignAll(products);
      Get.snackbar('Success', 'Products Fetched Successfully',colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Failed', 'Products Fetch was UnSuccessful',colorText: Colors.red);
    } finally{
      update();
    }
  }

  fetchCategory() async {
    try {
      QuerySnapshot categorySnapshot= await categoryCollection.get();
      final List<ProductCategory> retrievedCategories = categorySnapshot.docs.map((doc)=> ProductCategory.fromJson(doc.data() as Map<String,dynamic>)).toList();
      productCategories.clear();
      productCategories.assignAll(retrievedCategories);
      Get.snackbar('Success', 'Categories  Fetched Successfully',colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Failed', 'Categories Fetch was UnSuccessful',colorText: Colors.red);
    } finally{
      update();
    }
  }

  filterByCategory(String category) {
    productsShowInUi.clear();
    productsShowInUi = products.where((product)=> product.category ==category).toList();
    update();
  }


}