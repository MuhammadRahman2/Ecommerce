import 'package:ecommerces/Widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        "Catalog".text.bold.xl5.color(MyThemes.darkBluishColor).make(),
        "Trending Product".text.xl2.make()
      ],
    );
  }
}
