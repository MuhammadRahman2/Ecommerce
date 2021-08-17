import 'package:ecommerces/Core/core.dart';
import 'package:ecommerces/Model/CartModel.dart';
import 'package:ecommerces/Model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCard extends StatelessWidget {
  final Item catalog;

  AddToCard({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     VxState.watch(context, on: [AddMutation,RemoveMutation]);
    final CartModel _cart = VxState.store.cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
        ;
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
      ),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.shopping_cart),
    );
  }
}
