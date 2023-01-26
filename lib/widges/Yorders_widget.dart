import 'package:flutter/material.dart';
import 'package:food_donation/utils/routes.dart';

import '../Orders/Yourorders.dart';

class Yourorderwidget extends StatelessWidget {
  final YOrders Yourorders;
  const Yourorderwidget({super.key,required this.Yourorders});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, MyRoutes.YOrderDetails);
      },
      child: Card(
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

                        Text("${Yourorders.Name}",
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
                    Text("${Yourorders.Donar}",
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
                    Text("${Yourorders.Serves}",
                        textAlign: TextAlign.start,
                        style:TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,)
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     Icon(
                //       Icons.access_alarm_outlined,
                //       color: Colors.cyan,
                //     ),
                //     SizedBox(
                //       width: 10.0,
                //     ),
                //     Text(
                //       "Available upto :",
                //       style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.normal
                //       ),
                //     ),
                //     Text("${Porders.Date}",
                //         textAlign: TextAlign.start,
                //         style:TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.normal,)
                //     ),
                //   ],
                // ),


              ],
            ),
          )
      ),
    );
  }
}
