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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        body:SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 200, 8, 8),
              child: Container(
                child:Column(
                  children: [
                    Text("Login",
                      style:TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
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
                        color: Colors.black,
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
                          color: Colors.black,
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
                    Text("Are you a new user ?",
                      style:TextStyle(
                        fontSize: 15,
                        fontWeight:FontWeight.normal,
                      ),
                    ),
                    ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        primary: Colors.cyan,
                        onPrimary:Colors.white,
                        minimumSize: Size(100, 40),
                      ),
                      onPressed: ()=>{
                        Navigator.pushNamed(context, MyRoutes.signupr)
                      },
                      child:Text('Signin'),
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
