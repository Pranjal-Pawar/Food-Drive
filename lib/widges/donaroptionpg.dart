import 'package:flutter/material.dart';
import 'package:food_donation/utils/routes.dart';

import '../DonorAuthentication/Methods.dart';

class donaroptionpage extends StatelessWidget {
  const donaroptionpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: (){},
                icon:Icon(
                  Icons.info_outline_rounded,
                  color: Colors.white,
                ),
              ),
           Padding(
             padding: const EdgeInsets.only(left:70.0),
             child: (
                 Text("Food Drive")
             ),
           ),
          ],
        ),
        actions: [
          Container(
            child: IconButton(
              onPressed: (){
                dLogOut(context) ;
              },
              icon:Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          )
        ],
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Container(
        color: Color.fromARGB(255, 248,243,247),
        child: Stack(children: [
          Stack(
            children: [
              Container(
                height: size.height/ 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width/7.8),
                    color: Colors.cyan
                ),
              ),
              Container(
                height: size.height/ 2.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.width/7.8),
                    color: Color.fromARGB(255, 248, 243, 247),
                ),
              ),
              Container(
                height: size.height/2.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.width/7.8),
                  color: Colors.cyan
                ),
              ),
              Container(
                height: size.height/3.5,
                decoration: BoxDecoration(
                  color: Colors.cyan
                ),
              )
            ],),
          Padding(padding:const EdgeInsets.only(top:102.0),
            child: GridView.count(crossAxisCount: 2,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, MyRoutes.Dprofile);
                  },
                  child:Card(
                    elevation: 3.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        CircleAvatar(
                            backgroundImage: AssetImage("Assets/images/profile.png"),
                            radius: 50),
                        SizedBox(
                          height: 10.0,
                        ),
                        Flexible(
                            child:Text(
                              "Profile",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            )
                        )
                      ],),
                    ),
                  ) ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context,MyRoutes.ConfirmDonations);
                  },
                  child:Card(
                    elevation: 3.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("Assets/images/confirm orders.png"),
                        radius: 50),
                        SizedBox(
                          height: 10.0,
                        ),
                        Flexible(
                            child:Text(
                              "Confirm Donations",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            )
                        )
                      ],),
                    ),
                  ) ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                   Navigator.pushNamed(context,MyRoutes.PendingDonations);
                  },
                  child:Card(
                    elevation: 3.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        CircleAvatar(
                            backgroundImage: AssetImage("Assets/images/pending orders.png"),
                            radius: 50),
                        SizedBox(
                          height: 10.0,
                        ),
                        Flexible(
                            child:Text(
                              "Pending Donations",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            )
                        )
                      ],),
                    ),
                  ) ,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context,MyRoutes.Donatenow);
                  },
                  child:Card(
                    elevation: 3.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        CircleAvatar(
                            backgroundImage: AssetImage("Assets/images/Donate now.png"),
                            radius: 50),
                        SizedBox(
                          height: 10.0,
                        ),
                        Flexible(
                            child:Text(
                              "Donate now",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            )
                        )
                      ],),
                    ),
                  ) ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    Navigator.pushNamed(context,MyRoutes.Dhistory);
                  },
                  child:Card(
                    elevation: 3.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        CircleAvatar(
                            backgroundImage: AssetImage("Assets/images/history.png"),
                            radius: 50),
                        SizedBox(
                          height: 10.0,
                        ),
                        Flexible(
                            child:Text(
                              "History",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            )
                        )
                      ],),
                    ),
                  ) ,
                ),
              ),
            ],),
          ),
        ],
        ),
      ),

    );



  }
}
