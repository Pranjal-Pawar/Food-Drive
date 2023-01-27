// import 'package:flutter/material.dart';
// class Donatenow extends StatelessWidget {
//   Donatenow({
//     super.key,
//   required this.isLoading, required this.autovalidateMode,
//   });
//   // final bool isLoading;
//   // final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
//   // final descripIp= TextEditingController();
//   // final rangeIp = TextEditingController();
//   // static TextEditingController range= TextEditingController();
//   // final AutovalidateMode autovalidateMode;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Donate Now"),
//         backgroundColor:Colors.cyan,
//       ),
//       body:isLoading
//     ? Center(
//     child: Container(
//     child: CircularProgressIndicator(),
//     width: 20,
//     ))
//         : GestureDetector(
//         onTap: () {
//           FocusScope.of(context).requestFocus(new FocusNode());
//     },
//     child: Container(
//       margin: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
//       height: MediaQuery.of(context).size.height,
//       child: Form(
//         key: _formKey,
//        autovalidateMode: autovalidateMode,
//         child: ListView(children: <Widget>[
//           Container(
//             child: TextFormField(
//               controller: rangeIp,
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(),
//                 errorBorder: OutlineInputBorder(),
//                 contentPadding: EdgeInsets.all(10.0),
//                 enabledBorder: OutlineInputBorder(),
//                 labelText: 'People you can serve',
//               ),
//               textInputAction: TextInputAction.next,
//               keyboardType: TextInputType.number,
//               validator: (val){
//                 if(val!.isEmpty || int.parse(val!)<=0){
//                   return 'Please enter a valid number';
//                 }
//                 return null;
//               },
//               onSaved: (value){
//                 range=int.parse(value!.trim()) as TextEditingController;
//               },
//             ),
//           ),
//           Divider(),
//
//         ],),
//
//       ),
//     ),
//
//
//     ));
//}
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Donatenow extends StatefulWidget {
   Donatenow({Key? key}) : super(key: key);

  @override
  State<Donatenow> createState() => _DonatenowState();
}

class _DonatenowState extends State<Donatenow> {
  final TextEditingController _serve=TextEditingController();
  final TextEditingController _mobile=TextEditingController();
  final TextEditingController _description=TextEditingController();
  final TextEditingController _address=TextEditingController();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final CollectionReference _firestore= FirebaseFirestore.instance.collection("users");
  final FirebaseFirestore _firestore2=FirebaseFirestore.instance;
  final CollectionReference _firestore1=FirebaseFirestore.instance.collection("users");
  // Map<String,dynamic> map=_firestore1
  //     .doc(_auth.currentUser!.uid)
  //     .snapshots() as Map<String,dynamic>;

  late DateTime pickedDate;
  late TimeOfDay time1;
  late TimeOfDay time2;
  bool isVege = false;
  bool isNVeg = false;

