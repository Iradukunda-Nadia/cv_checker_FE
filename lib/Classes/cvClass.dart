

import 'package:flutter/material.dart';

class CV {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? dob;
  String? jobInterest;
  String? experienceLevel;
  List? experience;
  List? education;
  List? skills;


  CV({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.dob,
    this.jobInterest,
    this.experienceLevel,
    this.experience,
    this.education,
    this.skills,
  });


  factory CV.fromJson(Map<String, dynamic> responseData) {
    return CV(
      id: responseData['id'] ??'',
        name: responseData['name'] ??'',
        email: responseData['email']??'',
        phone: responseData['phone']??'',
        dob: responseData['dob']??'',
        jobInterest: responseData['jobInterest']??'',
        experienceLevel: responseData['experienceLevel']??'',
        experience: responseData['experience']??[],
        education: responseData['education']??[],
        skills: responseData['skills']??[],

    );
  }
}