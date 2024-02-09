import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/controllers/product_controller.dart';

class CartScreen extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();

  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        title: const Text('Shopoo Cart'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (productController.cartItems.isEmpty) {
          return const Center(child: Text('Your cart is empty.'));
        } else {
          return Padding(
            padding: const EdgeInsets.only(left: 12, top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Subtotal Amount : \$ ${productController.totalAmount.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: productController.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = productController.cartItems[index];
                      return Card(
                        elevation: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 215,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey.shade100),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: double.infinity,
                                  width: 150,
                                  margin: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          product.imageLink,
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                                Icons.remove_circle_outline),
                                          ),
                                          const Text(
                                            "2",
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons
                                                .add_circle_outline_outlined),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12, right: 10),
                                        child: Text(
                                          product.name.toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      Text(
                                        '\$ ${product.price}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        "Eligible for free shipping",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10),
                                      ),
                                      const Text(
                                        "in Stock",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 10,
                                            color: Colors.green),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            "Category :",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            product.category != null
                                                ? product.category.toString()
                                                : "not available",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 10,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.grey,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            minimumSize: const Size(70, 30),
                                          ),
                                          onPressed: () {
                                            productController
                                                .removeFromCart(product);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 20,
                                          ),
                                          label: const Text("Delete"))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                      ;
                    },
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
