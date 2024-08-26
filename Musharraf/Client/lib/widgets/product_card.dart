import 'dart:core';

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageurl;
  final double price;
  final String offertag;
  final Function onTap;

  const ProductCard({super.key, required this.name, required this.imageurl, required this.price, required this.offertag, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Card(
        elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(imageurl,
                fit: BoxFit.cover,
                  width: double.maxFinite,
                  height: 120,
                ),
                SizedBox(height: 9),
                Text(name,
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 9),
                Text('Rs: $price',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(offertag,
                  style: const TextStyle(color: Colors.white,fontSize: 12),
                  ),
                ),



              ],
            ),
          ),
      ),
    );
  }
}
