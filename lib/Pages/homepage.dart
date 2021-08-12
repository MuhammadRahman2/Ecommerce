import 'dart:convert';

import 'package:ecommerces/Model/model.dart';
import 'package:ecommerces/Widget/HomeWidget/catalog_header.dart';
import 'package:ecommerces/Widget/HomeWidget/catalog_image.dart';
import 'package:ecommerces/Widget/HomeWidget/catalog_list.dart';

import 'package:ecommerces/Widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyThemes.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                  CataLogList().py16().expand()
                else
                  CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}

class CataLogItem extends StatelessWidget {
  final Item? catalog;

  const CataLogItem({Key? key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog!.id.toString()),
            child: CataLogImage(
            image: catalog!.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog!.name.text.lg.color(MyThemes.darkBluishColor).bold.make(),
              catalog!.desc.text.color(Colors.grey).medium.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  '\$ ${catalog!.price}'.text.bold.xl.make(),
                  ElevatedButton(
                    onPressed: (){
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        MyThemes.darkBluishColor
                      ),
                      shape: MaterialStateProperty.all(
                        StadiumBorder()
                        ),
                       ),
                    child: "Buy".text.make()
                    )
                  ],
              ).pOnly(right: 8.0),
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py(16);
  }
}

