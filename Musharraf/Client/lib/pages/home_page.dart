import 'package:client/pages/login_page.dart';
import 'package:client/pages/product_description.dart';
import 'package:client/widgets/drop_down_btn.dart';
import 'package:client/widgets/mulit_select_drop_down.dart';
import 'package:client/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async {
          ctrl.fetchProducts();
        },
        child: Scaffold(
          appBar: AppBar(

            title: Text(
              "Footwear Store", style: TextStyle(fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: () {
                GetStorage box = GetStorage();
                box.erase();
                Get.offAll(LoginPage());
              }, icon: Icon(Icons.logout))
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ctrl.productCategories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          ctrl.filterByCategory(ctrl.productCategories[index].name ?? '');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Chip(label: Text(ctrl.productCategories[index].name ?? 'None')),
                        ),
                      );
                    }),
              ),
              Row(
                children: [
                  Flexible(child: DropDownBtn(
                    items: ['Rs: Low to High', 'Rs:High to Low'],
                    selectedItemText: 'Sort',
                    onSelected: (selected) {},
                  ),
                  ),

                  Flexible(child: MulitSelectDropDown(
                    items: ['item1', 'item2', 'item3'],
                    onSelectionChnaged: (selectedItems) {},)),

                ],
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,),
                    itemCount: ctrl.productsShowInUi .length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        name: ctrl.productsShowInUi [index].name ?? 'No Name',
                        price: ctrl.productsShowInUi [index].price ?? 0,
                        offertag: '15% OFF',
                        imageurl: ctrl.productsShowInUi [index].image ?? 'URL',
                        onTap: () {
                          Get.to(ProductDescriptionPage(),arguments: {'data': ctrl.productsShowInUi[index]});
                        },
                      );
                    }),
              )


            ],
          ),
        ),
      );
    });
  }
}
