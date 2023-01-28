import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/utils/routes.dart';
import '../utils/Receiverpendingscreenarg.dart';
class POrderDetails extends StatefulWidget {
  const POrderDetails({Key? key}) : super(key: key);

  @override
  State<POrderDetails> createState() => _POrderDetailsState();
}

class _POrderDetailsState extends State<POrderDetails> {
  final FirebaseAuth _auth=FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    final arggs= ModalRoute.of(context)!.settings.arguments as Receiverpendingscreenarg;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width:double.infinity,
          height:100 ,
            color: Colors.cyan,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Donar ${arggs.name}",
                        style: TextStyle(
                            fontSize: 28,
                          color: Colors.cyan[50],
                          fontWeight:FontWeight.bold,
                          fontStyle: FontStyle.italic
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        arggs.person,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.cyan[50],
                            fontWeight:FontWeight.normal,
                            fontStyle: FontStyle.italic
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 550,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Container(
                   height: 110,
                   child: Padding(
                     padding: const EdgeInsets.only(top:16,left: 16),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text(
                           "Type:",
                           style: TextStyle(
                             fontSize: 24,
                             color: Colors.black,
                             fontWeight:FontWeight.bold,
                           ),
                         ),
                         Text(
                           arggs.type,
                           style: TextStyle(
                             fontSize: 24,
                             color: Colors.black54,
                             fontWeight:FontWeight.normal,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                  Divider(
                    thickness: 3,
                  ),
                  Container(
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(top:16,left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Range:",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Serves nearly ${arggs.serve}",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  Container(
                    height: 110,
                    child: Padding(
                      padding: const EdgeInsets.only(top:16,left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Food Description:",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          Text(
                            arggs.decription,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  Container(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(top:16,left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address:",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          Text(
                            arggs.address,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                  Container(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.only(top:16,left: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Time until the donation expires:",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          Text(
                            arggs.date+", "+arggs.time,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontWeight:FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 3,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[50],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.green,

            ),
            child:TextButton(
                onPressed: () async{
                  String id1;
                  FirebaseFirestore.instance
                      .collection('receiverpendinglist')
                      .where("uid",isEqualTo: arggs.uid)
                  .where("name",isEqualTo: arggs.name)
                  .where("mobile",isEqualTo: arggs.mobile)
                  .where("type",isEqualTo: arggs.type)
                  .where("description",isEqualTo: arggs.decription)
                  .where("date",isEqualTo: arggs.date)
                  .where("time",isEqualTo: arggs.time)
                  .where("serve",isEqualTo: arggs.serve)
                  .where("person",isEqualTo: arggs.person)
                  .get()
                  .then((value){
                    id1=value.docs[0].id;
                    FirebaseFirestore.instance
                    .collection('receiverpendinglist')
                    .doc(id1)
                    .delete();
                  });
                  String id2;
                  FirebaseFirestore.instance
                  .collection("users")
                  .doc(arggs.uid)
                  .collection('donorpendinglist')
                  .where("uid",isEqualTo: arggs.uid)
                      .where("name",isEqualTo: arggs.name)
                      .where("mobile",isEqualTo: arggs.mobile)
                      .where("type",isEqualTo: arggs.type)
                      .where("description",isEqualTo: arggs.decription)
                      .where("date",isEqualTo: arggs.date)
                      .where("time",isEqualTo: arggs.time)
                      .where("serve",isEqualTo: arggs.serve)
                      .where("person",isEqualTo: arggs.person)
                  .get()
                  .then((value){
                    id2=value.docs[0].id;
                    FirebaseFirestore.instance
                    .collection('users')
                    .doc(arggs.uid)
                    .collection('donorpendinglist')
                    .doc(id2)
                    .delete();
                  } );
                  Map<String,dynamic> map={
                    "serve":arggs.serve,
                    "mobile":arggs.mobile,
                    "description":arggs.decription,
                    "address":arggs.address,
                    "date":arggs.date,
                    "time":arggs.time,
                    "type": arggs.type,
                    "duid":arggs.uid,
                    "dname":arggs.name,
                    "person":arggs.person,
                    "ruid":_auth.currentUser!.uid,
                    "rname":_auth.currentUser!.displayName,


                  };


                  FirebaseFirestore.instance
                  .collection('users')
                  .doc(_auth.currentUser!.uid)
                  .collection('receiverconfirmlist')
                  .add(map);
                  Map<String,dynamic> map2={
                    "serve":arggs.serve,
                    "mobile":arggs.mobile,
                    "description":arggs.decription,
                    "address":arggs.address,
                    "date":arggs.date,
                    "time":arggs.time,
                    "type": arggs.type,
                    "duid":arggs.uid,
                    "dname":arggs.name,
                    "person":arggs.person,
                    "ruid":_auth.currentUser!.uid,
                    "rname":_auth.currentUser!.displayName,
                  };
                  FirebaseFirestore.instance
                  .collection('users')
                  .doc(arggs.uid)
                  .collection('donorconfirmlist')
                  .add(map2);
                  Navigator.pop(context);
                  
                  

                },
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 38,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'CONFIRM',
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
