import 'package:flutter/material.dart';
import 'package:trueqapp/models/product.dart';
import 'package:trueqapp/utilities/size_config.dart';

class CardsProduct extends StatelessWidget {
  final List<Product> products;
  const CardsProduct({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 2 * SizeConfig.widthMultiplier,
          );
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final Product product = products[index];
          return Container(
            width: 30 * SizeConfig.imageSizeMultiplier,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 4 / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      child: Material(
                        child: Ink.image(
                          image: const AssetImage(
                            'not-available-es.png',
                          ),
                          fit: BoxFit.cover,
                          child: InkWell(
                            onTap: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 1 * SizeConfig.heightMultiplier,
                    ),
                    child: Text(
                      product.name.toUpperCase(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: products.length,
    );
  }
}