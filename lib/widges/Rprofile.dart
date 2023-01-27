import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../RecieverAuthentication/Receiver_Method.dart';
class Rprofile extends StatefulWidget {
  const Rprofile({Key? key}) : super(key: key);

  @override
  _RprofileState createState() => _RprofileState();
}

class _RprofileState extends State<Rprofile> {
  late final Map<String,dynamic>userMap;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 248,243,247),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Text(
                "Profile"
              ),
            ),
            SizedBox(
              width: 95,
            ),
            IconButton(
              onPressed:(){
                receiverlogOut(context);
              },
              icon:Icon(
                Icons.logout_sharp,
                size: 28,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestore
            .collection("users")
            .doc(_auth.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context,snapshot){
          if(!snapshot.hasData)return CircularProgressIndicator();
          return Container(
            color: Color.fromARGB(255, 248,243,247),
            child:Stack(
              children:[
                Stack(
                  children: [
                    Container(
                      height: size.height/ 3.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width/7.8),
                        color: Colors.cyan[300],
                      ),
                    ),
                    Container(
                      height: size.height/ 3.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width/7.8),
                        color: Colors.cyan[200],
                      ),
                    ),
                    Container(
                      height: size.height/ 3.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width/7.8),
                        color: Colors.cyan[100],
                      ),
                    ),
                    Container(
                      height: size.height/ 4.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width/7.8),
                        color: Colors.cyan[50],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.cyan,
                          backgroundImage: AssetImage("Assets/images/receiver.png"),
                          radius: 50,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          snapshot.data!['name'],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 248,243,247)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone_sharp,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    ' Phone number',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                snapshot.data!['phoneNo'],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.email_sharp,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    ' Email',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                              snapshot.data!['email'],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),
                              Divider(),
                              Row(
                                children: [
                                  Icon(
                                    Icons.addchart_rounded,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    ' Address',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                              Text(
                                snapshot.data!['address'],
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal),
                              ),

                            ],

                          ) ,


                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },




      )
      );
  }
}
