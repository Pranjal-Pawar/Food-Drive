import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/widges/pdonations_widget.dart';

import '../Donations/pendingdonations.dart';


class PendingDonations extends StatefulWidget {
  const PendingDonations({Key? key}) : super(key: key);

  @override
  State<PendingDonations> createState() => _PendingDonationsState();
}

class _PendingDonationsState extends State<PendingDonations> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final CollectionReference _firestore=
  FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    final dummyList=List.generate(5, (index) => PendingDonationsList.pdonations[0]);
    return Container(
      color: Color.fromARGB(255, 248, 243, 247),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text(
              "Pending Donations"
          ),

        ),

        body: StreamBuilder<QuerySnapshot>(
          stream: _firestore
          .doc(_auth.currentUser!.uid)
          .collection('donorpendinglist')
          .snapshots(),
          builder:
          (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
            if(!snapshot.hasData)
              return Center(child: CircularProgressIndicator());
              return Padding(
              padding: const EdgeInsets.all(16.0),
              child:ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                  Map<String,dynamic> _map=snapshot.data!.docs[index]
                  .data() as Map<String,dynamic>;
                  return  Card(
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
                            //
                            Row(
                              children: [
                                Text(
                                  "Date :",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(_map['date'],
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
                                Text(_map['serve'],
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
                                Text(
                                    _map['type'],
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
                                Text(_map['decription'],
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
                                Text("Not yet",
                                    textAlign: TextAlign.start,
                                    style:TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,)
                                ),
                              ],
                            )



                          ],
                        ),
                      )
                  );;
                },
              ),
            );
          },
        )
      ),


    );

  }
}
