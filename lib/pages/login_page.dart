import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pracise_app_2/utlis/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName = "";
  bool changeAnimation = false;

  final _formkey = GlobalKey<FormState>();

  checkValidate(BuildContext context) async {
    if (_formkey.currentState.validate()) {
      setState(() {
        changeAnimation = true;
      });
      await Future.delayed(Duration(milliseconds: 200));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeAnimation = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: SingleChildScrollView(
          child: new Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(50)),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      new Text(
                        "Welcome $userName",
                        style: GoogleFonts.gloriaHallelujah(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 35.0),
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "Username",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Username";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                userName = value;
                                MyRoutes.username = userName;
                                setState(() {});
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Password",
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Password";
                                }
                                if (value.length < 6) {
                                  return "Password cann't be less then 6 digit";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            InkWell(
                              onTap: () => checkValidate(context),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                height: 50,
                                width: changeAnimation ? 50 : 100,
                                alignment: Alignment.center,
                                child: changeAnimation
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Log In",
                                        style: GoogleFonts.laila(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(
                                      changeAnimation ? 50 : 12),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
