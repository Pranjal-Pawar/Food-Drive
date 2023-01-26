import 'package:flutter/material.dart';
import '../Donations/condonations.dart';

class Donationwidget extends StatelessWidget {
  final Donation donation;

  const Donationwidget({super.key,required this.donation});

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
                  Text("${donation.Date}",
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
                  Text("${donation.Serves}",
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
                  Text("${donation.Category}",
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
                  Text("${donation.Description}",
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
                  Text("${donation.OrderConfirmedby}",
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
