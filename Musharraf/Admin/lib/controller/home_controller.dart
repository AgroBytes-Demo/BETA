import 'package:beta/model/product/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'general';
  String brand = 'Unbranded';
  bool offer = false;

  List<Product> products = [];



  @override
  Future<void> onInit() async {
    // TODO: implement onInit

    productCollection = firestore.collection('products');
    await fetchProducts();
    super.onInit();
  }

  addProduct() {
    try {
      DocumentReference doc = productCollection.doc();
      Product product = Product(
            id: doc.id,
            name: productNameCtrl.text,
            category: category,
            description: productDescriptionCtrl.text,
            price: double.tryParse(productPriceCtrl.text),
            brand: brand,
            image: productImgCtrl.text,
            offer: offer,
          );
      final productJson = product.toJson();
      doc.set(productJson);
      Get.snackbar('Success','Product Added Successfully',colorText: Colors.green);
      setValuesdefault();
    } catch (e) {
      Get.snackbar('Error',e.toString(),colorText: Colors.red);
    }

}

  fetchProducts() async {
      try {
        QuerySnapshot productSnapshot= await productCollection.get();
        final List<Product> retrievedProducts = productSnapshot.docs.map((doc)=> Product.fromJson(doc.data() as Map<String,dynamic>)).toList();
        products.clear();
        products.assignAll(retrievedProducts);
        Get.snackbar('Success', 'Products Fetched Successfully',colorText: Colors.green);
      } catch (e) {
        Get.snackbar('Failed', 'Products Fetch was UnSuccessful',colorText: Colors.red);
      } finally{
        update();
      }
  }

deleteProducts(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProducts();

    } catch (e) {
      Get.snackbar("Product Can't be Deleted", e.toString(),colorText: Colors.red);
    }
}

 setValuesdefault(){
   productNameCtrl.clear();
   productPriceCtrl.clear();
   productDescriptionCtrl.clear();
   productImgCtrl.clear();

   category = 'general';
   brand = 'Unbranded';
   offer = false;
   update();


}

}