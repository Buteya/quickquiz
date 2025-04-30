import 'dart:collection';

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

  void addUser(UserModel user){
    _users.add(user);
    notifyListeners();
  }

  void updateUser(UserModel user,int index){
    UserModel updateUser = _users.elementAt(index);
    updateUser = user;
    notifyListeners();
  }

  void deleteUser(int index){
    _users.removeAt(index);
    notifyListeners();
  }

  void removeAllUsers(){
    _users.clear();
    notifyListeners();
  }

}
