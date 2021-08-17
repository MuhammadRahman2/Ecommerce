import 'package:ecommerces/Model/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store.cart);
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
              mutations: {RemoveMutation},
              builder: (context, store, status) {
                return "\$${_cart.totalPrice}"
                    .text
                    .xl5
                    .color(context.theme.accentColor)
                    .make();
              }
              ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying not supported yet.".text.make(),
              ));
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor)),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final CartModel _cart = VxState.store.cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "nothing to show".text.xl2.make()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => RemoveMutation(_cart.items[index]),
                ),
                title: _cart.items[index].name.text.make()),
          );
  }
}
