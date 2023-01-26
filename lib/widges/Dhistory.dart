import 'package:flutter/material.dart';
import 'package:food_donation/widges/Dhistory_widget.dart';

import '../Donations/pendingdonations.dart';
class Dhistory extends StatelessWidget {
  const Dhistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList=List.generate(5, (index) => PendingDonationsList.pdonations[0]);
    return Container(
      color: Color.fromARGB(255, 248, 243, 247),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text(
              "History"
          ),

        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:ListView.builder(
            itemCount: PendingDonationsList.pdonations.length,
            itemBuilder: (context,index){
              return DhistoryWidget(pdonation:PendingDonationsList.pdonations[index]) ;
            },
          ),
        ),
      ),

    );
  }
}
