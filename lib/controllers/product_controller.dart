import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shopx/api_services/http_services.dart';
import 'package:shopx/model/product_model.dart';



class ProductController extends GetxController {
  final productList = <Product>[].obs;
  var cartItems = <Product>[].obs;
  var totalAmount = 0.0.obs; // Added for total amount
  var isLoading = true.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    retrieveCartItems();
  }


  void retrieveCartItems() {
    List<Map<String, dynamic>>? storedCartItems = box.read<List<Map<String, dynamic>>>("cart_items");

    if (storedCartItems != null) {
      cartItems.value = storedCartItems.map((item) => Product.fromJson(item)).toList();
    }
  }
  void fetchProducts() async {
    try {
      final products = await ApiServices.fetchProducts();
      isLoading(true);
      if (products != null) {
        productList.value = products;
      }
    } finally {
      isLoading(false);
      print("error occurred -");
    }
  }

  void addToCart(Product product) {
    if (!cartItems.contains(product)) {
      cartItems.add(product);
      calculateTotalAmount();
    }
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    calculateTotalAmount();
  }

  int getCartQuantity() {
    return cartItems.length;
  }

  void calculateTotalAmount() {
    totalAmount.value = cartItems.fold(0, (sum, product) => sum + double.parse(product.price));
  }
}
