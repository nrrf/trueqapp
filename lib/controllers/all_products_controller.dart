

import 'package:get/state_manager.dart';
import 'package:trueqapp/api/product_api.dart';
import 'package:trueqapp/models/product.dart';

class AllProductsController extends GetxController{
  bool _loading = true;
  bool get loading => _loading;  
  late List<Product> _products; 
  List<Product> get products => _products;

  @override
  void onReady() async {
    // TODO: implement onInit
    super.onReady(); 
    await loadProducts();
  }

  Future<void> loadProducts() async{
    _products = await ProductApi.instance.allProducts(); 
    _loading = false;
    update(
      ['products'],
    );
  }
}