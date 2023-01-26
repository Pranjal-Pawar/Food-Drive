import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_donation/RecieverAuthentication/LoginReceiver.dart';

Future<User?>ReceiversignUp(String name,String address,String mobile,String email,String password,
    String confirmpassword)async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    print("Account Created Successfully");
    userCredential.user!.updateDisplayName(name);

    await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
     "key":"receiver",
      "name": name,
      "address": address,
      "phoneNo": mobile,
      "email": email,
      "password": password,
      "confirmPasswaord": confirmpassword,
      "uid":_auth.currentUser!.uid

    });
    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}
Future<User?> receiverlogIn(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  try {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    print("Login Successfully");

    _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      userCredential.user!.updateDisplayName(value['name']);
    });

    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}


Future receiverlogOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => LoginpageR()));
    });
  } catch (e) {
    print(e);
  }
}
