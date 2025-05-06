import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class UserModel extends ChangeNotifier {
  final String id;
  final String name;
  final String email;
  final String password;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
  });

  final List<UserModel> _users = [];
  UnmodifiableListView<UserModel> get users => UnmodifiableListView(_users);
  final _db = FirebaseFirestore.instance;


  void signup(UserModel user, BuildContext context) async {
    final encodedPassword =
    base64.encode(utf8.encode(user.password));
    var ref = await _db
        .collection("users")
        .where("email", isEqualTo: user.email)
        .get();
    print(ref.docs.length);

    final usr = <String, dynamic>{
      "id": user.id,
      "name": user.name,
      "email": user.email,
      "password": encodedPassword,
      "createdAt": user.createdAt,
      "timestamp": FieldValue.serverTimestamp(),
    };

    _users.add(user);
    print(ref.docs.length);

    if (ref.docs.isEmpty) {
      print(ref.docs.length);
      _db.collection("users").doc(user.id).set(usr).then((_) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("user added successfully"),
            ),
          );
          Navigator.of(context).pushNamed('/login');
        }
        print("user added successfully");
      }).catchError((e) {
        print(e.toString());
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('error signing in...'),
            ),
          );
        }
        print(e);
      });
    } else {
      print('failed to add user');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('user with email already exists'),
          ),
        );
        Navigator.of(context).pushNamed('/signup');
      }
    }
    notifyListeners();
  }

  void login(String email, String password, BuildContext context) async {
    late  QuerySnapshot<Map<String, dynamic>>? emailInDb;
    late QuerySnapshot<Map<String, dynamic>>? passwordInDb;
    try{
       emailInDb =
      await _db.collection("users").where("email", isEqualTo: email).get().catchError( (e) => print("Error getting document: $e"),);
       passwordInDb = await _db
          .collection("users")
          .where("password", isEqualTo:  base64.encode(utf8.encode(password)))
          .get().catchError((e) => print("Error getting document: $e"),);
    }catch(e){
      print(e.toString());
      print('failed to login');
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('login failed'),),);
        Navigator.of(context).pushNamed('/login');
      }
    }


    // print(emailInDb.docs.first.data()['email']);
    // print(passwordInDb.docs.first.data()['password']);
    // print(utf8.decode(base64.decode(passwordInDb.docs.first.data()['password'])));

    var decodedPassword = utf8.decode(base64.decode(passwordInDb?.docs.first.data()['password']));

        if (emailInDb?.docs.first.data()['email'] == email &&
            decodedPassword == password) {
          print('login successful');
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 1),
                content: Text('login successful'),
              ),
            );
            Navigator.of(context).pushNamed('/quickquizhome');
          }
        } else {
          print('failed to login');
          if(context.mounted){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('login failed'),),);
            Navigator.of(context).pushNamed('/login');
          }

      }

  }

  void updateUser(UserModel user, int index) async {
    final usr = <String, dynamic>{
      "id": user.id,
      "name": user.name,
      "email": user.email,
      "password": user.password,
      "createdAt": user.createdAt,
      "timestamp": FieldValue.serverTimestamp(),
    };
    UserModel updateUser = _users.elementAt(index);
    updateUser = user;
    _db
        .collection("users")
        .doc(user.id)
        .set(usr, SetOptions(merge: true))
        .catchError((e) {
      print(e);
    });
    notifyListeners();
  }

  void deleteUser(int index) {
    _users.removeAt(index);
    notifyListeners();
  }

  void removeAllUsers() {
    _users.clear();
    notifyListeners();
  }
}
