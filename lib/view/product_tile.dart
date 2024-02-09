import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/model/product_model.dart';

import '../controllers/product_controller.dart';

class ProductTile extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final Product? product;

  ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: Image.network(
                    product!.imageLink.toString(),
                    fit: BoxFit.cover,
                  )),
              Positioned(
                right: 0,
                child: Obx(() => CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: product!.isFavourite.value
                            ? const Icon(
                                Icons.favorite_rounded,
                                color: Colors.indigo,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.indigo,
                              ),
                        onPressed: () {
                          product!.isFavourite.toggle();
                        },
                      ),
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 10, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(product!.brand.toString()),
                const SizedBox(
                  height: 3,
                ),
                Container(
                  height: 18,
                  width: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product!.rating.toString(),
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 9),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 10,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product!.price}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 16,
                      child: IconButton(
                        onPressed: () {
                          productController.addToCart(product!);
                        },
                        icon: const Icon(
                          Icons.add_shopping_cart_outlined,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
