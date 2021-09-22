import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:trueqapp/api/global_api.dart';
import 'package:trueqapp/controllers/global_controller.dart';
import 'package:trueqapp/models/product.dart';

class ProductApi {
  ProductApi._internal();
  static ProductApi _instance = ProductApi._internal();
  static ProductApi get instance => _instance;

  Future<List<Product>> allProducts() async {
    final controller = Get.find<GlobalController>();
    final response = await GlobalApi.instance.dioRequest(
      'product/all-products',
      options: Options(
        headers: {"authorization": "Bearer ${controller.token}"},
      ),
    );

    return (response.data as List).map((e) => Product.fromJson(e)).toList();
  }
}
