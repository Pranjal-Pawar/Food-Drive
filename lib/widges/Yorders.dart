import 'package:flutter/material.dart';
import 'package:food_donation/Orders/Yourorders.dart';
import 'package:food_donation/widges/Yorders_widget.dart';
class Yorders extends StatelessWidget {
  const Yorders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 243, 247),
        appBar: AppBar(
          backgroundColor:Colors.cyan,
          title: Padding(
            padding: const EdgeInsets.only(left:33),
            child: Text(
                "Your Orders"
            ),
          ),
        ),
        body:ListView.builder(
          itemCount: YourOrdersList.Yourorders.length,
          itemBuilder:(context,index){
            return Yourorderwidget(Yourorders:YourOrdersList.Yourorders[index]) ;
          },
        )
    );
  }
}
