import 'package:ecommerces/Model/model.dart';
import 'package:ecommerces/Widget/HomeWidget/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetail extends StatelessWidget {
  final Item? catalog;

  const HomeDetail({Key? key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog!.price}".text.bold.xl4.red800.make(),
            AddToCard(catalog: catalog!)
            .wh(120, 50)
          ],
        ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog!.id.toString()),
              child: Image.network(catalog!.image),
            ).h24(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog!.name.text.xl4
                        .color(context.accentColor)
                        .bold
                        .make(),
                    catalog!.desc.text.color(Colors.grey).xl.make(),
                    10.heightBox,
                    "Dolor sea takimata ipsum sea eirmod aliquyam est. Eos ipsum voluptua eirmod elitr, no dolor dolor amet eirmod dolor labore dolores magna. Amet vero vero vero kasd, dolore sea sed sit invidunt nonumy est sit clita. Diam aliquyam amet tempor diam no aliquyam invidunt."
                        .text
                        .color(Colors.grey)
                        .make()
                        .p12()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
