

import 'package:flutter/material.dart';

class User {
  String? id;
  String? role;
  String? fullName;
  String? email;


  User({
    this.id,
    this.fullName,
    this.role,
    this.email
  });


  factory User.fromJson(Map<String, dynamic> responseData) {
    return  User(
      id: responseData['id'] ??'',
      fullName: responseData['fullName']??'',
      email: responseData['email']??'',
      role: responseData['role']??'',
    );
  }
}