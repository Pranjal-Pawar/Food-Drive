import 'package:flutter/material.dart';
import 'package:food_donation/utils/routes.dart';
class receiveropyionpg extends StatelessWidget {
  const receiveropyionpg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 120.0),
              child: Text("Food Drive"),
            )
          ],
        ),
        actions: [
          Container(
            child: IconButton(
              onPressed: (){},
              icon: Icon(
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
        child: Stack(
          children: [
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, MyRoutes.Rprofile);
                      },
                      child:Padding(
                        padding: const EdgeInsets.fromLTRB(16.0,3,16,3),
                        child: Card(
                          elevation: 3.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.5),
                            child: Row(children: [
                              CircleAvatar(
                                  backgroundImage: AssetImage("Assets/images/profile.png"),
                                  radius: 45),
                              SizedBox(
                                width: 10.0,
                              ),
                              Flexible(
                                  child:Text(
                                    "Profile",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )
                              )
                            ],),
                          ),
                        ),
                      ) ,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, MyRoutes.Yorders);
                        },
                        child:Padding(
                          padding: const EdgeInsets.fromLTRB(16.0,3,16,3),
                          child: Card(
                            elevation: 3.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.5),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                      backgroundImage: AssetImage("Assets/images/order (1).png"),
                                      radius: 45),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                      child:Text(
                                        "Your Orders",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black,
                                          fontSize: 18),
                                      )
                                  )
                                ],
                              ),
                            ),

                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, MyRoutes.Pendingorders);
                        },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16,3,16,3),
                        child: Card(
                          elevation: 3.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.5),
                            child: Row(
                              children: [
                                CircleAvatar(
                                    backgroundImage: AssetImage("Assets/images/fast-food (1).png"),
                                    radius: 45),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Flexible(
                                    child:Text(
                                      "Pending Orders",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black,
                                        fontSize: 18),
                                    )
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, MyRoutes.Rpastorder);
                      },
                      child:Padding(
                        padding: const EdgeInsets.fromLTRB(16,3,16,3),
                        child: Card(
                          elevation: 3.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.5),
                            child: Row(children: [
                              CircleAvatar(
                                  backgroundImage: AssetImage("Assets/images/history.png"),
                                  radius: 45),
                              SizedBox(
                                width: 10.0,
                              ),
                              Flexible(
                                  child:Text(
                                    "History",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black,
                                      fontSize: 18),
                                  )
                              )
                            ],),
                          ),
                        ),
                      ) ,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
