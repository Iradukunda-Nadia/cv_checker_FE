import 'dart:async';
import 'dart:convert';
import 'package:cv_checker/AppUtils/lists.dart';
import 'package:cv_checker/Services/apiService.dart';
import 'package:cv_checker/Services/appURLS.dart';
import 'package:cv_checker/Services/commonService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../Providers/userProvider.dart';


class CvService {
  Future<Map<String, dynamic>> createCV(cxt) async {
    var user = Provider.of<UserProvider>(cxt, listen: false);

    var cvData = {
      "fileName": user.user.fullName,
      "jobSector": Lists.categories.indexOf(user.cv.jobSector??"IT"),
      "educationLevel": CommonService().getEducationLevelInt(user.cv
      .education),
      "experienceLevel": CommonService().experience(user.cv.experienceLevel),
      "qualificationScore": CommonService().getEducationLevelInt(user.cv
          .education),
      "userId": user.user.id
    };
    var result;
    final response = await ApiService().returnConnection().post(
        Uri.parse(ApiService.apiServer + AppUrl.cvCreate),
        body: json.encode(cvData),
        headers: {
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      result = {'status': true, 'message': 'Successful'};
    } else {
      print(response.body);
      result = {'status': false, 'message': json.decode(response.body)};
      Sentry.captureException('Error creating CV:  ${result}');
    }
    return result;
  }

  Future<Map<String, dynamic>> saveEducation(data)
  async {
    var result;

    final response = await ApiService().returnConnection().post(
        Uri.parse(ApiService.apiServer + AppUrl.educationQ),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      result = {'status': true, 'message': 'Successful'};
    } else {
      print(response.body);
      result = {'status': false, 'message': json.decode(response.body)};
      Sentry.captureException('error saving Education  ${result}');
    }
    return result;
  }

  Future<Map<String, dynamic>> saveExperience(data)
  async {
    var result;

    final response = await ApiService().returnConnection().post(
        Uri.parse(ApiService.apiServer + AppUrl.experience),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      result = {'status': true, 'message': 'Successful'};
    } else {
      print(response.body);
      result = {'status': false, 'message': json.decode(response.body)};
      Sentry.captureException('error saving Experience  ${result}');
    }
    return result;
  }

  Future<Map<String, dynamic>> saveProfession(String? userId, context, data)
  async {
    var result;

    final response = await ApiService().returnConnection().post(
        Uri.parse(ApiService.apiServer + AppUrl.pQ),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      result = {'status': true, 'message': 'Successful'};
    } else {
      print(response.body);
      result = {'status': false, 'message': json.decode(response.body)};
      Sentry.captureException('error saving Professional Qualification'
          '${result}');
    }
    return result;
  }

  Future<Map<String, dynamic>> saveSkills(data)
  async {
    var result;

    final response = await ApiService().returnConnection().post(
        Uri.parse(ApiService.apiServer + AppUrl.pQ),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      result = {'status': true, 'message': 'Successful'};
    } else {
      print(response.body);
      result = {'status': false, 'message': json.decode(response.body)};
      Sentry.captureException('error saving Professional Qualification'
          '${result}');
    }
    return result;
  }

  Future<Map<String, dynamic>> getCV(String? userId, context, data)
  async {
    var result;

    final response = await ApiService().returnConnection().get(
        Uri.parse(ApiService.apiServer + AppUrl.getCV),
        headers: {
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      result = {'status': true, 'message': json.decode(response.body)};
    } else {
      print(response.body);
      result = {'status': false, 'message': json.decode(response.body)};
      Sentry.captureException('error saving Professional Qualification'
          '${result}');
    }
    return result;
  }



}