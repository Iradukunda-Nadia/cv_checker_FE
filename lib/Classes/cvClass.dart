

import 'package:cv_checker/Services/commonService.dart';
import 'package:flutter/material.dart';

class CV {
  String? jobSeekerId;
  String? jobSeekerName;
  String? email;
  String? phone;
  String? dob;
  String? jobSector;
  String? experienceLevel;
  List? experience;
  List? education;
  List? skills;


  CV({
    this.jobSeekerId,
    this.jobSeekerName,
    this.email,
    this.phone,
    this.dob,
    this.jobSector,
    this.experienceLevel,
    this.experience,
    this.education,
    this.skills,
  });


  factory CV.fromJson(Map<String, dynamic> responseData) {
    return CV(
      jobSeekerId: responseData['jobSeekerId'] ??'',
      jobSeekerName: responseData['jobSeekerName'] ??'',
        email: responseData['email']??'',
        phone: responseData['phone']??'',
        dob: responseData['dob']??'',
        jobSector: responseData['jobSector']??'',
        experienceLevel: CommonService().experienceString
          (responseData['experienceLevel']??0),
        experience: responseData['experience']??[],
        education: responseData['education']??[],
        skills: responseData['skills']??[],

    );
  }
}