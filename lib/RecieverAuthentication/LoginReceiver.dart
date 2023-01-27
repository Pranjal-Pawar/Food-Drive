import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/Homepage.dart';
import 'package:food_donation/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widges/receiveroptionpg.dart';
import 'Receiver_Method.dart';

class LoginpageR extends StatefulWidget {
  LoginpageR({Key? key}) : super(key: key);

  @override
  _LoginpageRState createState() => _LoginpageRState();
}

class _LoginpageRState extends State<LoginpageR> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    bool obs_text = true;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
          onPressed: (){
            Navigator.pushNamed(context, MyRoutes.homeRoute);
          },
        ),
        title: Center(
          child: Text(
            "Food Drive",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          Container(
            child: IconButton(
                onPressed: () {
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.cyan,
                )),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.cyan,

      ),
      body:isLoading
        ?Center(child: Container(child: CircularProgressIndicator()))
      :Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(38),
              child: Container(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "Assets/images/login.png",
                        fit: BoxFit.fitHeight,
                        height: 146,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                    ),

                    TextField(
                      controller: _email,
                      decoration: InputDecoration(
                        hintText: "Enter email",prefixIcon:Icon(
                        CupertinoIcons.mail,
                        color: Colors.cyan,
                      ),
                        labelText: "Email",
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                    ),
                    TextField(
                      controller: _password,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        prefixIcon:Icon(
                          CupertinoIcons.padlock_solid,
                          color: Colors.cyan,
                        ),
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                    ),
                    ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                        onPrimary:Colors.white,
                        minimumSize: Size(100, 40),
                      ),
                      onPressed: (){
                        if (_email.text.isNotEmpty &&
                            _password.text.isNotEmpty) {
                          setState(() {
                            isLoading = true;
                          });

                          receiverlogIn(_email.text, _password.text)
                              .then((user) {
                            if (user != null) {
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => receiveropyionpg()));
                            } else {
                              setState(() {
                                isLoading = false;
                              });
                            }
                          });
                        } else {
                          print("please fill the form correctly");
                        }
                      },
                      child:Text('Login'),
                    ),
                    SizedBox(
                      height: 25,
                      width: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, MyRoutes.signupr);
                            },
                            child: Container(
                                alignment: Alignment.center,
                                child: Text("Sign Up",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.bold)))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
