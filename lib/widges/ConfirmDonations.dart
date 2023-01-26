import 'package:flutter/material.dart';
import 'package:food_donation/Donations/condonations.dart';

import 'donations_widget.dart';

class ConfirmDonations extends StatelessWidget {
  const ConfirmDonations({Key? key}) : super(key: key);

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

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:ListView.builder(
                  itemCount: ConfirmDonationsList.donations.length,
                  itemBuilder: (context,index){
                    return Donationwidget(donation:ConfirmDonationsList.donations[index]) ;
                  },
              ),
          ),
        ),


      );

  }
}
