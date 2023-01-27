import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/Orders/Yourorders.dart';
import 'package:food_donation/widges/Yorders_widget.dart';

import '../utils/Receiverconfirmscreenarg.dart';
import '../utils/routes.dart';
class Yorders extends StatefulWidget {
  const Yorders({Key? key}) : super(key: key);

  @override
  State<Yorders> createState() => _YordersState();
}

class _YordersState extends State<Yorders> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final CollectionReference firestore =FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 243, 247),
        appBar: AppBar(
          backgroundColor:Colors.cyan,
          title: Padding(
            padding: const EdgeInsets.only(left:33),
            child: Text(
                "Your Orders"
            ),
          ),
        ),
        body:StreamBuilder<QuerySnapshot>(
          stream: firestore.doc(_auth.currentUser!.uid).collection("receiverconfirmlist")
            .snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return ListView.builder(
              itemCount: (snapshot.data! as QuerySnapshot).docs.length,
              itemBuilder:(context,index){
                String address=(snapshot.data!as QuerySnapshot).docs[index]['address'];
                String date=(snapshot.data!as QuerySnapshot).docs[index]['date'];
                String description=(snapshot.data!as QuerySnapshot).docs[index]['description'];
                String mobile=(snapshot.data!as QuerySnapshot).docs[index]['mobile'];
                String serve=(snapshot.data!as QuerySnapshot).docs[index]['serve'];
                String time=(snapshot.data!as QuerySnapshot).docs[index]['time'];
                String type=(snapshot.data!as QuerySnapshot).docs[index]['type'];
                String duid=(snapshot.data!as QuerySnapshot).docs[index]['duid'];
                String dname=(snapshot.data!as QuerySnapshot).docs[index]['dname'];
                String ruid=(snapshot.data!as QuerySnapshot).docs[index]['ruid'];
                String rname=(snapshot.data!as QuerySnapshot).docs[index]['rname'];

                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, MyRoutes.YOrderDetails,
                    arguments: Receiverconfirmscreenarg(
                      address,date,description,mobile,serve,time,type,duid,dname,ruid,rname
                    ));

                  },
                  child: Card(
                      margin:EdgeInsets.all(7),
                      color: Colors.white,
                      elevation: 1.7,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child:Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children:  [
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 40,
                                    child:Icon(Icons.account_circle,
                                      color: Colors.cyan,
                                      size: 90,)
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Donor",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black,
                                          fontWeight:FontWeight.bold,
                                          fontSize: 22),
                                    ),

                                    Text(dname,
                                        textAlign: TextAlign.start,
                                        style:TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,)
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1.1,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.verified_user_sharp,
                                  color: Colors.cyan,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text("Individual",
                                    textAlign: TextAlign.start,
                                    style:TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,)
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.people,
                                  color: Colors.cyan,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  "Serves :",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                                Text(serve,
                                    textAlign: TextAlign.start,
                                    style:TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,)
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                ); ;
              },
            );
          }
        )
    );
  }
}
