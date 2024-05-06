

import 'package:cv_checker/Services/commonService.dart';
import 'package:flutter/material.dart';

class Job {
  String? jobId;
  String? recruiterId;
  String? title;
  String? experience;
  String? description;
  String? recruiterName;
  String? websiteURL;
  String? yrs;
  String? location;
  List? specialSkill;
  String? createdDate;


  Job({
    this.jobId,
    this.recruiterId,
    this.title,
    this.experience,
    this.description,
    this.recruiterName,
    this.websiteURL,
    this.yrs,
    this.location,
    this.specialSkill,
    this.createdDate
  });


  factory Job.fromJson(Map<String, dynamic> responseData) {
    return Job(
      jobId: responseData['id'].toString() ??'',
      recruiterId: responseData['recruiterId'].toString() ??'',
      title: responseData['title']??'',
      experience: CommonService().experienceString
        (responseData['experience']??0),
      description: responseData['description']??'',
      recruiterName: responseData['recruiterName']??'',
      websiteURL: responseData['websiteURL']??'',
      yrs: responseData['yrs']??'',
      location: responseData['location']??'',
      specialSkill: (responseData['specialSkill'].split(","))??[],
      createdDate: responseData['createdDate']??'',

    );
  }
}