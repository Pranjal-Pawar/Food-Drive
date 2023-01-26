import 'package:flutter/material.dart';

import '../Orders/Porders.dart';
import '../utils/routes.dart';

class RpastorderWidget extends StatelessWidget {
    final Orders Porders;
    const RpastorderWidget({super.key,required this.Porders});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin:EdgeInsets.all(7),
        color: Colors.white,
        elevation: 1.7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          // side: BorderSide(
          //   color: Colors.cyan,
          // )
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

                      Text("${Porders.Name}",
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
                  Text("${Porders.Donar}",
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
                  Text("${Porders.Serves}",
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
                    "Date:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  Text("${Porders.Date}",
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
                    Icons.circle_sharp,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Type:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  Text("${Porders.Type}",
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
    );
  }
}
