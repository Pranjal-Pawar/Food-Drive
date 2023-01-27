import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/DonorAuthentication/Methods.dart';
import 'package:food_donation/utils/routes.dart';

import '../Homepage.dart';
import '../widges/donaroptionpg.dart';


const List<String> list = <String>['Restaurant', 'Caterer', 'Individual'];
String dropdownValue = list.first;
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

    // String dropdownValue=list.first;

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
        body:isLoading
        ?Center(child: Container(child: CircularProgressIndicator()))
        :Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: EdgeInsets.all(1),
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
                                  hintText: "Enter mobile number",
                                  prefixIcon: Icon(
                                    CupertinoIcons.phone,
                                    color:Colors.cyan,
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
                              DropdownButtonExample(),
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
                                    _confirmPassword.text.isNotEmpty&&
                                  dropdownValue.isNotEmpty){
                                    setState(() {
                                       isLoading=true;
                                      });

                                      dSignUp(
                                      _name.text,
                                       _address.text,
                                         _phnoneNo.text,
                                          _email.text,
                                           _password.text,
                                          _confirmPassword.text,
                                        dropdownValue
                                      )
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
            ),
          ),
        )
    );
  }
}
class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  // String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down_sharp),
      elevation: 16,
      style: const TextStyle(color: Colors.cyan),
      underline: Container(
        height: 2,
        color: Colors.cyan,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
