import 'package:flutter/material.dart';
import 'package:food_donation/utils/routes.dart';
import 'package:food_donation/DonorAuthentication/donarLP.dart';
import 'package:food_donation/widges/drawer.dart';


class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Drive"),
        backgroundColor:Colors.cyan,
      ),
      //drawer: Mydrawer(),
      body: Center(
        child: Column(
          children: [
            Image.asset('Assets/images/donation1.jpg'),
            SizedBox(
              height:250,
              width: 50,
            ),
            Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      onPrimary:Colors.white,
                      minimumSize: Size(100, 50),
                    ),
                    onPressed: ()=>{
                      Navigator.pushNamed(context,MyRoutes.logind)
                    },
                      child:Text('Donar'),
                  ),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      onPrimary:Colors.white,
                      minimumSize: Size(100, 50),
                    ),
                    onPressed: ()=>{
                      Navigator.pushNamed(context,MyRoutes.loginr)
                    },
                    child:Text('Receiver'),
                  )
                ],
              ),
            )
          ],

        ),
      ),
    );

  }
}
