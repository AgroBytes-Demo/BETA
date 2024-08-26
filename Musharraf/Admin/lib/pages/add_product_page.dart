import 'package:beta/controller/home_controller.dart';
import 'package:beta/widgets/drop_down_btn.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: Text('Add Product'),),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Add New Product", style: TextStyle(fontSize: 30,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold),),

                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    label: Text('Product Name'),
                    hintText: "Enter your product name",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    label: Text('Product Description'),
                    hintText: "Enter your product Description",

                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ctrl.productImgCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    label: Text('Add Image URL'),
                    hintText: "Image URL",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    label: Text('ProductPrice'),
                    hintText: "Enter your product price",
                  ),
                ),
                SizedBox(height: 30,),

                Row(
                  children: [
                    Flexible(child: DropDownBtn(items: const ["Sneakers", "Running Shoes", "Formal Shoes", "Boots", "Sandals", "Loafers", "Sports Shoes", "Slippers"],
                      selectedItemText: ctrl.category,
                      onSelected: (selectedValue) {
                        ctrl.category = selectedValue ?? 'General';
                        ctrl.update();
                      },)),
                    Flexible(child: DropDownBtn(
                      items: const ["Nike", "Adidas", "Puma", "Reebok", "Clarks", "Woodland", "Bata", "Skechers"],
                      selectedItemText:ctrl.brand,
                      onSelected: (electedValue) {
                        ctrl.brand = electedValue ?? "UnBranded";
                        ctrl.update();
                      },)),

                  ],
                ),
                SizedBox(height: 10,),
                Text('Offer Product?', style: TextStyle(fontSize: 18),),
                DropDownBtn(items: const ["True", "False"],
                  selectedItemText: ctrl.offer.toString(),
                  onSelected: (electedValue) {
                  ctrl.offer = bool.tryParse(electedValue ?? 'false') ?? false;
                  ctrl.update();
                  },),
                const SizedBox(height: 30,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      ctrl.addProduct();
                    }, child: Text("Submit"))


              ],
            ),
          ),
        ),
      );
    });
  }
}
