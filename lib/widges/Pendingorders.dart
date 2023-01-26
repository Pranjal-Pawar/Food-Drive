import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/Orders/Porders.dart';
import 'package:food_donation/utils/Receiverpendingscreenarg.dart';
import 'package:food_donation/widges/Porders_widget.dart';

import '../utils/routes.dart';
class Pendingorders extends StatefulWidget {
  const Pendingorders({Key? key}) : super(key: key);

  @override
  State<Pendingorders> createState() => _PendingordersState();
}

class _PendingordersState extends State<Pendingorders> {
  var firestore=FirebaseFirestore.instance.collection("receiverpendinglist").snapshots();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Color.fromARGB(255, 248, 243, 247),
      appBar: AppBar(
        backgroundColor:Colors.cyan,
        title: Padding(
          padding: const EdgeInsets.only(left:33),
          child: Text(
            "Pending Orders"
          ),
        ),
      ),
      body:StreamBuilder(
        stream: firestore,
        builder: (context,snapshot){
          if(!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: (snapshot.data! as QuerySnapshot).docs.length,
            itemBuilder:(context,index){
              String address=(snapshot.data!as QuerySnapshot).docs[index]['address'];
              String date=(snapshot.data!as QuerySnapshot).docs[index]['date'];
              String decription=(snapshot.data!as QuerySnapshot).docs[index]['decription'];
              String mobile=(snapshot.data!as QuerySnapshot).docs[index]['mobile'];
              String serve=(snapshot.data!as QuerySnapshot).docs[index]['serve'];
              String time=(snapshot.data!as QuerySnapshot).docs[index]['time'];
              String type=(snapshot.data!as QuerySnapshot).docs[index]['type'];
              String uid=(snapshot.data!as QuerySnapshot).docs[index]['uid'];

              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, MyRoutes.POrderDetails,
                  arguments: Receiverpendingscreenarg(
                    address,date,decription,mobile,serve,time,type,uid
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

                                  Text("pqrs",
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
                          Row(
                            children: [
                              Icon(
                                Icons.access_alarm_outlined,
                                color: Colors.cyan,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "Available upto :",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                              Text(date+","+" "+time,
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
        },
      )
    );
  }
}

