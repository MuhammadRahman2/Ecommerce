import 'package:ecommerces/Model/model.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.item,
  })  : assert(item != null),
        super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => print("${item.name}"),
        leading: Image.network("${item.image}"),
        title: Text("${item.name}", textScaleFactor: 1.2),
        subtitle: Text("${item.desc}"),
        trailing: Text(
          "\$${item.price.toString()}",
          textScaleFactor: 1.5,
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
