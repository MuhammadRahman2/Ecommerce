import 'package:ecommerces/Widget/themes.dart';
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
          _CartListState().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatefulWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  __CartTotalState createState() => __CartTotalState();
}

class __CartTotalState extends State<_CartTotal> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$ 999".text.xl5.color(context.theme.accentColor).make(),
          30.widthBox,
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(context.theme.buttonColor)),
              child: 'Add Card'.text.white.make()
            ).w24(context)
        ],
      ),
    );
  }
}

class _CartListState extends StatefulWidget {
  const _CartListState({Key? key}) : super(key: key);

  @override
  __CartListStateState createState() => __CartListStateState();
}

class __CartListStateState extends State<_CartListState> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          onPressed: (){},
           icon: Icon(Icons.remember_me_outlined),
           ),
           title: 'Item 1'.text.make()

      ),
    );
  }
}
