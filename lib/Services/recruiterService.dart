import 'dart:async';
import 'dart:convert';
import 'package:cv_checker/Classes/jobClass.dart';
import 'package:cv_checker/Services/apiService.dart';
import 'package:cv_checker/Services/appURLS.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';


class RecruiterService {
  Future<Map<String, dynamic>> login(data) async {
    var result;

    final response = await ApiService().returnConnection().post(
        Uri.parse(ApiService.apiServer + AppUrl.recruiterLogin),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      result = {'status': true, 'data': json.decode(response.body)};
    } else {
      print(response.body);
      result = {'status': false, 'message': json.decode(response.body)};
      Sentry.captureException('Error logging in Job seeker: ${result}');
    }
    return result;
  }

  Future<Map<String, dynamic>> signUp(data) async {
    var result;

    final response = await ApiService().returnConnection().post(
        Uri.parse(ApiService.apiServer + AppUrl.recruiterSignup),
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
      Sentry.captureException('Error Signing up Job seeker: ${result}');
    }
    return result;
  }

  Future<Map<String, dynamic>> postJob(data) async {
    var result;

    final response = await ApiService().returnConnection().post(
        Uri.parse(ApiService.apiServer + AppUrl.createJob),
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
      Sentry.captureException('Error Signing up Job seeker: ${result}');
    }
    return result;
  }

  Future<Map<String, dynamic>> getJobSeekers(data) async {
    var result;

    final response = await ApiService().returnConnection().post(
        Uri.parse(ApiService.apiServer + AppUrl.getCandidates),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
        });
    print(response.statusCode);
    if (response.statusCode == 200) {
      result = {'status': true, 'message': json.decode(response.body)};
      return result;

    } else {
      print(response.body);
      result = {'status': false, 'message': json.decode(response.body)};
      Sentry.captureException('Error Signing up Job seeker: ${result}');
      throw(json.decode(response.body));
    }
    return result;
  }


}