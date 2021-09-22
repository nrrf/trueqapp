import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/state_manager.dart';
import 'package:trueqapp/controllers/all_products_controller.dart';
import 'package:trueqapp/models/product.dart';

class MyProducts extends StatefulWidget {
  @override
  _MyProductsState createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllProductsController>(
      init: AllProductsController(),
      id: 'products',
      builder: (_) {
        if (_.loading == true) {
          return Scaffold(
            body: Center(
              child: SpinKitSpinningLines(
                color: Colors.white,
                size: 100.0,
              ),
            ),
          );
        } else {
          return Scaffold(
            body: ListView.builder(
              itemBuilder: (context, index) {
                final Product product = _.products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.description),
                );
              },
              itemCount: _.products.length,
            ),
          );
        }
      },
    );
  }
}
