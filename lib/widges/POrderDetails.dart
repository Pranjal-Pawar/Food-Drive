import 'package:flutter/material.dart';
import 'package:food_donation/utils/routes.dart';

import '../utils/Receiverpendingscreenarg.dart';
class POrderDetails extends StatefulWidget {
  const POrderDetails({Key? key}) : super(key: key);

  @override
  State<POrderDetails> createState() => _POrderDetailsState();
}

class _POrderDetailsState extends State<POrderDetails> {


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
                        "Donar ABCD",
                        style: TextStyle(
                            fontSize: 28,
                          color: Colors.cyan[50],
                          fontWeight:FontWeight.bold,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                      SizedBox(
                        width:150,
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
                    children: [
                      Text(
                        "Individual",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.cyan[50],
                            fontWeight:FontWeight.normal,
                            fontStyle: FontStyle.italic
                        ),
                      ),
                      SizedBox(
                        width:210,
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
                onPressed: () {},
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