  bool _checkboxValid() {
    if (isVege == isNVeg) {
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time1 = TimeOfDay.now();
    time2 = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    String date = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    String fromTime = "${time1.hour} : ${time1.minute}";
    String toTime = "${time2.hour} : ${time2.minute}";
    // Map<String,dynamic>map = _firestore2.doc(_auth.currentUser!.uid).get()as Map<String,dynamic>;

    return StreamBuilder<DocumentSnapshot>(

      stream: _firestore.doc(_auth.currentUser!.uid).snapshots(),
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor:  Color.fromARGB(255, 248, 243, 247),
            appBar: AppBar(
              title: Text("Donate Now"),
              backgroundColor: Colors.cyan,
            ),
            body: SingleChildScrollView(
              child: Column(

                children: [
                  Container(

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _serve,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10.0),
                          errorBorder: OutlineInputBorder(),
                          labelText: 'People you can serve',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                         controller: _mobile,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10.0),
                          labelText: 'Your Contact Number',
                        ),
                        keyboardType: TextInputType.number,
                        maxLength: 10,

                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                        controller: _description,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(15.0),
                          labelText: 'Description of food',
                        ),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextField(
                       controller: _address,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(),
                          errorBorder: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(15.0),
                          labelText: ' Your Address',
                        ),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                  ),
                  Divider(),
                  Row(
                    children: [
                      Text('  Availabe upto:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),
                    ],
                  ),
                  Card(
                    margin: EdgeInsets.fromLTRB(15, 3.5, 15, 3.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(25, 0, 15, 0),
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.black,
                          ),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              date,
                              style: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 25),
                            ),
                            IconButton(
                                onPressed: () async {
                                  DateTime? date = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(DateTime
                                          .now()
                                          .year - 5),
                                      lastDate: DateTime(DateTime
                                          .now()
                                          .year + 5),
                                      initialDate: pickedDate,
                                      builder: (context, child) =>
                                          Theme(
                                            data: ThemeData.light().copyWith(
                                              primaryColor: Colors.cyan,
                                              accentColor: Colors.cyan,
                                              colorScheme: ColorScheme.light(
                                                primary: Colors.cyan,
                                              ),
                                              buttonTheme: ButtonThemeData(
                                                  textTheme: ButtonTextTheme
                                                      .primary),
                                            ),
                                            child: child!,
                                          ));

                                  if (date != null) {
                                    setState(() {
                                      pickedDate = date;
                                    });
                                  }
                                },
                                icon: Icon(
                                  Icons.date_range,
                                  color: Colors.cyan,
                                )),
                          ],
                        )),
                  ),
                  //SizedBox(height: 10),
                  Divider(),
                  Card(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),

                    ),
                    margin: EdgeInsets.fromLTRB(15, 3.5, 15, 3.5),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(25, 0, 15, 0),
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.black,
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(fromTime,
                              style: TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 25)),
                          IconButton(
                              onPressed: () async {
                                TimeOfDay? t1 = await showTimePicker(
                                    context: context,
                                    initialTime: time1,
                                    builder: (context, child) =>
                                        Theme(
                                          data: ThemeData.light().copyWith(
                                            primaryColor: Colors.cyan,
                                            accentColor: Colors.cyan,
                                            colorScheme: ColorScheme.light(
                                                primary: Colors.cyan),
                                            buttonTheme: ButtonThemeData(
                                                textTheme: ButtonTextTheme.primary),
                                          ),
                                          child: child!,
                                        ));

                                if (t1 != null) {
                                  setState(() {
                                    time1 = t1;
                                  });
                                }
                              },
                              icon: Icon(
                                Icons.lock_clock,
                                color: Colors.cyan,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Food Category: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                  ),
                  CheckboxListTile(
                    title: Text(
                      'Veg: ',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    value: isVege,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        isVege = value!;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Non-Veg: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    value: isNVeg,
                    activeColor: Colors.red,
                    onChanged: (value) {
                      setState(() {
                        isNVeg = value!;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Select any ONE checkbox',
                      style: TextStyle(
                        fontSize: 15,
                        color: _checkboxValid()
                            ? Colors.transparent
                            : Colors.red[900],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.cyan[50],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.cyan,

                  ),
                  child:TextButton(
                      onPressed: () async {

                        Map<String,dynamic>donorpendinglist={
                          "serve":_serve.text,
                          "mobile":_mobile.text,
                          "description":_description.text,
                          "address":_address.text,
                          "date":date,
                          "time":fromTime,
                          "type": isVege?"Vegetarian":"NonVegetarian",
                          "uid":_auth.currentUser!.uid,
                          "name":_auth.currentUser!.displayName.toString(),
                          "person":snapshot.data!['person']

                          // "name":_auth.currentUser!.displayName.toString()
                        };
                        _firestore
                        .doc(_auth.currentUser!.uid)
                        .collection('donorpendinglist')
                        .add(donorpendinglist);
                        _firestore2
                        .collection('receiverpendinglist')
                        .doc()
                        .set(donorpendinglist);

                        Navigator.of(context).pop();
                        },
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.group_add,
                              color: Colors.white,
                              size: 27,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Donate',
                              style: TextStyle(color: Colors.white, fontSize: 23),
                            ),
                          ],
                        )
                      ),
                ),
              ),

            )
        );
      }
    );
  }
}



