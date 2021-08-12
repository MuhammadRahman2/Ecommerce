import 'package:ecommerces/Model/model.dart';
import 'package:ecommerces/Widget/themes.dart';
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
       appBar: AppBar(),
      backgroundColor: MyThemes.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog!.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyThemes.darkBluishColor,
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Buy".text.make(),
            ).wh(100, 50)
          ],
        ).p32(),

      ),
      body: SafeArea(
        bottom: false,
              child: Column(
          children: [
            Hero(
              tag: Key(catalog!.id.toString()),
             child: Image.network(catalog!.image)
            ).h32(context),

            Expanded(
              child:VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                 child: Container(
                   color: Colors.white,
                   width: context.screenWidth,
                   child: Column(
                     children: [
                       catalog!.name.text.xl4.
                       color(MyThemes.darkBluishColor).bold.make(),
                       catalog!.desc.text.color(Colors.grey).xl.make(),
                       10.heightBox
                     ],
                   ).py64()
                 ),
                 ),
            )
          ],
        ).p16()
      ),
    );
  }
}
