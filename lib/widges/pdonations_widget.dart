import 'package:flutter/material.dart';

import '../Donations/pendingdonations.dart';


class PDonationwidget extends StatelessWidget {
  final PDonation pdonation;

  const PDonationwidget({super.key,required this.pdonation});

  @override
  Widget build(BuildContext context) {
    return
      Card(
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
                    Text("${pdonation.Date}",
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
                    Text("${pdonation.Serves}",
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
                    Text("${pdonation.Category}",
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
                    Text("${pdonation.Description}",
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
                    Text("${pdonation.OrderConfirmedby}",
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
      );

  }
}