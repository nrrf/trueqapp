import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/state_manager.dart';
import 'package:trueqapp/controllers/all_products_controller.dart';
import 'package:trueqapp/models/product.dart';
import 'package:trueqapp/responsive_widget.dart';
import 'package:trueqapp/screens/product/widgets/cards_product.dart';
import 'package:trueqapp/screens/product/products_strings.dart';
import 'package:trueqapp/utilities/constants.dart';
import 'package:trueqapp/utilities/size_config.dart';

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
            body: SafeArea(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.15,
                    child: ResponsiveWidget(
                      portraitLayout: PortraitHeader(),
                      landscapeLayout: LandscapeHeader(),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: SizeConfig.isMobilePortrait ? 0.3 : 0.45,
                    alignment: SizeConfig.isMobilePortrait
                        ? Alignment(0, -0.3)
                        : Alignment(0, -0.2),
                    child: Padding(
                      padding: EdgeInsets.all(
                        2 * SizeConfig.widthMultiplier,
                      ),
                      child: CardsProduct(products: _.products),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class LandscapeHeader extends StatelessWidget {
  const LandscapeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSecondColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
            3.0 * SizeConfig.heightMultiplier,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2 * SizeConfig.widthMultiplier,
              ),
              child: FittedBox(
                child: Text(
                  ProductStrings.productsTitle,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            SizeConfig.isMobilePortrait
                ? SizedBox(
                    width: 0.1,
                  )
                : Spacer(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                child: TextField(
                  cursorColor: kPrimaryColor,
                  cursorWidth: 4,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: kPrimaryColor),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: kSecondColor,
                      ),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    hintText: 'Buscar Productos',
                    suffixIcon: Icon(
                      Icons.mail,
                      color: Theme.of(context).primaryColor,
                    ),
                    hintStyle: Theme.of(context).textTheme.headline6!.copyWith(
                          color: kPrimaryColor,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PortraitHeader extends StatelessWidget {
  const PortraitHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSecondColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(
            3.0 * SizeConfig.heightMultiplier,
          ),
        ),
      ),
      child: Column(
        children: [],
      ),
    );
  }
}
