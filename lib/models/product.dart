// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        required this.name,
        required this.description,
        required this.idUser,
        required this.idProduct, 
        required this.idCategory,
    });

    final String name;
    final String description;
    final String idUser; 
    final String idCategory;
    final int idProduct;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        description: json["description"],
        idUser: json["iduser"],
        idProduct: json["id_product"], 
        idCategory: json["idcategory"]
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "id_user": idUser,
        "id_product": idProduct,
    };
}
