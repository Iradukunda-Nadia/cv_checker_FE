

import 'package:flutter/material.dart';

class Job {
  String? id;
  String? title;
  String? experienceLevel;
  String? description;
  String? company;
  String? webLink;
  String? yrs;
  String? location;
  List? skills;


  Job({
    this.id,
    this.title,
    this.experienceLevel,
    this.description,
    this.company,
    this.webLink,
    this.yrs,
    this.location,
    this.skills,
  });


  factory Job.fromJson(Map<String, dynamic> responseData) {
    return Job(
      id: responseData['name'] ??'',
      title: responseData['title']??'',
      experienceLevel: responseData['experienceLevel']??'',
      description: responseData['description']??'',
      company: responseData['company']??'',
      webLink: responseData['webLink']??'',
      yrs: responseData['yrs']??'',
      location: responseData['location']??'',
      skills: responseData['skills']??[],

    );
  }
}