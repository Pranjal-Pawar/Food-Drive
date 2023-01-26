import 'package:flutter/material.dart';

import '../Orders/Porders.dart';
import 'Rpastorder_widget.dart';
class Rpastorder extends StatelessWidget {
  const Rpastorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummylist=List.generate(5, (index) => PendingOrdersList.Porders[0]);
    return Scaffold(
        backgroundColor:Color.fromARGB(255, 248, 243, 247),
        appBar: AppBar(
          backgroundColor:Colors.cyan,
          title: Padding(
            padding: const EdgeInsets.only(left:33),
            child: Text(
                "History"
            ),
          ),
        ),
        body:ListView.builder(
          itemCount: PendingOrdersList.Porders.length,
          itemBuilder:(context,index){
            return RpastorderWidget(Porders:PendingOrdersList.Porders[index]) ;
          },
        )

    );
  }
}
