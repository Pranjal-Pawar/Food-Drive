import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/utils/routes.dart';

import '../DonorAuthentication/Methods.dart';
import '../Homepage.dart';
import '../widges/receiveroptionpg.dart';
import 'Receiver_Method.dart';

class SignupR extends StatefulWidget {
  const SignupR({Key? key}) : super(key: key);

  @override
  _SignupRState createState() => _SignupRState();
}

class _SignupRState extends State<SignupR> {
  final TextEditingController _name=TextEditingController();
  final TextEditingController _address=TextEditingController();
  final TextEditingController _phnoneNo=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _confirmPassword=TextEditingController();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    bool obc_text=true;
    final size=MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              }
          ),
          title: Center(
              child: Text(
                "Donor Drive",
                style: TextStyle(color: Colors.white),
              )),
          actions: [
            Container(
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.logout,
                    color: Colors.cyan,
                  )),
            )
          ],
          backgroundColor: Colors.cyan,
        ),
        body: isLoading
        ?Center(child: Container(child: CircularProgressIndicator()))
        :SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                padding:EdgeInsets.all(1),
                  child: Column(
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
                      Center(
                        child: Text("Sign Up",

                          style:TextStyle(
                            fontSize: 35,
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        controller: _name,
                        decoration: InputDecoration(
                          hintText: "Enter name",
                          prefixIcon: Icon(
                            CupertinoIcons.person,
                            color:Colors.cyan,
                          ),
                          labelText: "Name",
                        ),

                      ),
                      TextField(
                        controller: _address,
                        decoration: InputDecoration(
                          hintText: "Enter Address",
                          prefixIcon: Icon(
                            Icons.addchart_sharp,
                            color:Colors.cyan,
                          ),
                          labelText: "Address",
                        ),
                        maxLines: 2,
                      ),
                      TextField(
                        controller: _phnoneNo,
                        decoration: InputDecoration(
                          hintText: "Enter Phone number",
                          prefixIcon: Icon(
                            Icons.phone,
                            color:Colors.cyan,
                          ),
                          labelText: "Mobile",
                        ),
                        maxLines: 2,
                      ),
                      TextField(
                        controller: _email,
                        decoration: InputDecoration(
                          hintText: "Enter email",
                          prefixIcon: Icon(
                            CupertinoIcons.mail,
                            color:Colors.cyan,
                          ),
                          labelText: "Email",
                        ),
                      ),
                      TextField(
                        controller: _password,
                        decoration: InputDecoration(
                          hintText: "Enter passwaord",
                          prefixIcon: Icon(
                            CupertinoIcons.padlock_solid,
                            color:Colors.cyan,
                          ),
                          labelText:"Password",
                        ),
                      ),
                      TextField(
                        controller: _confirmPassword,
                        decoration: InputDecoration(
                          hintText: "rewrite password",
                          prefixIcon: Icon(
                            CupertinoIcons.lock_circle,
                            color: Colors.cyan,
                          ),
                          labelText: "Confirmed Password",
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        width: 25,
                      ),
                      ElevatedButton(
                          style:ElevatedButton.styleFrom(
                            primary:Colors.cyan,
                            onPrimary: Colors.white,
                            minimumSize: Size(100,40),
                          ) ,
                          onPressed:(){
                            if(_name.text.isNotEmpty&&
                                _address.text.isNotEmpty&&
                                _phnoneNo.text.isNotEmpty&&
                                _email.text.isNotEmpty&&
                                _password.text.isNotEmpty&&
                                _confirmPassword.text.isNotEmpty){
                              setState(() {
                                isLoading=true;
                              });

                              ReceiversignUp(
                                  _name.text,
                                  _address.text,
                                  _phnoneNo.text,
                                  _email.text,
                                  _password.text,
                                  _confirmPassword.text)
                                  .then((user){
                                if(user!=null){
                                  setState(() {
                                    isLoading=false;
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder:(_)=>receiveropyionpg()));
                                }else{
                                  setState(() {
                                    isLoading=false;
                                  });
                                }
                              });
                            }else {
                              print("please fill the form correctly");
                            }
                          },
                          child:Text("SignUp")
                      ),
                    ],

                  ),


              ),
            ),
          ),
        )
    );
  }
}