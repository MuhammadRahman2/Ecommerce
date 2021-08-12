import 'package:ecommerces/Model/model.dart';
import 'package:ecommerces/Pages/homedetail.dart';
import 'package:ecommerces/Pages/homepage.dart';
import 'package:flutter/material.dart';

class CataLogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items!.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items![index];
          return InkWell(
            onTap: () => Navigator.push(context,MaterialPageRoute(
              builder:(context) => HomeDetail(
               catalog: catalog,
             ),
             ),
             ),
            child: CataLogItem(
              catalog: catalog));
        });
  }
}