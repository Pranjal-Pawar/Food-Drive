import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/DonorAuthentication/Methods.dart';
import 'package:food_donation/utils/routes.dart';

import '../Homepage.dart';
import '../widges/donaroptionpg.dart';



class SignupD extends StatefulWidget {
   SignupD({Key? key}) : super(key: key);
   @override
   _SignupDState createState() => _SignupDState();
}

class _SignupDState extends State<SignupD> {
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 100, 8,8),
                      child: Column(
                        children: [
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
                                color:Colors.black,
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
                                color:Colors.black,
                              ),
                              labelText: "Address",
                            ),
                            maxLines: 2,
                          ),
                          TextField(
                            controller: _phnoneNo,
                            decoration: InputDecoration(
                              hintText: "Enter mobile number",
                              prefixIcon: Icon(
                                CupertinoIcons.phone,
                                color:Colors.black,
                              ),
                              labelText: "Mobile",
                            ),
                          ),
                          TextField(
                            controller: _email,
                            decoration: InputDecoration(
                              hintText: "Enter email",
                              prefixIcon: Icon(
                                CupertinoIcons.mail,
                                color:Colors.black,
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
                                color:Colors.black,
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
                                color: Colors.black,
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
                              ),
                              onPressed:(){
                              if(_name.text.isNotEmpty&&
                                    _address.text.isNotEmpty&&
                                _email.text.isNotEmpty&&
                                _password.text.isNotEmpty&&
                                _confirmPassword.text.isNotEmpty){
                                setState(() {
                                   isLoading=true;
                                  });

                                  dSignUp(
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
                                          builder:(_)=>donaroptionpage()));
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
        )
    );
  }
}
