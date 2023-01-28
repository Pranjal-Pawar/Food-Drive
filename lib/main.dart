import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/Homepage.dart';
import 'package:food_donation/utils/routes.dart';
import 'package:food_donation/widges/ConfirmDonations.dart';
import 'package:food_donation/widges/Dhistory.dart';
import 'package:food_donation/widges/Donatenow.dart';
import 'package:food_donation/widges/Dprofile.dart';
import 'package:food_donation/RecieverAuthentication/LoginReceiver.dart';
import 'package:food_donation/widges/POrderDetails.dart';
import 'package:food_donation/widges/PendingDonations.dart';
import 'package:food_donation/widges/Pendingorders.dart';
import 'package:food_donation/widges/Rpastorder.dart';
import 'package:food_donation/widges/Rprofile.dart';
import 'package:food_donation/widges/YOrderDetails.dart';
import 'package:food_donation/widges/Yorders.dart';
import 'package:food_donation/DonorAuthentication/donarLP.dart';
import 'package:food_donation/widges/ChatRoom.dart';
import 'package:food_donation/widges/donaroptionpg.dart';
import 'package:food_donation/widges/receiveroptionpg.dart';
import 'package:food_donation/DonorAuthentication/signupD.dart';
import 'package:food_donation/RecieverAuthentication/signupR.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization=Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context,snapshot){
          //Check for Errors
          if(snapshot.hasError){
            print("Something went wrong");
          }
          //once completed,show your application
          if(snapshot.connectionState==ConnectionState.done){
            return ThemeProvider(
              initTheme:ThemeData.light(),
              child:Builder(
                  builder: (context)=>MaterialApp(
                    initialRoute:MyRoutes.homeRoute,
                    routes: {
                      MyRoutes.homeRoute:(context)=>Homepage(),
                      MyRoutes.logind:(context)=>LoginpageD(),
                      MyRoutes.signupd:(context)=>SignupD(),
                      MyRoutes.loginr:(context)=>LoginpageR(),
                      MyRoutes.signupr:(context)=>SignupR(),
                      MyRoutes.donaroptionpg:(context)=>donaroptionpage(),
                      MyRoutes.ConfirmDonations:(context)=>ConfirmDonations(),
                      MyRoutes.PendingDonations:(context)=>PendingDonations(),
                      MyRoutes.Donatenow:(context)=>Donatenow(),
                      MyRoutes.receiveroptionpg:(context)=>receiveropyionpg(),
                      MyRoutes.Pendingorders:(context)=>Pendingorders(),
                      MyRoutes.Yorders:(context)=>Yorders(),
                      MyRoutes.POrderDetails:(context)=>POrderDetails(),
                      MyRoutes.YOrderDetails:(context)=>YOrderDetails(),
                      MyRoutes.Rprofile:(context)=>Rprofile(),
                      MyRoutes.Rpastorder:(context)=>Rpastorder(),
                      MyRoutes.Dprofile:(context)=>Dprofile(),
                      MyRoutes.Dhistory:(context)=>Dhistory(),

                    },
                  )
              )
            );
          }
          return CircularProgressIndicator();
        },

    );
  }

}

