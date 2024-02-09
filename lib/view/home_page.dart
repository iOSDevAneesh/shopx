import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopx/controllers/product_controller.dart';
import 'package:shopx/view/add_to_cart_screen.dart';
import 'package:shopx/view/badge.dart';
import 'package:shopx/view/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController;

  HomePage({Key? key})
      : productController = Get.put(ProductController()),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          CupertinoIcons.back,
          color: Colors.black,
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {

                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => CartScreen()));

                },
                icon: Stack(
                  children: [
                    const Icon(
                      CupertinoIcons.cart_fill_badge_minus,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Obx(() => Visibility(
                        visible: productController.getCartQuantity() > 0,
                        child: Badges(
                          value: '${productController.getCartQuantity()}',
                        ),
                      )),
                    ),
                  ],
                ),
                color: Colors.black,
              ),
              const SizedBox(
                width: 14,
              )
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "ShopX",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.view_list_rounded),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.grid_view_outlined))
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
