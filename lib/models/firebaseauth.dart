// ignore_for_file: unused_field, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'profile_sqflite.dart';

class FBase {
  static final _firebaseauth = FirebaseAuth.instance;
  static final _firebasestore = FirebaseFirestore.instance;

  static late User userhandler;

  static Future<String> createUser(
      String userName, String userEmail, String pass, String phone) async {
    try {
      var userCred = await _firebaseauth.createUserWithEmailAndPassword(
        email: userEmail,
        password: pass,
      );

      // Get the user object from the user credential
      var user = userCred.user;

      // Store additional user information in Firestore
      await FirebaseFirestore.instance
          .collection("userinfo")
          .doc(user!.uid)
          .set({
        'username': userName,
        'email': userEmail,
        'phone': phone,
      });

      // Return success message
      return 'Success';
    } catch (e) {
      // Handle errors
      print('Error creating user: $e');
      return 'Error: $e';
    }
  }

  static Future<String> signIn(String userEmail, String pass) async {
    try {
      var userCred = await _firebaseauth.signInWithEmailAndPassword(
          email: userEmail, password: pass);
      userhandler = userCred.user!;
    } on FirebaseAuthException catch (error) {
      return error.message ?? 'Authentication failed';
    }
    return 'Success';
  }

  static Future<String> signInRetrieveUserData(
      String userEmail, String pass) async {
    try {
      var userCred = await _firebaseauth.signInWithEmailAndPassword(
          email: userEmail, password: pass);
      userhandler = userCred.user!;
      final docRef = _firebasestore
          .collection("userinfo")
          .where("email", isEqualTo: userEmail);
      await docRef.get().then((values) {
        print('hamada');
        for (var value in values.docs) {
          Profile.insertProfile(
              name: value.data()['username'],
              phone: value.data()['phone'],
              email: value.data()['email']);
        }
      });
    } on FirebaseAuthException catch (error) {
      return error.message ?? 'Authentication failed';
    }
    return 'Success';
  }

  // Future addcard(Todo card) async {
  //   _firebasestore.collection('cards').add({
  //     'taskname': card.item,
  //     'taskprio': card.prio,
  //     'usermail': userhandler.email
  //   });
  //   await readcards();
  // }

  // Future readcards() async {
  //   List<Todo> templist = [];
  //   final docRef = _firebasestore
  //       .collection("cards")
  //       .where('usermail', isEqualTo: userhandler.email);
  //   await docRef.get().then((values) {
  //     for (var value in values.docs) {
  //       templist.add(Todo.firebase(
  //           value.data()['taskprio'], value.data()['taskname'], value.id));
  //     }
  //     Todo.tolist = templist;
  //   });
  // }

  // Future deletecards(String id) async {
  //   await _firebasestore.collection("cards").doc(id).delete();
  //   await readcards();
  // }
}
