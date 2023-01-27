import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:food_donation/Donations/condonations.dart';

import 'donations_widget.dart';

class ConfirmDonations extends StatefulWidget {
  const ConfirmDonations({Key? key}) : super(key: key);

  @override
  State<ConfirmDonations> createState() => _ConfirmDonationsState();
}

class _ConfirmDonationsState extends State<ConfirmDonations> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final CollectionReference firestore=FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    final dummyList=List.generate(5, (index) => ConfirmDonationsList.donations[0]);
    return Container(
      color: Color.fromARGB(255, 248, 243, 247),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text(
              "Confirm Donations"
          ),

        ),

        body: StreamBuilder(
          stream: firestore.doc(_auth.currentUser!.uid).collection("donorconfirmlist")
            .snapshots(),
          builder: (context, snapshot) {
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child:ListView.builder(
                      itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                      itemBuilder: (context,index){
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


                        return Card(
                            color: Color.fromARGB(255, 242, 255, 255),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(
                                  color: Colors.cyan,
                                )
                            ),

                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              // width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Row(
                                    children: [
                                      Text(
                                        "Date :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(date,
                                          textAlign: TextAlign.start,
                                          style:TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,)
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Serves :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
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
                                      Text(
                                        "Category :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(type,
                                          textAlign: TextAlign.start,
                                          style:TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,)
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Text(
                                        "Description :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(description,
                                          textAlign: TextAlign.start,
                                          style:TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,)
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    children: [
                                      Text(
                                        "Order Confirm by :",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(rname,
                                          textAlign: TextAlign.start,
                                          style:TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,)
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 140,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.cyan,
                                        ),
                                        child:TextButton(

                                            onPressed: () async {
                                                await FlutterPhoneDirectCaller.callNumber(mobile);
                                            },
                                            child:Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.call_sharp,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  'Call',
                                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                                ),
                                              ],
                                            )
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 140,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.cyan,
                                        ),
                                        child:TextButton(
                                            onPressed: () {},
                                            child:Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.message_sharp,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  'message',
                                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                                ),
                                              ],
                                            )
                                        ),
                                      ),

                                    ],
                                  )






                                ],
                              ),
                            )
                        );
                      },
                  ),
              );
          }
        ),
        ),


      );

  }
}
