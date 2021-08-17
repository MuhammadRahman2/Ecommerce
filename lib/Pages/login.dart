import 'package:ecommerces/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _key = GlobalKey<FormState>();

  moveToPage(BuildContext context) async {
    if (_key.currentState!.validate()) {
      {
        setState(() {
          changeButton = true;
        });
        await Future.delayed(Duration(seconds: 1));
        await Navigator.pushNamed(context, MyRoutes.homeRoute);
        setState(() {
          changeButton = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              Image.asset(
                'assets/images/hey.png',
                // width: 400,
                height: 350,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 30,
              ),
              Text("Welcome $name", style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
               ) ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(children: [
                  TextFormField(
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Enter your Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "UserName can't be Emptey";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: 'Enter Your Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be null";
                      } else if (value.length < 6) {
                        return "password value is less then 6 ";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Material(
                    color: context.theme.buttonColor,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToPage(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 120,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(Icons.done, color: Colors.white)
                            : Text("Login"),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
