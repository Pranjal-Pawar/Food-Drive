import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/utils/Receiverconfirmscreenarg.dart';
class YOrderDetails extends StatefulWidget {
  const YOrderDetails({Key? key}) : super(key: key);

  @override
  State<YOrderDetails> createState() => _YOrderDetailsState();
}

class _YOrderDetailsState extends State<YOrderDetails> {
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final args=ModalRoute.of(context)!.settings.arguments as Receiverconfirmscreenarg;
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Donar ${args.dname}",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.cyan[50],
                            fontWeight:FontWeight.bold,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                      IconButton(
                        onPressed:(){},
                        icon:Icon(
                          Icons.call_sharp,
                          size: 35,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        args.person,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.cyan[50],
                            fontWeight:FontWeight.normal,
                            fontStyle: FontStyle.italic
                        ),
                      ),

                      IconButton(
                        onPressed:(){},
                        icon:Icon(
                          Icons.message_sharp,
                          size: 35,
                          color: Colors.white,
                        ),
                      )
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
                            args.type,
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
                            "Serves nearly  ${args.serve}",
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
                            args.description,
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
                            args.address,
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
                            "Time until the order expires:",
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                          Text(
                            args.date+", "+args.time,
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
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
                child:TextButton(
                    onPressed: ()async {
                      Map<String,dynamic> map={
                        "serve":args.serve,
                        "mobile":args.mobile,
                        "description":args.description,
                        "address":args.address,
                        "date":args.date,
                        "time":args.time,
                        "type": args.type,
                        "uid":args.duid,
                        "name":args.dname,
                        "person":args.person

                      };
                      FirebaseFirestore.instance
                          .collection('receiverpendinglist')
                          .add(map);

                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(args.duid)
                          .collection('donorpendinglist')
                          .add(map);

                      String id1;
                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(args.duid)
                          .collection('donorconfirmlist')
                          .where("duid",isEqualTo: args.duid)
                          .where("ruid",isEqualTo: args.ruid)
                          .where("dname",isEqualTo: args.dname)
                          .where("rname",isEqualTo: args.rname)
                          .where("mobile",isEqualTo: args.mobile)
                          .where("type",isEqualTo: args.type)
                          .where("description",isEqualTo: args.description)
                          .where("date",isEqualTo: args.date)
                          .where("time",isEqualTo: args.time)
                          .where("serve",isEqualTo: args.serve)
                          .where("person",isEqualTo: args.person)
                          .get()
                          .then((value){
                        id1=value.docs[0].id;
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(args.duid)
                            .collection('donorconfirmlist')
                            .doc(id1)
                            .delete();
                      } );
                      String id2;
                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(args.ruid)
                          .collection('receiverconfirmlist')
                          .where("duid",isEqualTo: args.duid)
                          .where("ruid",isEqualTo: args.ruid)
                          .where("dname",isEqualTo: args.dname)
                          .where("rname",isEqualTo: args.rname)
                          .where("mobile",isEqualTo: args.mobile)
                          .where("type",isEqualTo: args.type)
                          .where("description",isEqualTo: args.description)
                          .where("date",isEqualTo: args.date)
                          .where("time",isEqualTo: args.time)
                          .where("serve",isEqualTo: args.serve)
                          .where("person",isEqualTo: args.person)
                          .get()
                          .then((value){
                        id2=value.docs[0].id;
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(args.ruid)
                            .collection('receiverconfirmlist')
                            .doc(id2)
                            .delete();
                      } );
                      Navigator.pop(context);
                    },
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.cancel_sharp,
                          color: Colors.white,
                          size: 38,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'CANCEL',
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ],
                    )
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.green,
                ),
                child:TextButton(
                    onPressed: ()async {
                      Map<String,dynamic> map={
                        "serve":args.serve,
                        "mobile":args.mobile,
                        "description":args.description,
                        "address":args.address,
                        "date":args.date,
                        "time":args.time,
                        "type": args.type,
                        "duid":args.duid,
                        "dname":args.dname,
                        "ruid":_auth.currentUser!.uid,
                        "rname":_auth.currentUser!.displayName,
                        "person":args.person

                      };
                      FirebaseFirestore.instance
                      .collection("users")
                      .doc(args.ruid)
                      .collection('receiverhistorylist')
                      .add(map);

                      FirebaseFirestore.instance
                      .collection("users")
                      .doc(args.duid)
                      .collection('donarhistorylist')
                      .add(map);

                      String id1;
                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(args.duid)
                          .collection('donorconfirmlist')
                          .where("duid",isEqualTo: args.duid)
                          .where("ruid",isEqualTo: args.ruid)
                          .where("dname",isEqualTo: args.dname)
                          .where("rname",isEqualTo: args.rname)
                          .where("mobile",isEqualTo: args.mobile)
                          .where("type",isEqualTo: args.type)
                          .where("description",isEqualTo: args.description)
                          .where("date",isEqualTo: args.date)
                          .where("time",isEqualTo: args.time)
                          .where("serve",isEqualTo: args.serve)
                          .where("person",isEqualTo: args.person)
                          .get()
                          .then((value){
                        id1=value.docs[0].id;
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(args.duid)
                            .collection('donorconfirmlist')
                            .doc(id1)
                            .delete();
                      } );
                      String id2;
                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(args.ruid)
                          .collection('receiverconfirmlist')
                          .where("duid",isEqualTo: args.duid)
                          .where("ruid",isEqualTo: args.ruid)
                          .where("dname",isEqualTo: args.dname)
                          .where("rname",isEqualTo: args.rname)
                          .where("mobile",isEqualTo: args.mobile)
                          .where("type",isEqualTo: args.type)
                          .where("description",isEqualTo: args.description)
                          .where("date",isEqualTo: args.date)
                          .where("time",isEqualTo: args.time)
                          .where("serve",isEqualTo: args.serve)
                          .where("person",isEqualTo: args.person)
                          .get()
                          .then((value){
                        id2=value.docs[0].id;
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(args.ruid)
                            .collection('receiverconfirmlist')
                            .doc(id2)
                            .delete();
                      } );
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
                          'RECEIVED',
                          style: TextStyle(color: Colors.white, fontSize: 23),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
