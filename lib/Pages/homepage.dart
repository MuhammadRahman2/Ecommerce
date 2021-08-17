import 'dart:convert';
import 'package:ecommerces/Core/core.dart';
import 'package:ecommerces/Model/CartModel.dart';
import 'package:ecommerces/Model/model.dart';
import 'package:ecommerces/Widget/HomeWidget/add_to_cart.dart';
import 'package:ecommerces/Widget/HomeWidget/catalog_header.dart';
import 'package:ecommerces/Widget/HomeWidget/catalog_image.dart';
import 'package:ecommerces/Widget/HomeWidget/catalog_list.dart';
import 'package:ecommerces/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catalogJson = await rootBundle.loadString("assets/files/catalog.json");

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, store, status) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cart),
            backgroundColor: context.theme.buttonColor,
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              color: Vx.gray200,
              size: 22,
              count: _cart!.items.length,
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
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
  const CataLogItem({Key? key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  final Item? catalog;

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog!.id.toString()),
              child: CataLogImage(image: catalog!.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog!.name.text.lg.color(context.accentColor).bold.make(),
              catalog!.desc.text.color(Colors.grey).medium.make(),
              'more detail click on item'.text.color(Colors.grey).make(),
              20.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  '\$ ${catalog!.price}'.text.bold.xl.make(),
                  AddToCard(catalog: catalog!)
                ],
              ).pOnly(right: 8.0),
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(200).make().py(16);
  }
}
